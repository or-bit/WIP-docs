#!/bin/sh

# e => exits script as soon as one command returns a non-zero exit code
# v => print script line before executing it
set -ev

# salvataggio percorso in cui si trova lo script
parent=$(pwd)

input_path=$1
document_name=$2
build_output_directory=$parent/$3

cd $input_path

# comando di build latex http://stackoverflow.com/questions/3863630/latex-tableofcontents-command-always-shows-blank-contents-on-first-build
latexmk -diagnostics -halt-on-error -outdir=$build_output_directory -pdf $document_name