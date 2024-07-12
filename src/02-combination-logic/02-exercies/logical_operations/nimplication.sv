module nimplication(
    input logic a,
    input logic b,
    output logic nimp
);
    assign nimp = a & !b;
endmodule
