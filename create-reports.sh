#!/bin/bash

if [ "$1" = "--help" ] ; then
  echo "
    SYNOPSIS
    create-reports.sh input output

    DESCRIPTION
    This script allows you (and Travis) to build an HTML file that contains basic statistics of the specified input.

    ARGUMENTS
    input) Input path: Path of the *.tex document to analyze
    output) Output path: Path which will contain the report file

    EXAMPLES
    create-reports.sh LaTex/documenti/Glossario/Glossario.tex report"
  exit 0
fi

if [ -z "$1" -o -z "$2" ] ; then
	echo "Error: arguments missing"
	exit 1
fi

pdfFileName="$(basename "$1")"
# strip extensions
docName="${pdfFileName%.*}"

echo "$pdfFileName"
echo "$docName"
pdftotext "$1" > "$2"/"$docName".report
