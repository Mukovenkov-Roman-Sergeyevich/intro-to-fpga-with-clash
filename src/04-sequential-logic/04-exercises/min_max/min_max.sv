module min_max #(
  parameter int COUNT_OF_BITS = 4
) (
    input logic clk,
    input logic rst,
    input logic [COUNT_OF_BITS-1:0] num,
    output logic [COUNT_OF_BITS-1:0] min,
    output logic [COUNT_OF_BITS-1:0] max
);

  logic [COUNT_OF_BITS-1:0] min_acc;
  logic [COUNT_OF_BITS-1:0] max_acc;

  always_comb begin
    if (num < min_acc)
      min = num;
    else
      min = min_acc;
    if (num > max_acc)
      max = num;
    else
      max = max_acc;
  end

  always_ff @(posedge clk) begin
    if (rst) begin
      min_acc <= {COUNT_OF_BITS{1'b1}};
      max_acc <= {COUNT_OF_BITS{1'b0}};
    end else begin
      min_acc <= min;
      max_acc <= max;
    end
  end
endmodule
