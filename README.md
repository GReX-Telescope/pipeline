# GReX Pipeline

The bash script that orchestrates the GReX pipeline:

```
Program : grex.sh  by me@kiranshila.com
Version : v0.2.0 (2024-01-24 14:38)
Purpose : Run the GReX pipeline
Usage   : grex.sh [-h] [-q] [-v] [-st] [-tg] [-ap <average_power>] [-vp <vbuf_power>] [-ic <injection_cadence>] [-vp <voltage_path>] [-fp <filterbank_path>] [-ds <dm_start>] [-de <dm_end>] [-f <gateware>] [-t0 <t0_path>] [-t2 <t2_path>] [-dg <digital_gain>] [-rg <requant_gain>] [-d <samples>] [-s <snap>] <action>
Flags, options and parameters:
    -h|--help        : [flag] show usage [default: off]
    -q|--quiet       : [flag] no output [default: off]
    -v|--verbose     : [flag] also show debug messages [default: off]
    -st|--skip_ntp    : [flag] skip NTP synchronization [default: off]
    -tg|--trigger     : [flag] trigger packets directly (no GPS) [default: off]
    -ap|--average_power <?>: [option] 2^n for downsampling  [default: 4]
    -vp|--vbuf_power <?>: [option] 2^n for the voltage buffer size  [default: 19]
    -ic|--injection_cadence <?>: [option] time in seconds in inject fake pulses  [default: 36000]
    -vp|--voltage_path <?>: [option] directory to save voltage dumps  [default: /hdd/data/voltages/]
    -fp|--filterbank_path <?>: [option] directory to save filterbanks  [default: /hdd/data/filterbanks/]
    -ds|--dm_start <?>: [option] lower limit DM of search  [default: 2]
    -de|--dm_end <?>  : [option] upper limit DM of search  [default: 3000]
    -f|--gateware <?>: [option] gateware file  [default: /home/kshila/src/Pipeline/../t0/gateware/grex_gateware.fpg]
    -t0|--t0_path <?> : [option] path to t0 executable  [default: /home/kshila/src/Pipeline/../t0/target/release/grex_t0]
    -t2|--t2_path <?> : [option] path to t2 folder  [default: /home/kshila/src/Pipeline/../t2]
    -dg|--digital_gain <?>: [option] digital gain for the ADC  [default: 4]
    -rg|--requant_gain <?>: [option] set a fixed requantization gain  [default: 5]
    -d|--samples <?> : [option] Number of samples in each DADA block  [default: 200000]
    -s|--snap <?>    : [option] IP address of the SNAP  [default: 192.168.0.3]
    <action>         : [choice] action to perform/pipeline mode  [options: full,cands,filterbank,none,check,env,update,cleanup]
... Check for latest version - git@github.com:GReX-Telescope/Pipeline.git
### TIPS & EXAMPLES
* use grex full to run the full FRB detection pipeline
* use grex cands to run the pipeline through heimdall, dumping candidates
* use grex filterbank to run just T0 to fill a filterbank file
* use grex none to run just T0 with no exfil (only talks to Prometheus)
* use grex cleanup to cleanup DADA buffers that were left around from a crash
* use grex check to check if this script is ready to execute and what values the options/flags are
  grex check
* use grex env to generate an example .env file
  grex env > .env
* use grex update to update to the latest version
  grex update
```
