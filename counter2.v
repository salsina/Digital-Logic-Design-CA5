module counter2(input en,clk,num,output reg done);
  reg [5:0] count_num;
  always@(posedge clk)begin
    if(en == 0)begin done = 0;count_num = 6'b0;end
    else begin
      if(count_num == num )done =1;
      else count_num = count_num + 1;
    end
  end
endmodule

