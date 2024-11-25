

module Param_Shift_Register(sclr,sset,shiftin,load,data,clock,enable,aclr,aset,shiftout,q);
    parameter SHIFT_WIDE = 8;
    parameter LOAD_AVALUE = 1;
    parameter LOAD_SVALUE = 1;
    parameter SHIFT_DIRECTION = "LEFT";

    input sclr,sset,shiftin,load,clock,enable,aclr,aset;
    input [SHIFT_WIDE-1 : 0]data;
    output reg shiftout;
    output reg [SHIFT_WIDE -1 :0]q;

    always@(posedge clock or posedge aclr or posedge aset)begin
      if(aclr)begin
        q <= 0;
      end
      else if(aset)begin
        q <= LOAD_AVALUE;
      end
      else if(sclr)begin
        q <= 0;
      end
      else if(sset)begin
        q <= LOAD_SVALUE;
      end
      else if(enable)begin
        if(load)begin
            q <= data;
        end
        else if(SHIFT_DIRECTION == "LEFT")begin
            shiftout <= q[SHIFT_WIDE - 1];
            q <= {q[SHIFT_WIDE-2 : 0],shiftin};
        end
        else begin
            shiftout <= q[0];
            q <= {shiftin,q[SHIFT_WIDE-1 : 1]};
        end
      end
    end
endmodule