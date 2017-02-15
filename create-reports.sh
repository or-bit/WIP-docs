#!/bin/bash -x

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

##### CONSTS
TITLE="Report documentazione: $docName"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"


##### FUNCTIONS
function add_style {
	echo ""
}

function create_page {
	cat <<- _EOF_ 
	<!doctype html>
	<html>
		<head>
			<title>$TITLE</title>
			<style>$(add_style)</style>
		</head>
		<body>
			<h1>$TITLE</h1>
			<p>$TIME_STAMP</p>
			
		</body>
	</html>
_EOF_

}

$(create_page) > test.html
