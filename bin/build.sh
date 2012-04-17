#!/bin/sh
rm -rf *.tar.gz && rm -rf man && bin/roxygenize.R && R CMD build . && R CMD check *.tar.gz
