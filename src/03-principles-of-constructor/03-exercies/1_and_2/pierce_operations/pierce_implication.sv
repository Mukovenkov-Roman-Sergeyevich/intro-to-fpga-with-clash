module pierce_implication(
    input logic a,
    input logic b,
    output logic a_imp_b
);
    logic not_a;
    logic not_a_imp_b;
    pierce_not not_instance1(
        .a(a),
        .not_a(not_a)
    );

    pierce_arrow pierce_instance(
        .a(not_a),
        .b(b),
        .pierce(not_a_imp_b)
    );

    pierce_not not_instance2(
        .a(not_a_imp_b),
        .not_a(a_imp_b)
    );

endmodule
