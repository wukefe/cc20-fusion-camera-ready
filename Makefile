.PHONY: all paper long clean artifact

all: paper

paper:
	pdflatex -halt-on-error $@
	bibtex $@
	pdflatex -halt-on-error $@
	pdflatex -halt-on-error $@
	pdflatex -halt-on-error $@

long:
	pdflatex -halt-on-error $@
	bibtex $@
	pdflatex -halt-on-error $@
	pdflatex -halt-on-error $@
	pdflatex -halt-on-error $@

diff:
	pdflatex -halt-on-error $@
	bibtex $@
	pdflatex -halt-on-error $@
	pdflatex -halt-on-error $@
	pdflatex -halt-on-error $@

build:
	pdflatex -halt-on-error paper

spell:
	detex paper.tex | aspell -a | env LANG=C sort -u > ok-words
	cat ok-words | python clean-words.py

compare:
	detex paper.tex | aspell -a | env LANG=C sort -u | env LANG=C comm -23 - ok-words

grammar:  ## copy to grammar check
	detex paper.tex > only-words.txt

artifact:
	set -x && cd artifact && pdflatex -halt-on-error main

clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.blg
	rm -f *.log
	rm -f *.lof
	rm -f *.lot
	rm -f *.toc
	rm -f *.out
	rm -f *~

clean-diff: clean
	rm -f diff-ready.tex
	rm -f diff-submitted.tex


