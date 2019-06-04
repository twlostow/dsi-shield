vlib work

vsim -L unisim work.main -voptargs="+acc"
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
radix -hexadecimal
run 5us
wave zoomfull
radix -hexadecimal
