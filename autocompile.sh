#!/bin/bash

if [ -z "$(whereis inotifywait)" ] ; then
    printf " inotify-tools not installed\n"
else
    printf " inotify-tools installed: proceeding\n"
    while : ; do
        inotifywait -e modify main.tex
        pdflatex main.tex
        bibtex main.aux
        pdflatex main.tex
        pdflatex main.tex
        printf "DONE COMPILING\n"
    done
fi
