
vsim -t 1ps -L unisim work.main -voptargs="+acc" 
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
radix -hexadecimal
run 3000us
wave zoomfull
radix -hexadecimal
