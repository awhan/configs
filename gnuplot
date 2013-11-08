set macros

lbl = "(sprintf(\"%d\", column(0)))"

redlbl = " w labels tc rgb 'red' "
grnlbl = " w labels tc rgb 'green' "
blulbl = " w labels tc rgb 'blue' "		


# circle
c = "w p pt 6"

# filled circle
fc = " w p pt 7 "

# square
s = " w p pt 4 "

# filled square
fs = " w p pt 5 "

# triangle
t = " w p pt 8 "

# filled triangle
ft = " w p pt 9 "

# diamond
d = " w p pt 12 "

# filled diamond
fd = " w p pt 13 "

r = " lc rgb 'red' "
g = " lc rgb 'green' "
b = " lc rgb 'blue' "
k = " lc rgb 'black' "

# i=0
# bind End "i=(i>0)?i-1:0 ; set title sprintf(\"i = %d\",i) ; replot "
# bind Home "i=i+1 ; set title sprintf(\"i = %d\",i) ; replot "

# #http://www.uni-hamburg.de/Wiss/FB/15/Sustainability/schneider/gnuplot/colors.htm
# #gnuplot colors


# #http://ldn.linuxfoundation.org/article/generating-graphs-with-gnuplot
# set object 1 rectangle from screen 0, screen 0 to screen 1, screen 1 behind fc  rgbcolor "#7f7f7f"
#set object 1 rectangle from graph 0, 0 to graph 1, 1 behind fc rgbcolor "#7f7f7f" 
set size noratio
set samples 3000


i=0
j=0
bind i "i=i+1; set title sprintf(\"i %d, j %d\", i, j); replot"
bind "alt-i" "i=(i>0)?i-1:0; set title sprintf(\"i %d, j %d\", i, j); replot"