module pierce_or(
    input logic a,
    input logic b,
    output logic a_or_b
);
    logic not_a_or_b;

    pierce_arrow pierce_instance(
        .a(a),
        .b(b),
        .pierce(not_a_or_b)
    );

    pierce_not pierce_not_instance(
        .a(not_a_or_b),
        .not_a(a_or_b)
    );
endmodule
