module k_number_adder #(
    parameter int COUNT_OF_BITS = 64,
    parameter int COUNT_OF_NUMBERS = 10
) (
    input logic [COUNT_OF_NUMBERS*COUNT_OF_BITS-1:0] a,
    input logic c_in,
    output logic c_out,
    output logic [COUNT_OF_BITS-1:0] sum
);
    logic [COUNT_OF_BITS*COUNT_OF_NUMBERS-1:0] partial_sums;
    logic [COUNT_OF_NUMBERS-1:0] carry;

    assign carry[0] = c_in;
    assign partial_sums[COUNT_OF_BITS-1 : 0] = a[COUNT_OF_BITS-1 : 0];
    genvar i;
    generate
        for (i = 1; i < COUNT_OF_NUMBERS; i++)
            adder_multibits_reuse #(
                .COUNT_OF_BITS(COUNT_OF_BITS)
            ) adder_inst (
                .a(a[(i+1)*COUNT_OF_BITS-1 : i*COUNT_OF_BITS]),
                .b(partial_sums[i*COUNT_OF_BITS-1 : (i-1)*COUNT_OF_BITS]),
                .c_in(carry[i-1]),
                .c_out(carry[i]),
                .sum(partial_sums[(i+1)*COUNT_OF_BITS-1 : i*COUNT_OF_BITS])
            );
    endgenerate

    assign sum = partial_sums[COUNT_OF_BITS*COUNT_OF_NUMBERS-1 : COUNT_OF_BITS*(COUNT_OF_NUMBERS-1)];
    assign c_out = carry[COUNT_OF_NUMBERS-1];
endmodule
