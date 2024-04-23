module fp2fix(
  input         clock,
  input         reset,
  input  [15:0] io_fpin1,
  input  [15:0] io_fpin2,
  output [4:0]  io_exp_out,
  output [9:0]  io_mout1,
  output [9:0]  io_mout2,
  output        io_sign,
  output [1:0]  io_except_code
);
  wire [5:0] in1temp = {{1'd0}, io_fpin1[14:10]};
  wire [5:0] in2temp = {{1'd0}, io_fpin2[14:10]};
  wire [5:0] _exp_temp_T_1 = in1temp - in2temp; // @[pass.scala 48:22]
  wire [5:0] exp_temp = _exp_temp_T_1 + 6'hf; // @[pass.scala 48:30]
  wire [1:0] _io_except_code_T_3 = in1temp > in2temp ? 2'h1 : 2'h2; // @[pass.scala 49:46]
  assign io_exp_out = exp_temp[4:0]; // @[pass.scala 50:25]
  assign io_mout1 = io_fpin1[9:0]; // @[pass.scala 51:23]
  assign io_mout2 = io_fpin2[9:0]; // @[pass.scala 52:23]
  assign io_sign = io_fpin1[15] ^ io_fpin2[15]; // @[pass.scala 53:26]
  assign io_except_code = exp_temp[5] ? _io_except_code_T_3 : 2'h0; // @[pass.scala 49:24]
endmodule
