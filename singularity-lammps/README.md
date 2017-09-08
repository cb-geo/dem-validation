# Running GranLammps on CI stormfly

```
singularity run \
	--bind $(pwd):/lammps \
	--bind /home/jenkins/lammps-run:lammps-run \
	--bind /home/jenkins/lammps-dem-validation:lammps-dem-validation \
	/home/jenkins/centos.img \
	/lammps-run/compile.sh
```
