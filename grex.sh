#!/usr/bin/env bash
NC='\033[0m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'

echo -e "
${LIGHTGREEN}
░██████╗░██████╗░███████╗██╗░░██╗ 
██╔════╝░██╔══██╗██╔════╝╚██╗██╔╝
██║░░██╗░██████╔╝█████╗░░░╚███╔╝░
██║░░╚██╗██╔══██╗██╔══╝░░░██╔██╗░
╚██████╔╝██║░░██║███████╗██╔╝╚██╗
░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝
${NC}
"

###### Initial Setup
CHANNELS=2048
export DADA_SAMPLES=200000
export KEY=b0ba
export FPGA_ADDR="192.168.88.3"

echo -e "${LIGHTRED}SETTING UP SNAP${NC}"
snap_bringup ../t0/gateware/grex_gateware.fpg ${FPGA_ADDR} --gain=4

echo -e "${LIGHTRED}SETTING UP PSRDADA BUFFERS${NC}"
# Data is float32s all around, so 4 bytes per pixel
dada_db -k ${KEY} -b $((CHANNELS*DADA_SAMPLES*4)) -l -p

echo -e "${LIGHTRED}STARTING PIPELINE${NC}"
parallel -u ::: './tasks/t0.sh 1' './tasks/t1.sh 2'

echo -e "${RED}CLEANING UP${NC}"
dada_db -k ${KEY} -d
