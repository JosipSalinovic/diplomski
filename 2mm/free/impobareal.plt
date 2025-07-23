unset multiplot
reset
set encoding utf8

#POSTAVKE GRAFA: DIMENZIJE SLIKE, VELICINA FONTA, IME SLIKE
set term pngcairo background "#ffffff" font "Times-New-Roman,20pt" size 40.0cm,25.0cm fontscale 1.0 dl 2.0
set output 'usporedba-realfree.png'

#STILOVI LINIJA; POZIV: ls BROJ
set style line  1 lt 1 lw 2 lc rgb "cyan"
set style line  2 lt 1 lw 2 lc rgb "blue"
set style line  3 lt 1 lw 2 lc rgb "red"
set style line  4 lt 1 lw 2 lc rgb "green"


set style line 5 lc rgb 'red' lt 1 lw 2 pt 7 pi -1 ps 0.7
set style line 6 lc rgb 'blue' lt 1 lw 2 pt 7 pi -1 ps 0.7
set samples 10000
set bmargin 0.
set lmargin 0.
set rmargin 0.
set tmargin 0.
#set xtics 0,1,25
set multiplot
  set key top Left left #POSTAVLJA LEGENDU GORE DESNO
  set origin 0.13,0.15 #POCETAK GRAFA ( u dimenzijama slike)
  set size   0.84,0.83 #VELICINA GRAFA (u dimenzijama slike)
  set grid
  set grid ytics mytics
  set mytics 5
  set grid xtics mxtics
  set mxtics 2
  set xrange[700:1200]
    set xlabel "{/Times-New-Roman-Italic f } [MHz] "
    set ylabel " {/Times-New-Roman-Italic R }[{/Symbol W}]"
    #set label "500 šetača" at graph 0.05, graph 0.95
    #set label "VMC (b=1.2)" at graph 0.05, graph 0.87
    plot \
         "D900.txt" u ($2*1000):7 w l ls 1  ti "Eksperiment", \
		 "teorijaimp.txt" u 1:2 w l ls 2  ti "Analitički model za sinusnu raspodjelu struje",\
		 "realimp2mmsuz.txt" u 1:($2/1000) w l ls 3 ti "Simulator: 4NEC2",\
		 "realnec.txt" u ($1):($2) w l ls 4 ti "Simulator: Suzana"

unset output
set output
reset
set term GNUTERM
#Reaktancija za dipol na visini od 1mm paralelno iznad vode(reaktancija)sa L-matching networkom