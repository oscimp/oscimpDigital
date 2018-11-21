all: 2-PL.pdf

2-PL.pdf: 2-PL.tex
	pdflatex $^
	pdflatex $^

french: 2-PL_french.tex
	pdflatex $^
	pdflatex $^

clean:
	rm *.log *.aux *.pdf *.out
