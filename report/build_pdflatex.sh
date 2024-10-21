#!/bin/bash
docker pull blang/latex:ubuntu
docker run --rm -v /repos/content_processing/report:/data blang/latex:ubuntu pdflatex /data/report.tex

# remove the intermediate files
rm -f report.aux report.log report.out report.toc