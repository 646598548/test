module sign_exp(
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
  wire [5:0] _exp_temp_T_1 = in1temp - in2temp; // @[pass.scala 22:22]
  wire [5:0] exp_temp = _exp_temp_T_1 + 6'hf; // @[pass.scala 22:30]
  wire [1:0] _io_except_code_T_3 = in1temp > in2temp ? 2'h1 : 2'h2; // @[pass.scala 23:46]
  assign io_exp_out = exp_temp[4:0]; // @[pass.scala 24:25]
  assign io_mout1 = io_fpin1[9:0]; // @[pass.scala 25:23]
  assign io_mout2 = io_fpin2[9:0]; // @[pass.scala 26:23]
  assign io_sign = io_fpin1[15] == io_fpin2[15]; // @[pass.scala 27:30]
  assign io_except_code = exp_temp[5] ? _io_except_code_T_3 : 2'h0; // @[pass.scala 23:24]
endmodule
module init_mem(
  input        clock,
  input  [3:0] io_addr,
  output [3:0] io_dataOut_0,
  output [3:0] io_dataOut_1,
  output [3:0] io_dataOut_2,
  output [3:0] io_dataOut_3
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] mem_0 [0:15]; // @[pass.scala 36:24]
  wire  mem_0_MPORT_en; // @[pass.scala 36:24]
  wire [3:0] mem_0_MPORT_addr; // @[pass.scala 36:24]
  wire [3:0] mem_0_MPORT_data; // @[pass.scala 36:24]
  reg  mem_0_MPORT_en_pipe_0;
  reg [3:0] mem_0_MPORT_addr_pipe_0;
  reg [3:0] mem_1 [0:15]; // @[pass.scala 36:24]
  wire  mem_1_MPORT_en; // @[pass.scala 36:24]
  wire [3:0] mem_1_MPORT_addr; // @[pass.scala 36:24]
  wire [3:0] mem_1_MPORT_data; // @[pass.scala 36:24]
  reg  mem_1_MPORT_en_pipe_0;
  reg [3:0] mem_1_MPORT_addr_pipe_0;
  reg [3:0] mem_2 [0:15]; // @[pass.scala 36:24]
  wire  mem_2_MPORT_en; // @[pass.scala 36:24]
  wire [3:0] mem_2_MPORT_addr; // @[pass.scala 36:24]
  wire [3:0] mem_2_MPORT_data; // @[pass.scala 36:24]
  reg  mem_2_MPORT_en_pipe_0;
  reg [3:0] mem_2_MPORT_addr_pipe_0;
  reg [3:0] mem_3 [0:15]; // @[pass.scala 36:24]
  wire  mem_3_MPORT_en; // @[pass.scala 36:24]
  wire [3:0] mem_3_MPORT_addr; // @[pass.scala 36:24]
  wire [3:0] mem_3_MPORT_data; // @[pass.scala 36:24]
  reg  mem_3_MPORT_en_pipe_0;
  reg [3:0] mem_3_MPORT_addr_pipe_0;
  assign mem_0_MPORT_en = mem_0_MPORT_en_pipe_0;
  assign mem_0_MPORT_addr = mem_0_MPORT_addr_pipe_0;
  assign mem_0_MPORT_data = mem_0[mem_0_MPORT_addr]; // @[pass.scala 36:24]
  assign mem_1_MPORT_en = mem_1_MPORT_en_pipe_0;
  assign mem_1_MPORT_addr = mem_1_MPORT_addr_pipe_0;
  assign mem_1_MPORT_data = mem_1[mem_1_MPORT_addr]; // @[pass.scala 36:24]
  assign mem_2_MPORT_en = mem_2_MPORT_en_pipe_0;
  assign mem_2_MPORT_addr = mem_2_MPORT_addr_pipe_0;
  assign mem_2_MPORT_data = mem_2[mem_2_MPORT_addr]; // @[pass.scala 36:24]
  assign mem_3_MPORT_en = mem_3_MPORT_en_pipe_0;
  assign mem_3_MPORT_addr = mem_3_MPORT_addr_pipe_0;
  assign mem_3_MPORT_data = mem_3[mem_3_MPORT_addr]; // @[pass.scala 36:24]
  assign io_dataOut_0 = mem_0_MPORT_data; // @[pass.scala 38:15]
  assign io_dataOut_1 = mem_1_MPORT_data; // @[pass.scala 38:15]
  assign io_dataOut_2 = mem_2_MPORT_data; // @[pass.scala 38:15]
  assign io_dataOut_3 = mem_3_MPORT_data; // @[pass.scala 38:15]
  always @(posedge clock) begin
    mem_0_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_MPORT_addr_pipe_0 <= io_addr;
    end
    mem_1_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_MPORT_addr_pipe_0 <= io_addr;
    end
    mem_2_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_MPORT_addr_pipe_0 <= io_addr;
    end
    mem_3_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_MPORT_addr_pipe_0 <= io_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[3:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem_1[initvar] = _RAND_3[3:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem_2[initvar] = _RAND_6[3:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem_3[initvar] = _RAND_9[3:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_MPORT_addr_pipe_0 = _RAND_2[3:0];
  _RAND_4 = {1{`RANDOM}};
  mem_1_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mem_1_MPORT_addr_pipe_0 = _RAND_5[3:0];
  _RAND_7 = {1{`RANDOM}};
  mem_2_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mem_2_MPORT_addr_pipe_0 = _RAND_8[3:0];
  _RAND_10 = {1{`RANDOM}};
  mem_3_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_3_MPORT_addr_pipe_0 = _RAND_11[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module fix_div(
  input         clock,
  input  [9:0]  io_dividend,
  input  [9:0]  io_divsor,
  output [10:0] io_out
);
  wire  mem_clock; // @[pass.scala 47:19]
  wire [3:0] mem_io_addr; // @[pass.scala 47:19]
  wire [3:0] mem_io_dataOut_0; // @[pass.scala 47:19]
  wire [3:0] mem_io_dataOut_1; // @[pass.scala 47:19]
  wire [3:0] mem_io_dataOut_2; // @[pass.scala 47:19]
  wire [3:0] mem_io_dataOut_3; // @[pass.scala 47:19]
  wire [10:0] dividend_temp = {1'h1,io_dividend}; // @[pass.scala 59:26]
  wire [3:0] mem_out_0 = mem_io_dataOut_0; // @[pass.scala 50:32 61:12]
  wire [10:0] temp1 = dividend_temp >> mem_out_0; // @[pass.scala 55:25]
  wire [3:0] mem_out_1 = mem_io_dataOut_1; // @[pass.scala 50:32 61:12]
  wire [10:0] temp2 = dividend_temp >> mem_out_1; // @[pass.scala 56:25]
  wire [3:0] mem_out_2 = mem_io_dataOut_2; // @[pass.scala 50:32 61:12]
  wire [10:0] temp3 = dividend_temp >> mem_out_2; // @[pass.scala 57:25]
  wire [3:0] mem_out_3 = mem_io_dataOut_3; // @[pass.scala 50:32 61:12]
  wire [10:0] temp4 = dividend_temp >> mem_out_3; // @[pass.scala 58:25]
  wire [10:0] _out_temp_T_1 = temp1 + temp2; // @[pass.scala 62:20]
  wire [10:0] _out_temp_T_3 = _out_temp_T_1 + temp3; // @[pass.scala 62:26]
  init_mem mem ( // @[pass.scala 47:19]
    .clock(mem_clock),
    .io_addr(mem_io_addr),
    .io_dataOut_0(mem_io_dataOut_0),
    .io_dataOut_1(mem_io_dataOut_1),
    .io_dataOut_2(mem_io_dataOut_2),
    .io_dataOut_3(mem_io_dataOut_3)
  );
  assign io_out = _out_temp_T_3 + temp4; // @[pass.scala 62:32]
  assign mem_clock = clock;
  assign mem_io_addr = io_divsor[9:6]; // @[pass.scala 60:27]
endmodule
module float_div_lut(
  input         clock,
  input         reset,
  output        io_dividend_float_ready,
  input         io_dividend_float_valid,
  input  [15:0] io_dividend_float_bits,
  output        io_divsor_float_ready,
  input         io_divsor_float_valid,
  input  [15:0] io_divsor_float_bits,
  input         io_exception_ready,
  output        io_exception_valid,
  output [1:0]  io_exception_bits,
  input         io_div_out_ready,
  output        io_div_out_valid,
  output [15:0] io_div_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] separate_float_io_fpin1; // @[pass.scala 74:30]
  wire [15:0] separate_float_io_fpin2; // @[pass.scala 74:30]
  wire [4:0] separate_float_io_exp_out; // @[pass.scala 74:30]
  wire [9:0] separate_float_io_mout1; // @[pass.scala 74:30]
  wire [9:0] separate_float_io_mout2; // @[pass.scala 74:30]
  wire  separate_float_io_sign; // @[pass.scala 74:30]
  wire [1:0] separate_float_io_except_code; // @[pass.scala 74:30]
  wire  u_fix_div_clock; // @[pass.scala 76:25]
  wire [9:0] u_fix_div_io_dividend; // @[pass.scala 76:25]
  wire [9:0] u_fix_div_io_divsor; // @[pass.scala 76:25]
  wire [10:0] u_fix_div_io_out; // @[pass.scala 76:25]
  reg [1:0] cnt; // @[pass.scala 78:20]
  wire  _cnt_T = cnt == 2'h1; // @[pass.scala 79:17]
  wire [1:0] _cnt_T_2 = cnt + 2'h1; // @[pass.scala 79:31]
  wire  _T = cnt == 2'h0; // @[pass.scala 86:13]
  wire [11:0] _temp_m_T = {u_fix_div_io_out, 1'h0}; // @[pass.scala 105:33]
  wire [4:0] _temp_exp_T_1 = separate_float_io_exp_out - 5'h1; // @[pass.scala 106:44]
  wire [11:0] _GEN_2 = u_fix_div_io_out[10] ? {{1'd0}, u_fix_div_io_out} : _temp_m_T; // @[pass.scala 101:37 102:15 105:15]
  wire [4:0] temp_exp = u_fix_div_io_out[10] ? separate_float_io_exp_out : _temp_exp_T_1; // @[pass.scala 101:37 103:17 106:17]
  wire [5:0] _io_div_out_bits_T = {separate_float_io_sign,temp_exp}; // @[pass.scala 114:45]
  wire [10:0] temp_m = _GEN_2[10:0];
  sign_exp separate_float ( // @[pass.scala 74:30]
    .io_fpin1(separate_float_io_fpin1),
    .io_fpin2(separate_float_io_fpin2),
    .io_exp_out(separate_float_io_exp_out),
    .io_mout1(separate_float_io_mout1),
    .io_mout2(separate_float_io_mout2),
    .io_sign(separate_float_io_sign),
    .io_except_code(separate_float_io_except_code)
  );
  fix_div u_fix_div ( // @[pass.scala 76:25]
    .clock(u_fix_div_clock),
    .io_dividend(u_fix_div_io_dividend),
    .io_divsor(u_fix_div_io_divsor),
    .io_out(u_fix_div_io_out)
  );
  assign io_dividend_float_ready = _cnt_T ? 1'h0 : _T; // @[pass.scala 108:20 111:32]
  assign io_divsor_float_ready = _cnt_T ? 1'h0 : _T; // @[pass.scala 108:20 111:32]
  assign io_exception_valid = cnt == 2'h1; // @[pass.scala 108:13]
  assign io_exception_bits = separate_float_io_except_code; // @[pass.scala 95:22]
  assign io_div_out_valid = cnt == 2'h1; // @[pass.scala 108:13]
  assign io_div_out_bits = {_io_div_out_bits_T,temp_m[9:0]}; // @[pass.scala 114:55]
  assign separate_float_io_fpin1 = io_dividend_float_bits; // @[pass.scala 93:28]
  assign separate_float_io_fpin2 = io_divsor_float_bits; // @[pass.scala 94:28]
  assign u_fix_div_clock = clock;
  assign u_fix_div_io_dividend = separate_float_io_mout1; // @[pass.scala 98:26]
  assign u_fix_div_io_divsor = separate_float_io_mout2; // @[pass.scala 99:26]
  always @(posedge clock) begin
    if (reset) begin // @[pass.scala 78:20]
      cnt <= 2'h0; // @[pass.scala 78:20]
    end else if (cnt == 2'h1) begin // @[pass.scala 79:13]
      cnt <= 2'h0;
    end else begin
      cnt <= _cnt_T_2;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cnt = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
