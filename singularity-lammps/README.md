# Running GranLammps on CI stormfly

```
singularity run --bind $(pwd):/lammps --bind /home/jenkins/lammps-run:lammps-run /home/jenkins/centos.img /lammps-run/compile.sh
```
