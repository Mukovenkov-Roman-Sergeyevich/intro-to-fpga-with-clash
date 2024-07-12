module min_max_tb;
  initial begin
    $dumpfile("min_max_tb.vcd");
    $dumpvars(0, min_max_tb);
  end

  localparam int CountOfBits = 4;
  localparam int ClkPeriod = 10;

  logic clk, rst;

  initial begin
    rst <= '1;
    #(ClkPeriod / 2);
    rst <= '0;
  end

  initial begin
    clk <= '0;
    forever begin
      #(ClkPeriod / 2) clk = ~clk;
    end
  end

  logic [CountOfBits-1:0] num;
  logic [CountOfBits-1:0] min;
  logic [CountOfBits-1:0] max;

  min_max #(
    .COUNT_OF_BITS(CountOfBits)
) DUT (
      .clk(clk),
      .rst(rst),
      .num(num),
      .min(min),
      .max(max)
  );

  initial begin
    $monitor("clk=%d, rst=%d, num=%d, min=%d, max=%d", clk, rst, num, min, max);

    wait (!rst) num = 4'b0101;
    @(posedge clk) num = 4'b0110;
    @(posedge clk) num = 4'b0111;
    @(posedge clk) begin
      num = 4'b0011;
      $finish();
    end
  end
endmodule
