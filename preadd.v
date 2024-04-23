module preadd(
  input        clock,
  input        reset,
  input  [3:0] io_a_in,
  input  [3:0] io_b_in,
  input        io_c_in,
  output [3:0] io_s,
  output       io_cout
);
  wire  p_1 = io_a_in[0] ^ io_b_in[0]; // @[pass.scala 18:27]
  wire  g_1 = io_a_in[0] & io_b_in[0]; // @[pass.scala 19:27]
  wire  p_2 = io_a_in[1] ^ io_b_in[1]; // @[pass.scala 18:27]
  wire  g_2 = io_a_in[1] & io_b_in[1]; // @[pass.scala 19:27]
  wire  p_3 = io_a_in[2] ^ io_b_in[2]; // @[pass.scala 18:27]
  wire  g_3 = io_a_in[2] & io_b_in[2]; // @[pass.scala 19:27]
  wire  p_4 = io_a_in[3] ^ io_b_in[3]; // @[pass.scala 18:27]
  wire  g_4 = io_a_in[3] & io_b_in[3]; // @[pass.scala 19:27]
  wire  stemp_1 = p_1 ^ io_c_in; // @[pass.scala 23:23]
  wire  c_1 = g_1 | io_c_in & p_1; // @[pass.scala 24:19]
  wire  stemp_2 = p_2 ^ c_1; // @[pass.scala 23:23]
  wire  c_2 = g_2 | c_1 & p_2; // @[pass.scala 24:19]
  wire  stemp_3 = p_3 ^ c_2; // @[pass.scala 23:23]
  wire  c_3 = g_3 | c_2 & p_3; // @[pass.scala 24:19]
  wire  stemp_4 = p_4 ^ c_3; // @[pass.scala 23:23]
  wire [1:0] io_s_lo = {stemp_2,stemp_1}; // @[pass.scala 30:22]
  wire [1:0] io_s_hi = {stemp_4,stemp_3}; // @[pass.scala 30:22]
  assign io_s = {io_s_hi,io_s_lo}; // @[pass.scala 30:22]
  assign io_cout = g_4 | c_3 & p_4; // @[pass.scala 24:19]
endmodule
