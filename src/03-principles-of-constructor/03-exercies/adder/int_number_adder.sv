module int_number_adder#(
    parameter int NUMBER_OF_INTS = 16
)(
    input  int a [NUMBER_OF_INTS],
    output int sum
);
    int partial_sums[NUMBER_OF_INTS];
    assign partial_sums[0] = a[0];
    genvar i;
    generate
        for (i = 1; i < NUMBER_OF_INTS; i++)
            adder_multibits_int adder_inst(
                .a(a[i]),
                .b(partial_sums[i-1]),
                .sum(partial_sums[i])
            );
    endgenerate
    assign sum = partial_sums[NUMBER_OF_INTS-1];
endmodule
