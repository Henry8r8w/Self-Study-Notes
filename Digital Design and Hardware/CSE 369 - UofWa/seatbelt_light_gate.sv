module seatbelt_light_gate(input  logic DBI, PBI, P,
                           output logic SBL);
  // Intermediate signals: initialization, wait to be assgined
  logic NOT_DBI, NOT_PBI, A;

  
  // Individual signal assignments: gate level
  not gate1(NOT_DBI, DBI);     // ~DBI
  not gate2(NOT_PBI, PBI);     // ~PBI
  and gate3(A, P, NOT_PBI);    // P & ~PBI
  or  gate4(SBL, A, NOT_DBI);  // A | NOT_DBI
  
endmodule  // seatbelt_light_gate
