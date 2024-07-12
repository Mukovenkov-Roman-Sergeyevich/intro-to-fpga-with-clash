module exercise_testbench;
    logic a, b, imp_sheffer, imp_pierce, and_sheffer, and_pierce, or_sheffer, or_pierce, not_sheffer, not_pierce;
    const logic [3:0] AParams = 4'b0011;
    const logic [3:0] BParams = 4'b0101;

    const logic [3:0] ImpExpected = 4'b1101;
    const logic [3:0] AndExpected = 4'b0001;
    const logic [3:0] OrExpected = 4'b0111;
    const logic [3:0] NotExpected = 4'b1100;

    sheffer_implication sheffer_imp_inst (
        .a(a),
        .b(b),
        .a_imp_b(imp_sheffer)
    );

    pierce_implication pierce_imp_inst (
        .a(a),
        .b(b),
        .a_imp_b(imp_pierce)
    );

    sheffer_and sheffer_and_inst (
        .a(a),
        .b(b),
        .a_and_b(and_sheffer)
    );

    pierce_and pierce_and_inst (
        .a(a),
        .b(b),
        .a_and_b(and_pierce)
    );

    sheffer_or sheffer_or_inst (
        .a(a),
        .b(b),
        .a_or_b(or_sheffer)
    );

    pierce_or pierce_or_inst (
        .a(a),
        .b(b),
        .a_or_b(or_pierce)
    );

    sheffer_not sheffer_not_inst (
        .a(a),
        .not_a(not_sheffer)
    );

    pierce_not pierce_not_inst (
        .a(a),
        .not_a(not_pierce)
    );

    initial begin
        for (int i = 0; i < 4; i++) begin
            a = AParams[i];
            b = BParams[i];
            #10;
            assert(ImpExpected[i] === imp_sheffer)
                $display("Импликация Шеффера %b -> %b = %b", a, b, imp_sheffer);
            else begin
                $display("Неверная импликация Шеффера %b -> %b = %b (Надо %b -> %b = %b)", a, b, imp_sheffer, a, b, ImpExpected[i]);
                $fatal;
            end
            assert(ImpExpected[i] === imp_pierce)
                $display("Импликация Пирса %b -> %b = %b", a, b, imp_pierce);
            else begin
                $display("!!!Неверная импликация Пирса %b -> %b = %b (Надо %b -> %b = %b)", a, b, imp_pierce, a, b, ImpExpected[i]);
                $fatal;
            end
            assert(AndExpected[i] === and_sheffer)
                $display("И Шеффера (%b and %b) = %b", a, b, and_sheffer);
            else begin
                $display("!!!Неверное И Шеффера (%b and %b) = %b (Надо (%b and %b) = %b)", a, b, and_sheffer, a, b, AndExpected[i]);
                $fatal;
            end
            assert(AndExpected[i] === and_pierce)
                $display("И Пирса (%b and %b) = %b", a, b, and_pierce);
            else begin
                $display("!!!Неверное И Пирса (%b and %b) = %b (Надо (%b and %b) = %b)", a, b, and_pierce, a, b, AndExpected[i]);
                $fatal;
            end
            assert(OrExpected[i] === or_sheffer)
                $display("ИЛИ Шеффера (%b or %b) = %b", a, b, or_sheffer);
            else begin
                $display("!!!Неверное ИЛИ Шеффера (%b or %b) = %b (Надо (%b or %b) = %b)", a, b, or_sheffer, a, b, OrExpected[i]);
                $fatal;
            end
            assert(OrExpected[i] === or_pierce)
                $display("ИЛИ Пирса (%b or %b) = %b", a, b, or_pierce);
            else begin
                $display("!!!Неверное ИЛИ Пирса (%b or %b) = %b (Надо (%b or %b) = %b)", a, b, or_pierce, a, b, OrExpected[i]);
                $fatal;
            end
            assert(NotExpected[i] === not_sheffer)
                $display("НЕТ Шеффера !%b = %b", a, not_sheffer);
            else begin
                $display("!!!Неверное НЕТ Шеффера !%b = %b (Надо !%b = %b)", a, not_sheffer, a, NotExpected[i]);
                $fatal;
            end
            assert(NotExpected[i] === not_pierce)
                $display("НЕТ Пирса !%b = %b", a, not_pierce);
            else begin
                $display("!!!Неверное НЕТ Пирса !%b = %b (Надо !%b = %b)", a, not_pierce, a, NotExpected[i]);
                $fatal;
            end
        end
    end
endmodule
