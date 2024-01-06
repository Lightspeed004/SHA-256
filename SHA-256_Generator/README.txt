You can use any VHDL running software to run this softcore SHA-256 Hash Generato
I used Quartus Prime (18.1)
Add all the vhdl files in the other folder in this file
--Instructions--
1) 'Bism.vhd' must be made the Top Level Entity
2) add 'Testbench.vhd' as the testbench
3) Add your Input to 'Testbench.vhd' after pre-processing it(It currently contains the preprocessed letter 'A' and will output SHA-256 of that)
4) Output consists of 64 hexadecimals
   -SHAout1 shows 1st 8 hexadecimals
   -SHAout2 shows 2nd 8 hexadecimals
   -SHAout3 shows 3rd 8 hexadecimals
   and so on
-------------------------
You'll have to add these signals in your simulator(ModelSim Altera works) as no FPGA has explicit to 256 bit outputs(afaik)
While uploading the files to an FPGA, you'll have to code the preprocessing unit which can be done by using a soft processor (nios in Quartus)
If you wanna know a detailed explanation of each component, email me @ '22B4241@iitb.ac.in' :)