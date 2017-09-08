#!/bin/bash
cd /lammps/src
make clean-all
make yes-granular |& tee log.make_yes_granular
make -j serial |& tee log.make_serial
/lammps/src/lmp_serial -i /lammps-dem-validation/contact/in.linear_withoutDamp.planeParticle &&
/lammps/src/lmp_serial -i /lammps-dem-validation/contact/in.linear_withoutDamp.planeParticle &&
/lammps/src/lmp_serial -i /lammps-dem-validation/contact/in.linear_withoutDamp.twoparticles &&
/lammps/src/lmp_serial -i /lammps-dem-validation/rolling/in.granlinear.rolling_sphere &&
/lammps/src/lmp_serial -i /lammps-dem-validation/rolling/in.granhertz.rolling_sphere
