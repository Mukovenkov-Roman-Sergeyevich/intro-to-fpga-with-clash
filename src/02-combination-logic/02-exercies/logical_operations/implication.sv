module implication(
    input logic a,
    input logic b,
    output logic imp
);
    assign imp = !a | b;
endmodule
