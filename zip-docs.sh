#!/bin/bash

# print help
if [ "$1" = "--help" ] ; then
  echo "
    SYNOPSIS
    zip-docs.sh [OPTION]

    DESCRIPTION
    This script allows you (and Travis) to zip the compiled LaTeX documents of the Monolith project. Before using this script, execute script 'build-latex.sh'.

    OPTION
    -r, --release : Profile for release export."
  exit 0
fi

source common.config

TOZIP=$PDFROOT

# delete all unnecessary files
find "$PDFROOT" -type f ! -name '*.pdf' -delete

# if 'release' profile selected, copy docs to 'release' location
if [ "$1" = "-r" -o "$1" = "--release" ] ; then
	cp -r "$PDFROOT" "$RELEASE"
	TOZIP=$RELEASE
fi

# zip output directory for Travis deployment
zip -r Documentazione.zip "$TOZIP"