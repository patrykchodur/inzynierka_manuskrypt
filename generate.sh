#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Error: please provide .tex name"
	exit -1
fi

NAME=${1%".tex"}

pdflatex "$NAME".tex
rm "$NAME".{aux,log}
rm *-converted-to.pdf
