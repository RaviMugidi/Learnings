module top();
  bit clk;
  //initial clk =0;
  always #20 clk =~clk;
  
  inf i1(clk);
  dut d1(i1);
  testcase t1(i1);
endmodule

interface inf(input bit clk);
  logic j,k,rst;
  logic q;
  
  clocking cb@(posedge clk);
    output j;
    output k;
    output rst;
    input q;
  endclocking:cb
  
  modport DUV(input j,k,rst,clk,output q);
  task sync_reset;
    $display("STARTING OF RESET");
    cb.j <=1'b1;
    cb.k <=1'b0;
    cb.rst <=1'b1;
    
    repeat(2) @(cb);
    if(cb.q!=1'b0)
    begin
      $display("RESET IS NOT WORKING PROPERLY");
      $stop;
    end
    else
      $display("RESET IS WORKING PROPERLY\n %0t j=%p k=%p q=%p",$time,j,k,q);
  endtask:sync_reset
  
  task data_00();
    $display("NO CHANGE CONDITION STARTS");
    cb.j <=1'b0;
    cb.k <=1'b0;
    cb.rst <=1'b0;
    
    repeat(2) @(cb);
    
    if(cb.q!=q)
      begin
        $display("NO CHANGE CONDITION IS NOT WORKING");
        $stop;
      end
    else
      $display("NO CHANGE IS WORKING PROPERLY\n %0t j=%p k=%p q=%p",$time,j,k,q);
  endtask:data_00
  
  task data_01();
    $display("RESET CONDITION STARTS");
    cb.j <=1'b0;
    cb.k <=1'b1;
    cb.rst <=1'b0;
    
    repeat(2) @(cb);
    
    if(cb.q!=1'b0)
      begin
        $display("RESET CONDITION IS NOT WORKING");
        $stop;
      end
    else
      $display("RESET IS WORKING PROPERLY\n %0t j=%p k=%p q=%p",$time,j,k,q);
  endtask:data_01
  
  task data_10();
    $display("SET CONDITION STARTS");
    cb.j <=1'b1;
    cb.k <=1'b0;
    cb.rst <=1'b0;
    
    repeat(2) @(cb);
    
    if(cb.q!=1'b1)
      begin
        $display("SET CONDITION IS NOT WORKING");
        $stop;
      end
    else
      $display("SET CONDITION IS WORKING PROPERLY\n %0t j=%p k=%p q=%p",$time,j,k,q);
  endtask:data_10
  
  task data_11();
    $display("TOGGLE CONDITION STARTS");
    cb.j <=1'b1;
    cb.k <=1'b1;
    cb.rst <=1'b0;
    
    repeat(2) @(cb);
    
    if(cb.q!=(~q))
      begin
        $display("TOGGLE CONDITION IS NOT WORKING");
        $stop;
      end
    else
      $display("TOGGLE CONDITION IS WORKING PROPERLY\n %0t j=%p k=%p q=%p",$time,j,k,q);
  endtask:data_11
  
  modport TEST(clocking cb,import task sync_reset(),import task data_00(),import task data_01(),import task data_10(),import task data_11());
  
endinterface

    module dut(inf.DUV in);
  always@(posedge in.clk)
    begin
      if(in.rst)
        in.q <=1'b0;
      else
        begin
          case({in.j,in.k})
            2'b00:in.q <= in.q;
            2'b01:in.q <=1'b0;
            2'b10:in.q <=1'b1;
            2'b11:in.q <= (~in.q);
            default: $display("THANKS");
          endcase
        end
    end
  
endmodule

--------------------------------------------------------------------------------------------------------
// Code your testbench here
// or browse Examples
module testcase(inf.TEST test);
  initial 
    begin
      @(test.cb);
      test.sync_reset();
      test.data_00();
      test.data_01();
      test.data_10();
      test.data_11();
      #30 $finish;
    end
endmodule
