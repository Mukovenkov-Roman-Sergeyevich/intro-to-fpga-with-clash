module sheffer_stroke(
    input logic a,
    input logic b,
    output logic sheffer
);
    assign sheffer = !(a & b);
endmodule
