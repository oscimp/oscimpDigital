all: 4-fpga_FIR.pdf

4-fpga_FIR.pdf: 4-fpga_FIR.tex figures/mesures.pdf
	pdflatex $^
	pdflatex $^

clean:
	rm *.log *.aux *.pdf *.out
