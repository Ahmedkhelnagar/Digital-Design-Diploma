

module comparator(a,b,x,y,z);
    input [3:0] a,b;
    output reg x,y,z;

    always @(*) begin    
        
        if(a>b)begin
            x=1;
            y=0;
            z=0;
        end
        else if(a == b)begin
            x=0;
            y=1;
            z=0;
        end
        else if(a<b)begin
            x=0;
            y=0;
            z=1;
        end
    end

endmodule
