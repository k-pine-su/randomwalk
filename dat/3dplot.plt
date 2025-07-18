reset

set xlabel 'x'
set ylabel 'y'
set zlabel 'z'
set cblabel 'step'   

set autoscale 

set view 64, 60

splot "trace.dat" using 2:3:4:1 with lines palette notitle