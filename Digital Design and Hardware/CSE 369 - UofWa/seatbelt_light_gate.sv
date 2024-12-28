// Block Diagram (SBL, DBI, PBI, P)
// DBI -> NOT()_1 =: NOT_DBI -> AND_3() =: A
// PBI -> NOT()_2 =: NOT_PBI
// P -> AND_3() =: A
// A -> OR_4, NOT_DBI -> OR_4 =: SBL
//

// Gates Approach
module seatbelt_light_gate(input  logic DBI, PBI, P,
                           output logic SBL);
  
  logic NOT_DBI, NOT_PBI, A; // Intermediate signals, wait to be assigned

  not gate1(NOT_DBI, DBI);    
  not gate2(NOT_PBI, PBI);     
  and gate3(A, P, NOT_PBI);    
  or  gate4(SBL, A, NOT_DBI);  

endmodule

// Intermediate Signals Assignment Approach
module seatbelt_light (input logic DBI, PBI, P,
                           output logic SBL);
        output logic SBL;
        input logic  DBI, PBI, P;
        logic NOT_DBI, NOT_PBI, A, B; // Intermediate signals, wait to be assigned

        assign NOT_DBI = ~DBI;
        assign NOT_PBI = ~PBI;
        assign A = NOT_PBI & P;
        assign B = A | NOT_DBI;

        assign SBL = B;

endmodule

// Single Assignment Approach
module seatbelt_light (input logic DBI, PBI, P,
                           output logic SBL);
        output logic SBL;
        input logic  DBI, PBI, P;

        assign SBL = (~PBI & P)| ~DBI;

endmodule
