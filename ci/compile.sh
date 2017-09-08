#!/bin/bash
cd /lammps/src
rm -f *.dump
make clean-all
make yes-granular |& tee log.make_yes_granular
make -j serial |& tee log.make_serial
lammpslocation=$1
validationfiles=$2
$lammpslocation/lmp_serial -i $validationfiles/contact/in.linear_withoutDamp.planeParticle &&
$lammpslocation/lmp_serial -i $validationfiles/contact/in.hertz_withoutDamp.planeParticle &&
$lammpslocation/lmp_serial -i $validationfiles/contact/in.linear_withoutDamp.twoparticles &&
$lammpslocation/lmp_serial -i $validationfiles/rolling/in.granlinear.rolling_sphere &&
$lammpslocation/lmp_serial -i $validationfiles/rolling/in.granhertz.rolling_sphere
diff  -q $lammpslocation/hertz_withoutDamp_hertz.dump $validationfiles/contact/hertz_withoutDamp_hertz.dump 1>/dev/null
if [[ $? == "0" ]]
then
  echo "Test results are same"
else
  echo "Test restuls are different"
fi
