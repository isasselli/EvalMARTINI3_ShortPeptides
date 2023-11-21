#!/bin/bash

module load GROMACS

gmx_mpi make_ndx -f simulation.gro -o index.ndx << EOF
del 0 - 30
a BB SC1 SC2 SC3
q
EOF

gmx_mpi sasa -f simulation.xtc -n index.ndx -s simulation.tpr -o sasa.xvg -odg dG.xvg -tv V-d.xvg -dt 25000 << EOF
0
EOF

