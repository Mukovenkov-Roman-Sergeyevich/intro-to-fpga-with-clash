module zero_one #(
  parameter int COUNT_OF_BITS = 5
) (
  input logic clk,
  input logic rst,
  input logic [COUNT_OF_BITS-1:0] num,
  output int zeros,
  output int ones
);

  int zeros_acc;
  int ones_acc;
  int temp_zeroes;
  int temp_ones;

  always_comb begin
    temp_zeroes = 0;
    temp_ones = 0;
    for (int i = 0; i < COUNT_OF_BITS; i++) begin
      if (num[i] == 1'b0)
        temp_zeroes++;
      else
        temp_ones++;
    end
    zeros = zeros_acc + temp_zeroes;
    ones = ones_acc + temp_ones;
  end

  always_ff @(posedge clk) begin
    if (rst) begin
      zeros_acc <= 0;
      ones_acc <= 0;
    end else begin
      zeros_acc <= zeros;
      ones_acc <= ones;
    end
  end
endmodule
