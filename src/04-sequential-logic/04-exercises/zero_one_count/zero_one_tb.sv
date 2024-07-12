module zero_one_tb;
  initial begin
    $dumpfile("zero_one_tb.vcd");
    $dumpvars(0, zero_one_tb);
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
  int zeros;
  int ones;

  zero_one #(
    .COUNT_OF_BITS(CountOfBits)
) DUT (
      .clk(clk),
      .rst(rst),
      .num(num),
      .zeros(zeros),
      .ones(ones)
  );

  initial begin
    $monitor("clk=%d, rst=%d, num=%b, zeros=%d, ones=%d", clk, rst, num, zeros, ones);

    wait (!rst) num = 4'b0101;
    @(posedge clk) num = 4'b0110;
    @(posedge clk) num = 4'b0111;
    @(posedge clk) begin
      num = 4'b0011;
      $finish();
    end
  end
endmodule
