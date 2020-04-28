#!/bin/bash
set -xeuo pipefail  # this is "bash safe mode", which catches many errors. use it!
# Make an output directory for our QC'd reads
mkdir -p outputs/1_qc/
# in an ideal world we'd read sample IDs from some external file shared between
# all scripts
for srr in SRR097977 SRR098026
do
	# run scythe, an adaptor trimmer, on each raw read file
	scythe \
		-a "rawdata/illumina_adapters.fa" \
		-q sanger \
		-o "outputs/1_qc/${srr}_qcd.fastq" \
		"rawdata/reads/${srr}.fastq"
done
