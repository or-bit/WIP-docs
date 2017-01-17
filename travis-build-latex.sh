#!/bin/sh

if [ "$1" = "--help" ] ; then
  echo "
    SYNOPSIS
    travis-build-latex.sh ARG1 ARG2 ARG3 [ARG4]

    DESCRIPTION
    This script allows Travis to build a generic PDF using pdflatex based on the arguments specified.

    ARGUMENTS
    ARG1) Input folder: Folder that contains all files used to build the LaTeX document
    ARG2) LaTeX document name
    ARG3) PDF output folder: Folder in which the PDF will be stored if LaTeX compilation is successfull
    ARG4) Output PDF name (**optional**). If not set, PDF name is named as the source LaTeX document name.

    EXAMPLES
    travis-build-latex.sh LaTex/documenti/Glossario Glossario.tex _travis-build -> PDF: ./_travis-build/Glossario.pdf
    travis-build-latex.sh LaTex/documenti/Glossario Glossario.tex _travis-build \"G O\" -> PDF: ./_travis-build/G O.pdf"
  exit 0
fi

# e => exits script as soon as one command returns a non-zero exit code
# v => print script line before executing it
set -ev

# salvataggio percorso in cui si trova lo script
parent=$(pwd)

input_path=$1
document_name=$2
build_output_directory=$parent/$3
pdf_name=$4

cd $input_path

# comando di build latex http://stackoverflow.com/questions/3863630/latex-tableofcontents-command-always-shows-blank-contents-on-first-build
latexmk -halt-on-error -outdir=$build_output_directory -pdf $document_name

# ora rinomino l'output se è stato specificato l'ultimo parametro
if [ $# -eq 4 ] ; then
    doc_name_no_ext=${document_name%%.*}
    mv "$build_output_directory/$doc_name_no_ext.pdf" "$build_output_directory/$pdf_name.pdf"
		ls -la $build_output_directory
fi
