#!/usr/bin/env bash

AVG_POW=4
VBUF_POW=19
INJECT_S=3600

/home/kiran/t0/target/release/grex_t0 \
	--requant-gain 10 \
	-d ${AVG_POW} \
	--vbuf-power ${VBUF_POW} \
	--fpga-addr ${FPGA_ADDR}:69 \
	--injection-cadence ${INJECT_S} \
	psrdada -k ${KEY} -s ${DADA_SAMPLES}
