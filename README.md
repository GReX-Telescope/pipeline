# GReX Pipeline

This collection of bash scripts orchestrates running the GReX FRB Pipeline. Currently WIP.

This requires the [snapctl](https://github.com/GReX-Telescope/snapctl) package to be on the path, [GNU Parallel](https://www.gnu.org/software/parallel/), [our fork of heimdall](https://github.com/GReX-Telescope/heimdall-astro), and the T\* software, like [T0](https://github.com/GReX-Telescope/GReX-T0).

Gloabl (shared) configuration is in the main `grex.sh` file, with task-specific configuration in the associated tasks file.

## TODOs

* Fix the relative paths in the tasks
* Figure out how to configure where filterbanks/voltage dumps go
* Incorporate T3, T4 ...
