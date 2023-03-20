#!/usr/bin/env bash

DM_START=2
DM_STOP=3000

# Pin to cores 0-7 (separate NUMA node from T0, and ensuring it doesn't get scheduled to T0's cores)
taskset -c 0-7 heimdall -k ${KEY} \
	-gpu_id 0 \
	-nsamps_gulp ${DADA_SAMPLES} \
	-nbeams 1 \
	-coincidencer 127.0.0.1:12345 \
	-dm ${DM_START} ${DM_STOP}
	
