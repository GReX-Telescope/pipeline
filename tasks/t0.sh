#!/usr/bin/env bash

AVG_POW=7
VBUF_POW=19
INJECT_S=3600
VOLTAGE_PATH="/hdd/data/voltages/"
FILTERBANK_PATH="/hdd/data/filterbanks/"

RUST_LOG=info ../t0/target/release/grex_t0 \
        --requant-gain 32 \
        -d ${AVG_POW} \
        --vbuf-power ${VBUF_POW} \
        --trig \
        --fpga-addr ${FPGA_ADDR}:69 \
        --injection-cadence ${INJECT_S} \
        --dump-path ${VOLTAGE_PATH} \
        --filterbank-path ${FILTERBANK_PATH} \
#        filterbank
#       psrdada -k ${KEY} -s ${DADA_SAMPLES}