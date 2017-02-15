#!/bin/bash

if [ "$1" = "--help" ] ; then
  echo "
    SYNOPSIS
    spell-check.sh input

    DESCRIPTION
    This script allows you (and Travis) to spellcheck a LaTeX document, correctly ignoring mathematical formulae.
	The output of this script is a sorted list of words that ***might*** be mispelled. Sometimes there may be false-positives!
	Generated reports can be found in 'spell-check-temp' directory.
	
    ARGUMENTS
    input) Input LaTeX document path: Path of the *.tex document to analyze

    EXAMPLES
    spell-check.sh LaTex/documenti/Glossario/Glossario.tex -> output in terminal the list of " 
  exit 0
fi

if [ -z "$1" ] ; then
	echo "Error: arguments missing"
	exit 11
fi

texFileName="$(basename "$1")"
# strip extensions
texName="${texFileName%.*}"
# last directory name
directoryName="$(basename $(dirname $1))"

mkdir -p spell-check-temp/"$directoryName"

output=spell-check-temp/"$directoryName"/"$texName".spellchecked

cat "$1" | aspell --lang=en --personal=./.aspell.en.pws -t list | aspell --lang=it --personal=./.aspell.it.pws -t list | sort -u > "$output"

# echo "Cleaning empty file"
if [ ! -s "$output" ] ; then 
	rm "$output"
fi
