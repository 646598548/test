module init_mem(
  input        clock,
  input        reset,
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
