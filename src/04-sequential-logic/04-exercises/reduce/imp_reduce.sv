module imp_reduce (
    input logic clk,
    input logic rst,
    input logic a,
    output logic imp
);

  logic acc;

  always_comb begin
    imp = !acc | a;
  end

  always_ff @(posedge clk) begin
    if (rst) begin
      acc <= 1'b0;
    end else begin
      acc <= imp;
    end
  end
endmodule
