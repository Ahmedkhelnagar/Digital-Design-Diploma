

module SLE(D,clk,EN,Aln,ADn,SLn,SD,LAT,Q);
    input D,clk,EN,Aln,ADn,SLn,SD,LAT;
    output reg Q;
    reg Q_FF;
    reg Q_Latch;
    reg Q_Aln;

    //Flip_Flop
    always @(posedge clk or negedge Aln) begin
        if(~Aln)begin
            Q_Aln <= !ADn;
        end
        else if(EN)begin
            if(~SLn)begin
                Q_FF <= SD;
            end
            else begin
                Q_FF <= D;
            end
        end
    end

    //Latch
    always@(*)begin
        if(~SLn)begin
            Q_Latch <= SD;
        end
        else begin
            Q_Latch <= D;
        end
    end

    //Always to extract the output Q to avoid miltiple drivers.
    always@(*)begin
        if(~Aln)begin
            Q = Q_Aln;
        end
        else if(LAT)begin
            Q = Q_Latch; 
        end
        else begin 
            Q = Q_FF;
        end
    end
    //assign Q = (LAT) ? Q_Latch : Q_FF;
endmodule   