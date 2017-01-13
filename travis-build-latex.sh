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

# comando di build latex, parametri specificati
pdflatex -interaction=nonstopmode -halt-on-error -output-directory $build_output_directory $input_path/$document_name