#!/usr/bin/bash

infile=$1
outfile=$2
echo "input file is $infile, and output file is $outfile"
A3SS=`cat $infile|grep "structure \"1-,2-\";" |wc -l`
A5SS=`cat $infile|grep "structure \"1^,2^\";" |wc -l`
RI=`cat $infile|grep "structure \"0,1^2-\";" |wc -l`
ES=`cat $infile|grep "structure \"0,1-2^\";" |wc -l`
MXE=`cat $infile|grep "structure \"1^3-,2^4-\";" |wc -l`


echo "statistic results for $infile" >> $outfile
echo "A3SS: $A3SS" >> $outfile
echo "A5SS: $A5SS" >> $outfile
echo "RI: $RI" >> $outfile
echo "MXE: $MXE" >> $outfile
echo "ES: $ES" >> $outfile
echo "done"
