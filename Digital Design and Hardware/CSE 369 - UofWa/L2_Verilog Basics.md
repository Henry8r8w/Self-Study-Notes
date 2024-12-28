### Debugging Circuits
  - Complex circuits require careful debugging 
	- Test as you go; don’t wait until the end (system test) 
	- Every module should have a test bench (unit test) 1) 
1) Test all behaviors 
	- All combinations of inputs for small circuits, sub circuits	
2) Identify any incorrect behaviors 
3) Examine inputs & outputs to find earliest place where value is wrong 
	- Typically trace backwards from bad outputs, forwards from inputs ▪
	- Look at values at intermediate points in circuit
### Verilog Test Benches (Purpose: to debug)
- Its application: circuit simulation
- You need to create fake input for FPGA physical connections
	- e.g., LEDR, HEX, KEY, SW, CLOCK_50
```systemverilog

module MUX2_tb (); 
	logic SEL, I, J; // simulated inputs 
	logic V; // net for reading output 
	
	// instance of module we want to test ("device under test") 
	MUX2 dut (.V(V), .SEL(SEL), .I(I), .J(J)); 
	
	int i; 
	initial // build stimulus (test vectors) 
	begin // start of "block" of code 
	for(i = 0; i < 8; i = i + 1) begin // we want 3'bXXX going from 0 to 7
		{SEL, I, J} = i; #10; // wait 10 time units before the next combination
		end 
	end // end of "block" of code 
endmodule // MUX2_tb
```
### Practice Question
logic [4:0] apple; 
logic [3:0] pear; 
logic [9:0] orange; 
assign apple = 5'd20; 
assign pear = {1'b0, apple[2:1], apple[4]};

What is the value of pear?
- Given Apple is 5'd20 (digit of 20), we have a 5b' 10100
- {1'b0, apple[2:1], apple[4]} = {1'b0, 2'b10, 1'b1} = {4b'0101} = {4d'5}

If we want orange to be the sign-extended (extend to the left and keep the significant digits) version of apple, what is the appropriate Verilog statement?
- assign orange = {5{apple[0]}, apple};
	- using replication operator {n{m}}
### Verilog Signal Manipulation
Multi-bit constants: n'b#…# 
- n is width, b is radix specifier (b for binary), # s are digits of number 
- e.g., 4'd12, 4'b1100, 4'hC 

Concatenation: {sig, …, sig} 
- Ordering matters; result will have combined widths of all signals 

Replication operator: {n{m}} 
- repeats value m, n times
###  Verilog Buses
- Bus definition: [n-1:0] is an n-bit bus
	- Good practice to follow bit numbering notation 
	- Access individual bit/wire using “array” syntax (e.g., bus[1]) 
	- Can access sub-bus (slicing) using similar notation (e.g., bus[4:2])
```systemverilog

module AOI (F, A, B, C, D); 
	output logic F; 
	input logic A, B, C, D; 
	logic [2:0] w; 
	
	w[0] = A & B; assign w[1] = C & D; 
	assign w[2] = w[0] | w[1]; 
	assign F = ~w[2]; 
endmodule

```
### Circuit Timing 
- We assume gates react after a fixed delay (ex. 1ns per gates)
\<Insert images>

### Signals (Grouping) and Waveforms
- Signals transmitted over wires continuously, but in digital system, it is only 1s and 0s
of impulses
- We do signal grouping using binary (ex. 0111 = 7, 1000 = 8) of x_1 ...x_4 signals given at a impulse window that each input would have 1 or 0

### Verilog Hierarchy

```systemverilog

module AOI (F, A, B, C, D); 
	output logic F; 
	input logic A, B, C, D; 
	assign F = ~((A & B) | (C & D)); 
endmodule 

// 2:1 multiplier built on top of AOI module (gate level)
module MUX2 (V, SEL, I, J); 
	output logic V; 
	input logic SEL, I, J; 
	logic SELN, VN; 
	
	not G1 (SELN, SEL); 
	AOI G2 (.F(VN), .A(I), .B(SEL), .C(SELN), .D(J)); // (F_out(Assign VN_out), inputs)
	not G3 (V, VN); // negated VN result = V, which we output
endmodule




I -> AOI
SEL -> AOI, -> NOR(SEL) = SELN -> AOI
J -> AOI

AOI -> NOR(VN) = V ->V

```

### Structural Verilog, Verilog Wires, Verilog Gate Level

```systemverilog
// SystemVerilog code for AND-OR-INVERT circuit  (structural)
module AOI (F, A, B, C, D); 
	output logic F; 
	input logic A, B, C, D; 
	assign F = ~((A & B) | (C & D)); 
endmodule 

// SystemVerilog code for AND-OR-INVERT circuit  (wires)
module AOI (F, A, B, C, D); 
	output logic F; 
	input logic A, B, C, D; 
	logic AB, CD, O; // variables initailziation, waiting to be assigned 
	
	assign AB = A & B; 
	assign CD = C & D; 
	assign O = AB | CD; 
	assign F = ~O; 
endmodule

// SystemVerilog code for AND-OR-INVERT circuit  (gate level)
module AOI (F, A, B, C, D); 
	output logic F; 
	input logic A, B, C, D; 
	logic AB, CD, O; 
	
	and a1(AB, A, B); 
	and a2(CD, C, D); 
	or o1(O, AB, CD); 
	not n1(F, O); 
endmodule

```

### Verilog Execution
- Physical wires transmit voltages (electrons) near-instantaneously ▪ Wires by themselves have no notion of sequential execution 
- Gates and modules are constantly performing computations 
	- Can be hard to keep track of! 
- In pure hardware, there is no notion of initialization 
	- A wire that is not driven by a voltage will naturally pick up a voltage from the environment
### Verilog Primitives
- **Nets** (wire): transmit value of connected source 
	- Problematic if connected to two different voltage sources 
	- Can connect to many places (always possible to “split” wire) 
- **Variables** (reg): variable voltage sources 
	- Can “drive” by assigning arbitrary values at any given time 
	- SystemVerilog: variable logic can be used as a net, too 
- Logic Values 
	- 0 = zero, low, FALSE 
	- 1 = one, high, TRUE 
	- X = unknown, uninitialized, contention (conflict) 
	- Z = floating (disconnected), high impedance

Gates
- NOT: ~
- AND: &
- OR: |
- XOR: ^

Modules: the 'classes' in Verilog that define blocks
- Input: Signals passed from outside to inside of block 
- Output: Signals passed from inside to outside of block

### Verilog
- Programming language for describing hardware 
	- Simulate behavior before (wasting time) implementing 
	- Find bugs early 
	- Enable tools to automatically create implementation 
- Syntax is similar to C/C++/Java, but behavior is very different
	- VHDL (the other major HDL) is more similar to ADA 
- Modern version is SystemVerilog 
	- Superset of previous; cleaner and more efficient

### Practice Question
- Implement the Boolean expression B(A+C) with the fewest number of a single universal gate (NAND)
	- NAND(NAND(NAND(A_1, A_2), NAND(C_1, C_2)), B)_1, NAND(NAND(A_1, A_2), NAND(C_1, C_2)), B)_2)
   	- note: self-inserting NAND creates a not gate, which helps us negate A and C for DeMorgan law to apply and cancel NAND to get AND
 

