module BindsTo_2_init_mem(
  input        clock,
  input  [3:0] io_addr,
  output [3:0] io_dataOut_1,
  output [3:0] io_dataOut_2,
  output [3:0] io_dataOut_3
);

initial begin
  $readmemh("mem_3.txt", init_mem.mem_3);
end
                      endmodule

bind init_mem BindsTo_2_init_mem BindsTo_2_init_mem_Inst(.*);