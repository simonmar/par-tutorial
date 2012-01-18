all : cefp.pdf lab-exercises.pdf

clean :
	rm cefp.pdf *.bbl *.aux *.blg *.log *.out *.toc

%.pdf : %.tex %.bib
	pdflatex $<
	bibtex $*
	pdflatex $<
	pdflatex $<

cefp.pdf : par.tex conc.tex

lab-exercises.pdf : lab-exercises.tex
	pdflatex $<
	pdflatex $<

kmeans-example.png : kmeans-example-points kmeans-example-clusters
	gnuplot -e 'set key off; set terminal png; plot "kmeans-example-points","kmeans-example-clusters" with points pointsize 20 pointtype 6' >$@

kmeans-results.png : kmeans-results
	gnuplot -e 'set key off; set terminal png; plot "kmeans-results" with linespoints' >$@


upload : cefp.pdf lab-exercises.pdf
	scp cefp.pdf community:public_html/par-tutorial.pdf
	scp lab-exercises.pdf community:public_html/lab-exercises.pdf
