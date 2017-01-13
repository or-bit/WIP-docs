#!/bin/sh

# e => exits script as soon as one command returns a non-zero exit code
# v => print script line before executing it
set -ev

# salvataggio percorso in cui si trova lo script
parent=$pwd
echo $parent;

pwd;
ls -l;



build_output_directory=$parent/$1;
echo $build_output_directory;

cd LaTex/documenti/Glossario/

pwd;
ls -l;

# comando di build latex, parametri specificati
pdflatex -interaction=nonstopmode -halt-on-error -output-directory $build_output_directory Glossario.tex