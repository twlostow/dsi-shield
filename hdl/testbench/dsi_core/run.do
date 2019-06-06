vlib work

vsim -L unisim work.main -voptargs="+acc"
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
radix -hexadecimal
run 10ms
wave zoomfull
radix -hexadecimal
