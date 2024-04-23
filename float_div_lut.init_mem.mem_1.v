module BindsTo_1_init_mem(
  input        clock,
  input  [3:0] io_addr,
  output [3:0] io_dataOut_0,
  output [3:0] io_dataOut_1,
  output [3:0] io_dataOut_2,
  output [3:0] io_dataOut_3
);

initial begin
  $readmemh("mem_1.txt", init_mem.mem_1);
end
                      endmodule

bind init_mem BindsTo_1_init_mem BindsTo_1_init_mem_Inst(.*);