simulate: $(file).vcd
	gtkwave $(file).vcd

$(file).vcd: $(file).vhdl $(file)_tb.vhdl
	ghdl -a $(file).vhdl
	ghdl -a $(file)_tb.vhdl

	ghdl -e $(file)_tb

	ghdl -r $(file)_tb --vcd=$(file).vcd --stop-time=1us

$(file).vhdl $(file)_tb.vhdl:
	echo "just checking for changes hehe"