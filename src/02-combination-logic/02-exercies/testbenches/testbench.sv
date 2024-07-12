module exercise_testbench;
    logic a, b, imp, nimp, pierce, sheffer;
    const logic [3:0] AParams = 4'b0011;
    const logic [3:0] BParams = 4'b0101;

    const logic [3:0] ImpExpected = 4'b1101;
    const logic [3:0] NimpExpected = 4'b0010;
    const logic [3:0] PierceExpected = 4'b1000;
    const logic [3:0] ShefferExpected = 4'b1110;

    implication implic (
        .a(a),
        .b(b),
        .imp(imp)
    );

    nimplication nimplic (
        .a(a),
        .b(b),
        .nimp(nimp)
    );

    pierce_arrow pierce_arr (
        .a(a),
        .b(b),
        .pierce(pierce)
    );

    sheffer_stroke sheffer_str (
        .a(a),
        .b(b),
        .sheffer(sheffer)
    );

    initial begin
        for (int i = 0; i < 4; i++) begin
            a = AParams[i];
            b = BParams[i];
            #10;
            assert(ImpExpected[i] === imp)
                $display("Импликация %b -> %b = %b", a, b, imp);
            else begin
                $display("Неверная импликация %b -> %b = %b (Надо %b -> %b = %b)", a, b, imp, a, b, ImpExpected[i]);
                $fatal;
            end
            assert(NimpExpected[i] === nimp)
                $display("НЕимпликация !(%b -> %b) = %b", a, b, nimp);
            else begin
                $display("Неверная НЕимпликация !(%b -> %b) = %b (Надо !(%b -> %b) = %b)", a, b, nimp, a, b, NimpExpected[i]);
                $fatal;
            end
            assert(PierceExpected[i] === pierce)
                $display("Пирс !(%b ИЛИ %b) = %b", a, b, pierce);
            else begin
                $display("Неверный Пирс !(%b ИЛИ %b) = %b (Надо !(%b ИЛИ %b) = %b)", a, b, pierce, a, b, PierceExpected[i]);
                $fatal;
            end
            assert(ShefferExpected[i] === sheffer)
                $display("Шеффер !(%b И %b) = %b", a, b, sheffer);
            else begin
                $display("Неверный Шеффер !(%b И %b) = %b (Надо !(%b И %b) = %b)", a, b, sheffer, a, b, ShefferExpected[i]);
                $fatal;
            end
        end
    end
endmodule
