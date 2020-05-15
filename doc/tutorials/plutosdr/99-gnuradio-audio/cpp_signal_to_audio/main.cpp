#include <iostream>
#include <gnuradio/top_block.h>
#include <gnuradio/blocks/file_source.h>
#include <gnuradio/blocks/throttle.h>
#include <gnuradio/analog/sig_source_waveform.h>
#include <gnuradio/analog/sig_source_f.h>
#include <gnuradio/msg_queue.h>
#include <boost/make_shared.hpp>
#include <boost/thread/thread.hpp> //sleep
#include <boost/program_options.hpp>

#include <gnuradio/audio/sink.h>

#include <math.h>

/*
        self.audio_sink_0 = audio.sink(48000, '', True)
        self.analog_sig_source_x_1 = analog.sig_source_f(samp_rate, analog.GR_SIN_WAVE, 1000, 1, 0)

self.connect((self.analog_sig_source_x_1, 0), (self.audio_sink_0, 0))

*/

int main(void)
{
	double samp_rate = 48000;

	gr::top_block_sptr top_block;
	top_block = gr::make_top_block("Acquisition test");

	boost::shared_ptr<gr::analog::sig_source_f> source = gr::analog::sig_source_f::make(samp_rate,
						gr::analog::GR_SIN_WAVE, 1000, 1, 0);

    boost::shared_ptr<gr::audio::sink>audio_sink = gr::audio::sink::make(samp_rate, "", true);

	top_block->connect(source, 0, audio_sink, 0);

	top_block->start(); // Start threads and wait
	printf("hit a key to stop app\n");
	getchar();
	top_block->stop();
	top_block->wait();

	return EXIT_SUCCESS;
}
