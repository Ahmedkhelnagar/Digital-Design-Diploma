

module ripple_counter(clk,rstn,out);
    input clk,rstn;
    output [3:0]out;
    wire q0,q1,q2,q3;
    wire qbar0,qbar1,qbar2,qbar3;

    //Module Instantiation (D_FlipFlop)
    D_FlipFlop DUT0(.d(~q0),.rstn(rstn),.clk(clk),.q(q0),.qbar(qbar0));
    D_FlipFlop DUT1(.d(~q1),.rstn(rstn),.clk(q0),.q(q1),.qbar(qbar1));
    D_FlipFlop DUT2(.d(~q2),.rstn(rstn),.clk(q1),.q(q2),.qbar(qbar2));
    D_FlipFlop DUT3(.d(~q3),.rstn(rstn),.clk(q2),.q(q3),.qbar(qbar3));

    //using structural modelling,out is extracted from qbar cuz he wanted that -> count up
    //if out is extraceted from q -> count down
    assign out = {qbar3,qbar2,qbar1,qbar0};


endmodule