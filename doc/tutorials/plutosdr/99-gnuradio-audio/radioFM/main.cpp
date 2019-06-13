#include <iostream>
#include <boost/make_shared.hpp>
#include <boost/thread/thread.hpp> //sleep
#include <boost/program_options.hpp>

#include <gnuradio/analog/quadrature_demod_cf.h>
#include <gnuradio/audio/sink.h>
#include <gnuradio/filter/fir_filter_ccf.h>
#include <gnuradio/filter/fir_filter_fff.h>
#include <gnuradio/filter/firdes.h>
#include <gnuradio/filter/iir_filter_ffd.h>
#include <gnuradio/iio/pluto_source.h>
#include <gnuradio/top_block.h>

#include <math.h>

int main(void)
{
	double samp_rate = 48000*32/2;
	unsigned long long frequence = 102400000;

	gr::top_block_sptr top_block;
	top_block = gr::make_top_block("Acquisition test");

	boost::shared_ptr<gr::iio::pluto_source> source = gr::iio::pluto_source::make("local:",
		       			frequence, (unsigned long)samp_rate, 20000000, 0x8000,
					true, true, true, "manual", 55, "", true);
	boost::shared_ptr<gr::filter::fir_filter_ccf> lpf = gr::filter::fir_filter_ccf::make(8, 
			gr::filter::firdes::low_pass(1, samp_rate, 150000, 100000, gr::filter::firdes::WIN_HAMMING, 6.76));

	top_block->connect(source, 0, lpf, 0);
	//top_block->connect(throttle, 0, lpf, 0);


	/* wfm reimplementation */
		/*boost::shared_ptr<gr::filter::fir_filter_ccf> analog_wfm_rcv_0 = analog.wfm_rcv(
		quad_rate=samp_rate/8,
		audio_decimation=4,
	)*/
	double quad_rate = samp_rate/8;
	double audio_decimation = 4;

	double max_dev = 75e3;
	double fm_demod_gain = quad_rate/(2*M_PI/*math.pi*/*max_dev);
	double audio_rate = quad_rate / audio_decimation;

	// We assign to self so that outsiders can grab the demodulator
	// if they need to.  E.g., to plot its output.

	//input: complex; output: float
	boost::shared_ptr<gr::analog::quadrature_demod_cf> fm_demod = 
							gr::analog::quadrature_demod_cf::make(fm_demod_gain);


	// input: float; output: float
	/* fm_deemph reimplementation */
	//self.deemph = fm_deemph(audio_rate)
	double tau = 75e-6;
	double fs = audio_rate;
	
	// Digital corner frequency
	double w_c = 1.0 / tau;

	// Prewarped analog corner frequency
	double w_ca = 2.0 * fs * tan(w_c / (2.0 * fs));

	// Resulting digital pole, zero, and gain term from the bilinear
	// transformation of H(s) = w_ca / (s + w_ca) to
	// H(z) = b0 (1 - z1 z^-1)/(1 - p1 z^-1)
	double k = -w_ca / (2.0 * fs);
	double z1 = -1.0;
	double p1 = (1.0 + k) / (1.0 - k);
	double b0 = -k / (1.0 - k);

	//btaps = [ b0 * 1.0, b0 * -z1 ];
	std::vector<double> btaps;// = std::vector<double>(b0 * 1.0, b0 * -z1);
	btaps.push_back(b0 * 1.0);
	btaps.push_back(b0 * -z1);
	// ataps = [      1.0,      -p1 ];
	std::vector<double> ataps;//= std::vector<double>(1.0,-p1);
	ataps.push_back(1.0);
	ataps.push_back(-p1);

	// Since H(s = 0) = 1.0, then H(z = 1) = 1.0 and has 0 dB gain at DC

	boost::shared_ptr<gr::filter::iir_filter_ffd> deemph = gr::filter::iir_filter_ffd::make(btaps, ataps, false);
	//self.connect(self, deemph, self)

	/* fin de reimplementation */

	//compute FIR filter taps for audio filter
	double width_of_transition_band = audio_rate / 32;
	static std::vector<float> audio_coeffs =
				gr::filter::firdes::low_pass(1.0, // gain
					     quad_rate, // sampling rate
					     audio_rate/2 - width_of_transition_band,
					     width_of_transition_band,
					     gr::filter::firdes::WIN_HAMMING);
	// input: float; output: float
	boost::shared_ptr<gr::filter::fir_filter_fff> audio_filter = 
				gr::filter::fir_filter_fff::make(audio_decimation, audio_coeffs);

	// self.connect (self, self.fm_demod, self.audio_filter, self.deemph, self)
	top_block->connect(lpf, 0, fm_demod, 0);
	top_block->connect(fm_demod, 0, audio_filter, 0);
	top_block->connect(audio_filter, 0, deemph, 0);

	/* end of wfm reimplementation */

    	boost::shared_ptr<gr::audio::sink>audio_sink = gr::audio::sink::make(48000, "", true);

	top_block->connect(deemph, 0, audio_sink, 0);

	// EXPECT_NO_THROW( {
	top_block->start(); // Start threads and wait
	printf("hit a touch to stop app\n");
	getchar();
	top_block->stop();
	top_block->wait();
	//}) << "Failure running the top_block." << std::endl;

	return EXIT_SUCCESS;
}
