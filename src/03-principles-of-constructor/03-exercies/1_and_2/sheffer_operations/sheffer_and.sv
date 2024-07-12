module sheffer_and(
    input logic a,
    input logic b,
    output logic a_and_b
);
    logic not_a_and_b;

    sheffer_stroke sheffer_instance(
        .a(a),
        .b(b),
        .sheffer(not_a_and_b)
    );

    sheffer_not not_instance(
        .a(not_a_and_b),
        .not_a(a_and_b)
    );
endmodule
