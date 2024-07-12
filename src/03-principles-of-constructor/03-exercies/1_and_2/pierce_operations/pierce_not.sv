module pierce_not(
    input logic a,
    output logic not_a
);
    pierce_arrow pierce_instance(
        .a(a),
        .b(1'b0),
        .pierce(not_a)
    );
endmodule
