module sheffer_or(
    input logic a,
    input logic b,
    output logic a_or_b
);
    logic not_a;
    logic not_b;
    sheffer_not not_instance1(
        .a(a),
        .not_a(not_a)
    );
    sheffer_not not_instance2(
        .a(b),
        .not_a(not_b)
    );
    sheffer_stroke sheffer_instance(
        .a(not_a),
        .b(not_b),
        .sheffer(a_or_b)
    );
endmodule
