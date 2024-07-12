module sheffer_implication(
    input logic a,
    input logic b,
    output logic a_imp_b
);
    logic not_b;
    sheffer_not not_instance(
        .a(b),
        .not_a(not_b)
    );
    sheffer_stroke sheffer_instance(
        .a(a),
        .b(not_b),
        .sheffer(a_imp_b)
    );
endmodule
