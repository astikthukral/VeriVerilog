# LCD(VeriVerilog)
Description
This project implements LCD control logic in Verilog, demonstrating FPGA-based peripheral interfacing. The module automatically initializes the LCD and displays a custom name with proper command sequencing.

Hardware Required
FPGA Development Board

16x2 Character LCD Display

Connecting wires

Pull-up resistors (if needed)

Features
Complete LCD initialization sequence

State machine-based control logic

Automatic command and data transmission

Displays name on LCD screen

Clock-driven enable signal generation



LCD Commands Used
0x38 - 8-bit mode, 2 lines, 5x7 font

0x01 - Clear display

0x0E - Display on, cursor blinking

0x06 - Auto increment cursor

0x80 - Set cursor to first line

Usage
Synthesize the Verilog code on your FPGA

Connect LCD data pins to dout[7:0]

Connect RS and RW control signals

Provide system clock input

Program FPGA and power on

