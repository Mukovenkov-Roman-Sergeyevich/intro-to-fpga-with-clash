module pierce_and(
    input logic a,
    input logic b,
    output logic a_and_b
);
    logic not_a;
    logic not_b;
    pierce_not not_instance1(
        .a(a),
        .not_a(not_a)
    );

    pierce_not not_instance2(
        .a(b),
        .not_a(not_b)
    );

    pierce_arrow pierce_instance(
        .a(not_a),
        .b(not_b),
        .pierce(a_and_b)
    );

endmodule
