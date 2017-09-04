#!/bin/bash
cd /lammps/src
make yes-granular |& tee log.make_yes_granular
make -j serial |& tee log.make_serial
