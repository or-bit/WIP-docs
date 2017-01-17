#!/bin/bash

_tex="TEXINPUTS"
profile=~/.profile

if grep -q $_tex $profile ; then
	echo "Env Var 'TEXINPUTS' already configured."
	exit 0
else
	# salvo variabile ambiente TEXINPUTS per l'utente corrente
	echo "export TEXINPUTS=$(pwd)/LaTex/modello//:${TEXINPUTS}" >> $profile
	
	# aggiorno lista delle variabili d'ambiente disponibili per l'utente corrente
	source $profile
	
	echo "Test corretta inizializzazione variabile d'ambiente"
	echo $TEXINPUTS
fi