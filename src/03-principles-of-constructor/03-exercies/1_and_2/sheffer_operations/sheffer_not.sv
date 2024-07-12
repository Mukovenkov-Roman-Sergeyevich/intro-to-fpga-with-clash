module sheffer_not(
    input logic a,
    output logic not_a
);
    sheffer_stroke sheffer_instance(
        .a(a),
        .b(1'b1),
        .sheffer(not_a)
    );
endmodule
