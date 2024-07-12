module pierce_arrow(
    input logic a,
    input logic b,
    output logic pierce
);
    assign pierce = !(a | b);
endmodule
