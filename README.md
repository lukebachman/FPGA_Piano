# FPGA_Piano
• Built an FPGA Digital Piano using Verilog on the Nexys 4DDR

• Mapped out project using a block diagram

• Designed the Piano module which Generates a note frequency when a key is pressed and a Seven Segment Module which takes key input from the piano and displays current note being played

• Designed the counters to keep incrementing their values in each positive clock edge. After reaching a certain value, the counter resets and toggles an output. The system clock has a 100MHz frequency.

• Implemented Flip flops to generate the tone once the counter resets.

• Engineered piano using no external hardware and just the FPGA to use only the five push buttons as a keyboard to play
