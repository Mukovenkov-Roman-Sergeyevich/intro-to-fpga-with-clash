module imp_reduce_tb;
  initial begin
    $dumpfile("imp_reduce_tb.vcd");
    $dumpvars(0, imp_reduce_tb);
  end

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

  logic a;
  logic imp;

  imp_reduce DUT (
      .clk(clk),
      .rst(rst),
      .a(a),
      .imp(imp)
  );

  initial begin
    $monitor("clk=%d, rst=%d, a=%d, imp=%d", clk, rst, a, imp);

    wait (!rst) a = 1'b0;
    @(posedge clk) a = 1'b1;
    @(posedge clk) a = 1'b0;
    @(posedge clk) begin
      a = 1'b1;
      $finish();
    end
  end
endmodule
