

module Param_Shift_Register_tb();
    parameter SHIFT_WIDE = 8;
    reg sclr,sset,shiftin,load,clock,enable,aclr,aset;
    reg [SHIFT_WIDE-1 : 0] data;
    wire shiftout;
    wire [SHIFT_WIDE-1:0]q;

    //Module Instantiation
    Param_Shift_Register #(
        .LOAD_AVALUE(1),
        .LOAD_SVALUE(1),
        .SHIFT_WIDE(SHIFT_WIDE),
        .SHIFT_DIRECTION("LEFT"))
        DUT(
            sclr,
            sset,
            shiftin,
            load,
            data,
            clock,
            enable,
            aclr,
            aset,
            shiftout,
            q);
    
    initial begin
        clock = 0;
        forever
            #1 clock = ~clock;
    end
    initial begin
        clock = 0;
        aclr = 0;
        aset = 0;
        sclr = 0;
        sset = 0;
        load = 0;
        enable = 0;
        shiftin = 0;
        data = 0;

        //apply asynchronous clear
        aclr = 1;
        @(negedge clock);
        aclr = 0;
        $display("After aclr: q = %b",q);

        //apply asynchronous set
        aset = 1;
        @(negedge clock);
        aset = 0;
        $display("After aset: q = %b",q);

        //apply synchronous clear
        sclr = 1;
        enable = 1;
        @(negedge clock);
        sclr = 0;
        $display("After sclr: q = %b",q);

        //apply synchronous set
        sset = 1;
        enable = 1;
        @(negedge clock);
        sset = 0;
        $display("After sset: q = %b",q);

        //apply parallel load
        load = 1;
        data = 8'b10101010;
        @(negedge clock);
        load = 0;
        $display("After load: q = %b",q);

        //apply shift operations
        enable = 1;
        shiftin = 1;
        @(negedge clock);
        $display("After 1st shift: q = %b, shiftout = %b", q, shiftout);
        shiftin = 0;
        @(negedge clock);
        $display("After 2nd shift: q = %b, shiftout = %b", q, shiftout);
        shiftin = 1;
        @(negedge clock);
        $display("After 3rd shift: q = %b, shiftout = %b", q, shiftout);

        $stop;
    end
endmodule