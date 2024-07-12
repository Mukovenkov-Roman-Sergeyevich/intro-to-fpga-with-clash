module reduce_xor #(
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
        assign temp_reduce[i] = temp_reduce[i-1] ^ bitvector[i];
    endgenerate
    assign reduce = temp_reduce[COUNT_OF_BITS-1];
endmodule
