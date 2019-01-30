all: 5-fpga_NCO.pdf

5-fpga_NCO.pdf: 5-fpga_NCO.tex figures/mesures.pdf
	pdflatex $^
	pdflatex $^

clean:
	rm *.log *.aux *.pdf *.out
