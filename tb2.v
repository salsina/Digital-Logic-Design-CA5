module tb2();
  reg serin,clk,reset;
  wire valid;
  wire [5:0] sports,num;
  wire count_done1,count_done2;
  wire enc1,enc2;
  cntrlr4 cnt(count_done1,count_done2,serin,clk,reset,valid,enc1,enc2,sports,num);
  counter c(enc1,clk,count_done1);
  counter2 c2(enc2,clk,num,count_done2);
  initial begin
    reset = 1;
    clk = 0;
    serin = 1;
    #30 reset = 0;
    #30 clk = 1;
    #30 clk = 0;
    
    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;
    // $display("kir %d",num);
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;
 //$display("kir %d",num);
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;
 //$display("kir %d",num);
    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

//end of first 6bits

    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;
// $display("kir %d",num);
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

//end of second 6bits

    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;
//end of inputs


    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;

    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;
    
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;
    
    //end of inputs 2
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;
    
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;
//do again    
    #30 serin = 0;
    #30 clk = 1;
    #30 clk = 0;
    
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;
    
    #30 serin = 1;
    #30 clk = 1;
    #30 clk = 0;

    

  end
endmodule


