#!/bin/bash

function print_usage {
	echo "Usage:
	$0 [-r] file"
}

function process {
	pdflatex -halt-on-error "$NAME".tex
	return $?
}

if [ $# -lt 1 ]; then
	echo "Error: please provide .tex name"
	print_usage
	exit -1
fi

if [ $1 = "-r" ]; then
	NAME=${2%".tex"}
	REPEAT=true
else
	NAME=${1%".tex"}
	REPEAT=false
fi


if ! [ -f "${NAME}.tex" ]; then
	echo "Error: file does not exist"
	print_usage
	exit -1
fi

process "$NAME".tex
RETVAL=$?
if [ $REPEAT = true ]; then
	process "$NAME".tex
	RETVAL=$?
fi

exit $RETVAL

