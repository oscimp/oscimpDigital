all: 3-fpga_PLPS.pdf

3-fpga_PLPS.pdf: 3-fpga_PLPS.tex
	pdflatex $^
	pdflatex $^

french: 3-fpga_PLPS_french.tex
	pdflatex $^
	pdflatex $^

clean:
	rm *.log *.aux *.pdf *.out
