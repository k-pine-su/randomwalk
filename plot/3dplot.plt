reset
set terminal wxt


set title '3d random walk trace for 10^5 steps'

set xlabel 'x'
set ylabel 'y'
set zlabel 'z'
set cblabel 'step'   

set autoscale 

set view 64, 60

splot "trace.dat" using 2:3:4:1 with lines palette notitle


set terminal png size 800, 800
set output 'trace.png'
# set terminal pdf size 7.5, 7.5
# set output 'trace.pdf'
# set terminal postscript eps enhanced color
# set output 'trace.eps'
replot