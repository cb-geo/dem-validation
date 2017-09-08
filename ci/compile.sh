#!/bin/bash
cd /lammps/src
rm -f *.dump
make clean-all
make yes-granular |& tee log.make_yes_granular
make -j serial |& tee log.make_serial
/lammps/src/lmp_serial -i /lammps-dem-validation/contact/in.linear_withoutDamp.planeParticle &&
/lammps/src/lmp_serial -i /lammps-dem-validation/contact/in.hertz_withoutDamp.planeParticle &&
/lammps/src/lmp_serial -i /lammps-dem-validation/contact/in.linear_withoutDamp.twoparticles &&
/lammps/src/lmp_serial -i /lammps-dem-validation/rolling/in.granlinear.rolling_sphere &&
/lammps/src/lmp_serial -i /lammps-dem-validation/rolling/in.granhertz.rolling_sphere
diff  -q /lammps/src/hertz_withoutDamp_hertz.dump /lammps-dem-validation/contact/hertz_withoutDamp_hertz.dump 1>/dev/null
if [[ $? == "0" ]]
then
  echo "Test results are same"
else
  echo "Test restuls are different"
fi
