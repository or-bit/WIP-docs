#!/bin/bash

if [ "$1" = "--help" ] ; then
  echo "
    SYNOPSIS
    spell-check.sh input

    DESCRIPTION
    This script allows you (and Travis) to spellcheck a LaTeX document, correctly ignoring mathematical formulae.
	The output of this script is a sorted list of words that ***might*** be mispelled. Sometimes there may be false-positives!
	Default output is stdout. In order to persist it to a file use piping.
	
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

mkdir -p spell-check-temp

output=spell-check-temp/"$texName".spellchecked

cat "$1" | aspell --lang=en --personal=./.aspell.en.pws -t list | aspell --lang=it -t list | sort -u > "$output"

# echo "Cleaning empty file"
if [ ! -s "$output" ] ; then 
	rm "$output"
fi