module cntrlr4(input count_done1,count_done2,input serin,clk,rst,output reg valid,encounter1,encounter2,output reg[5:0] smbs_ports,num_of_inputs);
    parameter [1:0] idle = 2'b00,getportandsize = 2'b01,data = 2'b10,endcheck = 2'b11;
    reg [1:0] ps,ns ;
    reg [11:0] portsize;
    always@(posedge clk,posedge rst)begin
      if(rst)begin
            encounter1= 0; 
            encounter2=0;
            valid=0;
            ps<= idle;
            ns <=idle;
            smbs_ports = 6'b000000;
        end
    end
    
  always@(posedge clk,ps)begin
    case(ps)
      idle:begin
        encounter1=0;
        encounter2=0;
        valid = 0;
        smbs_ports = 6'b000000;
        if(serin ==0) ps = getportandsize;
        else ps =idle;
      end
 
      getportandsize:begin
        if(count_done1 == 0)begin
          encounter1 = 1;
          portsize = {serin,portsize[11:1]};
        end 
        else begin
          encounter1=0;
          encounter2=1;
          valid=1;
          smbs_ports = portsize[5:0];
          num_of_inputs = portsize[11:6];
          ps =data;
        end
      end
      
      data:begin
        if(count_done2 == 0)begin
          encounter2 = 1;
          valid=1;
        end
        else begin
          valid=0;
          encounter2=0;
          ps =endcheck;
        end
      end
      
     endcheck:begin
       if (serin == 1) begin valid=0;encounter2=0;ps = idle;end
       else begin valid=1;encounter2=1; ps = data;end
     end
     
     default:begin ps=idle;valid=0; end
       
    endcase
  end
endmodule 