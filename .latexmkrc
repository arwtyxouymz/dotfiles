#!/usr/bin/env perl
$pdf_previewer = 'start evince-synctex %S "code -g %f:%l"';
$out_dir = "build";
$latex            = 'uplatex -halt-on-error';
$latex_silent     = 'uplatex -halt-on-error -interaction=batchmode';
$bibtex           = 'upbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$pdf_mode = 3;
