circuit fix_div :
  module init_mem :
    input clock : Clock
    input reset : Reset
    output io : { flip addr : UInt<4>, dataOut : UInt<4>[4]}

    smem mem : UInt<4>[4] [16] @[pass.scala 36:24]
    infer mport MPORT = mem[io.addr], clock @[pass.scala 38:20]
    io.dataOut <= MPORT @[pass.scala 38:15]

  module fix_div :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip dividend : UInt<10>, flip divsor : UInt<10>, out : UInt<10>}

    inst mem of init_mem @[pass.scala 47:19]
    mem.clock <= clock
    mem.reset <= reset
    wire dividend_temp : UInt<11>
    dividend_temp <= UInt<11>("h0")
    wire out_temp : UInt<11>
    out_temp <= UInt<11>("h0")
    wire mem_out : UInt<4>[4] @[pass.scala 50:32]
    mem_out[0] <= UInt<4>("h0") @[pass.scala 50:32]
    mem_out[1] <= UInt<4>("h0") @[pass.scala 50:32]
    mem_out[2] <= UInt<4>("h0") @[pass.scala 50:32]
    mem_out[3] <= UInt<4>("h0") @[pass.scala 50:32]
    wire temp1 : UInt<11>
    temp1 <= UInt<11>("h0")
    wire temp2 : UInt<11>
    temp2 <= UInt<11>("h0")
    wire temp3 : UInt<11>
    temp3 <= UInt<11>("h0")
    wire temp4 : UInt<11>
    temp4 <= UInt<11>("h0")
    node _temp1_T = shr(dividend_temp, 0) @[pass.scala 55:25]
    temp1 <= _temp1_T @[pass.scala 55:10]
    node _temp2_T = dshr(dividend_temp, mem_out[1]) @[pass.scala 56:25]
    temp2 <= _temp2_T @[pass.scala 56:10]
    node _temp3_T = dshr(dividend_temp, mem_out[2]) @[pass.scala 57:25]
    temp3 <= _temp3_T @[pass.scala 57:10]
    node _temp4_T = dshr(dividend_temp, mem_out[3]) @[pass.scala 58:25]
    temp4 <= _temp4_T @[pass.scala 58:10]
    node _dividend_temp_T = cat(UInt<1>("h1"), io.dividend) @[pass.scala 59:26]
    dividend_temp <= _dividend_temp_T @[pass.scala 59:18]
    node _mem_io_addr_T = bits(io.divsor, 9, 6) @[pass.scala 60:27]
    mem.io.addr <= _mem_io_addr_T @[pass.scala 60:16]
    mem_out <= mem.io.dataOut @[pass.scala 61:12]
    node _out_temp_T = add(temp1, temp2) @[pass.scala 62:20]
    node _out_temp_T_1 = tail(_out_temp_T, 1) @[pass.scala 62:20]
    node _out_temp_T_2 = add(_out_temp_T_1, temp3) @[pass.scala 62:26]
    node _out_temp_T_3 = tail(_out_temp_T_2, 1) @[pass.scala 62:26]
    node _out_temp_T_4 = add(_out_temp_T_3, temp4) @[pass.scala 62:32]
    node _out_temp_T_5 = tail(_out_temp_T_4, 1) @[pass.scala 62:32]
    out_temp <= _out_temp_T_5 @[pass.scala 62:13]
    node _io_out_T = bits(out_temp, 9, 0) @[pass.scala 63:21]
    io.out <= _io_out_T @[pass.scala 63:11]

