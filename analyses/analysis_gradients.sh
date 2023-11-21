#!/bin/bash

module load GROMACS


gmx make_ndx -f simulation.gro -o index_calc.ndx << EOF
a W NA CL WF WN WP WM
name 0 solvent
q
EOF

gmx traj -s simulation.tpr -f simulation.trr -n index_calc.ndx -dt 12500 -ot temp_solvent.xvg << EOF
solvent
EOF

gmx make_ndx -f simulation.gro -o index.ndx << EOF
del 0 - 30
a     1 -  1600
a  1601 -  3200
a  3201 -  4800
a  4801 -  6400
a  6401 -  8000
a  8001 -  9600
a  9601 - 11200
a 11201 - 12800
q
EOF


gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-01.xvg << EOF
0
EOF
gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-02.xvg << EOF
1
EOF
gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-03.xvg << EOF
2
EOF
gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-04.xvg << EOF
3
EOF
gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-05.xvg << EOF
4
EOF
gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-06.xvg << EOF
5
EOF
gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-07.xvg << EOF
6
EOF
gmx traj -s simulation.tpr -f simulation.trr -n index.ndx -b 1000000 -e 1250000 -dt 2500 -ot temp_slt-08.xvg << EOF
7
EOF

gmx analyze -f temp_slt-01.xvg -av avg-temp_slt-01.xvg > stat-temp_slt-01.txt
gmx analyze -f temp_slt-02.xvg -av avg-temp_slt-02.xvg > stat-temp_slt-02.txt
gmx analyze -f temp_slt-03.xvg -av avg-temp_slt-03.xvg > stat-temp_slt-03.txt
gmx analyze -f temp_slt-04.xvg -av avg-temp_slt-04.xvg > stat-temp_slt-04.txt
gmx analyze -f temp_slt-05.xvg -av avg-temp_slt-05.xvg > stat-temp_slt-05.txt
gmx analyze -f temp_slt-06.xvg -av avg-temp_slt-06.xvg > stat-temp_slt-06.txt
gmx analyze -f temp_slt-07.xvg -av avg-temp_slt-07.xvg > stat-temp_slt-07.txt
gmx analyze -f temp_slt-08.xvg -av avg-temp_slt-08.xvg > stat-temp_slt-08.txt

