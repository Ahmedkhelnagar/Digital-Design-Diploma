

module ram (din,dout,rx,tx,clk,rst_n);
        parameter MEM_DEPTH = 256;
        parameter ADDER_SIZE =8;
        input [ADDER_SIZE+1:0] din;
        output reg [ADDER_SIZE-1:0] dout;
        input rx,clk,rst_n;
        output  reg tx;
        reg [ADDER_SIZE-1:0] mem [MEM_DEPTH-1:0];
        reg [ADDER_SIZE-1:0] internal_addr;

        always @(posedge clk ) begin
        if (~rst_n)
        dout <=0;
        else begin
            if (din[9:8] == 2'b00 && rx== 1)begin
                internal_addr <= din[7:0];
                tx =0;  
            end
            else if (din[9:8] == 2'b10 && rx== 1)begin
                internal_addr <= din[7:0];
                tx =0;    
            end 
            else if (din[9:8] == 2'b01 && rx== 1)begin
                mem[internal_addr] <= din[7:0];
                tx = 0;    
            end 
            else if (din[9:8] == 2'b11 && rx== 1)begin
                dout <= mem[internal_addr];
                tx =1;     
            end 
            else
                tx=0;
        end
   end
endmodule