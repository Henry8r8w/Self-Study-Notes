

## 2

### Block Diagram
- To draw, one must have all ports shown labeled to the appropriate parts
- It is crucial to have the block diagram drawn before coding implementation

### Signals in SystemVerilog
- Basics
    - 'Varibales' need to be declared to either wires (**wire**) or varaible voltage sources (**reg**)
    - The keyword logic is only needed to for writing the code as compiler will help with solving the wire/reg
    - A **bus** (multi-bit varaible) can be declared by adding a dimension to the variable type (e.g., logic [2:0], where the range is 0-2 $/to$ [end_inclsuive: start_inclusive] and it is a 3b'XXX)
- Signal manipulation
    - bus[digit_index] - get an indivisual value from a bus
    - bus[end_digit_index: start_digit_index] - get a slice values from a bus
    - {sig, sig,...} - concatenation of digits from an order collection of existing siganls
    - {N{sig}} - replication of signals (new bus with N copies of sig created)
### Combinational Logic in SystemVerilog
- assign, a single continous assignment statement
    - The specified relationship will hold true for all time
    - e.g., assign F = ~((A & B) | (C & D));
    - There can be as many assign statement as possible (intermediate and output logics), but eaech must set a differnet signal (i.e., no contention/conflicts)

### Logic Gates
- Basic gate can be specified using operators
- ~ is a 1-input NOT
- & is a 2-input AND
- | is a 2-input OR
- All other gates can be built from the combinations of the 3 operators
```systemverilog
// Definition
<gate> <instance_name> (output, input_i,..., input_n);

// Example

and g1 (F,A,B,C,D) // 4-input AND gate named g1


```
### Modules
- They are the basic builiding blocks (aka. 'the black box', 'classes') in the desgin
- They are defined by the enclosure of module and endmodule

```systemverilog

// Definition
module module_name (F_output, A_input, B_input, C_input, D_input);
    output logic F_output;
    input logic  A_input, B_input, C_input, D_input
    ... // implmentation
endmodule


// Instantiation
AOI instance_name (.F_output(y), .A_input(x1),.B_input(x2),.C_input(x3),.D_input(x4))

```

### What is SystemVerilog?

- SV is a hardware description language (HDL)
    - We descrhibe digital circuit in code
- Differen from regular programming langauge:
    - Hardware execution is concurrent (the hardware is always undergoing) as opposed to regular programming language that is sequential
