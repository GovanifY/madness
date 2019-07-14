#!/bin/sh
rm -r output/
mkdir -p output/archive
pdflatex madness.tex
bibtex madness 
pdflatex madness.tex
pdflatex madness.tex
mv *.aux *.bbl *.blg *.log *.pdf output/
tar -cvzf ./output/archive/switch-`date '+%Y%m%d%H%M%S'`.tar.gz --exclude "output/archive" -C ../ switch/
xdg-open output/madness.pdf
