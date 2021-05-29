# Default target executed when no arguments are given to make.
default_target: all

# The shell in which to execute make rules.
SHELL = /bin/sh

# Special rule for the target all
all: texdraft biblio texdraft pdf
	echo "Compile all..."

rebuild: pdf biblio pdf2

texdraft:
	xelatex -draftmode thesis.tex

dvi:
	xelatex thesis.tex

pdf:
	xelatex thesis.tex

pdf2:
	xelatex thesis.tex; xelatex thesis.tex

index:
	makeindex thesis.idx

biblio:
	biber thesis || exit 0

nomencl:
	makeindex thesis.nlo -s nomencl.ist -o thesis.nls

clean:
	rm chapters/*.aux thesis.bcf thesis.run.xml thesis.toc thesis.aux thesis.bbl thesis.blg thesis.log thesis.out thesis.pdf
