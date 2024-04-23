module div(
  input        clock,
  input        reset,
  input  [9:0] io_dividend,
  input  [9:0] io_divisor,
  output [9:0] io_divout,
  output [9:0] io_remain,
  output       io_div_done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] dividend_temp; // @[pass.scala 41:34]
  reg [19:0] divisor_temp; // @[pass.scala 42:33]
  reg [4:0] cnt; // @[pass.scala 45:24]
  wire  comp = dividend_temp[19:10] >= divisor_temp[19:10]; // @[pass.scala 53:35]
  wire [19:0] _temp_T_2 = dividend_temp - divisor_temp; // @[pass.scala 51:45]
  wire [19:0] _temp_T_4 = _temp_T_2 + 20'h1; // @[pass.scala 51:58]
  wire [20:0] _temp_T_5 = {_temp_T_4, 1'h0}; // @[pass.scala 51:63]
  wire [20:0] _temp_T_6 = {dividend_temp, 1'h0}; // @[pass.scala 51:82]
  wire [20:0] _temp_T_7 = comp ? _temp_T_5 : _temp_T_6; // @[pass.scala 51:18]
  wire [19:0] _divisor_temp_T = {io_divisor, 10'h0}; // @[pass.scala 58:37]
  wire [4:0] _cnt_T_1 = cnt + 5'h1; // @[pass.scala 59:21]
  wire [19:0] temp = _temp_T_7[19:0];
  wire  r_out_0 = dividend_temp[10]; // @[pass.scala 75:36]
  wire  d_out_0 = dividend_temp[0]; // @[pass.scala 76:36]
  wire  r_out_1 = dividend_temp[11]; // @[pass.scala 75:36]
  wire  d_out_1 = dividend_temp[1]; // @[pass.scala 76:36]
  wire  r_out_2 = dividend_temp[12]; // @[pass.scala 75:36]
  wire  d_out_2 = dividend_temp[2]; // @[pass.scala 76:36]
  wire  r_out_3 = dividend_temp[13]; // @[pass.scala 75:36]
  wire  d_out_3 = dividend_temp[3]; // @[pass.scala 76:36]
  wire  r_out_4 = dividend_temp[14]; // @[pass.scala 75:36]
  wire  d_out_4 = dividend_temp[4]; // @[pass.scala 76:36]
  wire  r_out_5 = dividend_temp[15]; // @[pass.scala 75:36]
  wire  d_out_5 = dividend_temp[5]; // @[pass.scala 76:36]
  wire  r_out_6 = dividend_temp[16]; // @[pass.scala 75:36]
  wire  d_out_6 = dividend_temp[6]; // @[pass.scala 76:36]
  wire  r_out_7 = dividend_temp[17]; // @[pass.scala 75:36]
  wire  d_out_7 = dividend_temp[7]; // @[pass.scala 76:36]
  wire  r_out_8 = dividend_temp[18]; // @[pass.scala 75:36]
  wire  d_out_8 = dividend_temp[8]; // @[pass.scala 76:36]
  wire  r_out_9 = dividend_temp[19]; // @[pass.scala 75:36]
  wire  d_out_9 = dividend_temp[9]; // @[pass.scala 76:36]
  wire [4:0] io_remain_lo = {r_out_4,r_out_3,r_out_2,r_out_1,r_out_0}; // @[pass.scala 78:26]
  wire [4:0] io_remain_hi = {r_out_9,r_out_8,r_out_7,r_out_6,r_out_5}; // @[pass.scala 78:26]
  wire [4:0] io_divout_lo = {d_out_4,d_out_3,d_out_2,d_out_1,d_out_0}; // @[pass.scala 79:26]
  wire [4:0] io_divout_hi = {d_out_9,d_out_8,d_out_7,d_out_6,d_out_5}; // @[pass.scala 79:26]
  assign io_divout = {io_divout_hi,io_divout_lo}; // @[pass.scala 79:26]
  assign io_remain = {io_remain_hi,io_remain_lo}; // @[pass.scala 78:26]
  assign io_div_done = cnt == 5'hb; // @[pass.scala 80:29]
  always @(posedge clock) begin
    if (reset) begin // @[pass.scala 41:34]
      dividend_temp <= 20'h0; // @[pass.scala 41:34]
    end else if (cnt == 5'h0) begin // @[pass.scala 55:24]
      dividend_temp <= {{10'd0}, io_dividend}; // @[pass.scala 57:26]
    end else if (cnt != 5'hc) begin // @[pass.scala 60:31]
      dividend_temp <= temp; // @[pass.scala 61:26]
    end
    if (reset) begin // @[pass.scala 42:33]
      divisor_temp <= 20'h0; // @[pass.scala 42:33]
    end else if (cnt == 5'h0) begin // @[pass.scala 55:24]
      divisor_temp <= _divisor_temp_T; // @[pass.scala 58:25]
    end
    if (reset) begin // @[pass.scala 45:24]
      cnt <= 5'h0; // @[pass.scala 45:24]
    end else if (cnt == 5'h0) begin // @[pass.scala 55:24]
      cnt <= _cnt_T_1; // @[pass.scala 59:16]
    end else if (cnt != 5'hc) begin // @[pass.scala 60:31]
      cnt <= _cnt_T_1; // @[pass.scala 62:16]
    end else begin
      cnt <= 5'h0; // @[pass.scala 72:16]
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
  dividend_temp = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  divisor_temp = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  cnt = _RAND_2[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
