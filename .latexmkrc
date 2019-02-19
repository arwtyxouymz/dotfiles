#!/usr/bin/perl

$latex = 'platex -kanji=utf-8 -synctex=1 %S';
$latex_silent     = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$dvipdf = 'dvipdfmx %S';
$bibtex = 'pbibtex';
$makeindex        = 'mendex %O -o %D %S';
$pdf_mode = 3; # use dvipdf
$pdf_update_method = 2;
$pdf_previewer = "evince";
$max_repeat       = 5;
# Prevent latexmk from removing PDF after typeset.
$pvc_view_file_via_temporary = 0;
$out_dir = "build";
