#!/bin/bash

BENCHMARKS="silo"
#BENCHMARKS="XSBench graph500 gapbs-pr liblinear silo btree speccpu-bwaves speccpu-roms"
#BENCHMARKS="gapbs-pr"
#NVM_RATIO="1:2 1:8 1:16"

NVM_RATIO="1:2 1:8"

sudo dmesg -c

for BENCH in ${BENCHMARKS};
do
    for NR in ${NVM_RATIO};
    do
	./scripts/0_run_bench.sh -B ${BENCH} -R ${NR} --cxl -V memtis-cxl
    done
done