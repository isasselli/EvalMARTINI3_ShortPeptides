#!/bin/bash

module load GROMACS

gmx_mpi make_ndx -f simulation.gro -o index.ndx << EOF
del 0 - 30
a BB
a SC1 SC2 SC3
q
EOF

gmx_mpi sasa -f simulation.xtc -n index.ndx -s simulation.tpr -o sasa.xvg -odg dG.xvg -tv V-d.xvg -dt 25000 << EOF
0
EOF

gmx rdf -f simulation.xtc -s simulation.tpr -n index.ndx -b 1000000 -e 1250000 -bin 0.05 -o rdf_BB.xvg -cn cn-rdf_BB.xvg -seltype mol_com << EOF
0
0
EOF

gmx rdf -f simulation.xtc -s simulation.tpr -n index.ndx -b 1000000 -e 1250000 -bin 0.05 -o rdf_PHE.xvg -cn cn-rdf_PHE.xvg -seltype res_com << EOF
1
1
EOF
