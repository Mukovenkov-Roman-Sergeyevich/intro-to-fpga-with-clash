module reduce_and #(
    parameter int COUNT_OF_BITS = 4
) (
    input logic [COUNT_OF_BITS-1 : 0] bitvector,
    output logic reduce
);
    logic [COUNT_OF_BITS-1 : 0] temp_reduce;
    assign temp_reduce[0] = bitvector[0];
    genvar i;
    generate
    for (i = 1; i < COUNT_OF_BITS; i++)
        sheffer_and sheffer_and_inst(
            .a(a),
            .b(temp_reduce[i-1]),
            .a_and_b(temp_reduce[i])
        );
    endgenerate
    assign reduce = temp_reduce[COUNT_OF_BITS-1];
endmodule
