circuit fix_div :
  module init_mem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<4>
    output io_dataOut_0 : UInt<4>
    output io_dataOut_1 : UInt<4>
    output io_dataOut_2 : UInt<4>
    output io_dataOut_3 : UInt<4>

    mem mem_0 : @[pass.scala 36:24]
      data-type => UInt<4>
      depth => 16
      read-latency => 1
      write-latency => 1
      reader => MPORT
      read-under-write => undefined
    mem mem_1 : @[pass.scala 36:24]
      data-type => UInt<4>
      depth => 16
      read-latency => 1
      write-latency => 1
      reader => MPORT
      read-under-write => undefined
    mem mem_2 : @[pass.scala 36:24]
      data-type => UInt<4>
      depth => 16
      read-latency => 1
      write-latency => 1
      reader => MPORT
      read-under-write => undefined
    mem mem_3 : @[pass.scala 36:24]
      data-type => UInt<4>
      depth => 16
      read-latency => 1
      write-latency => 1
      reader => MPORT
      read-under-write => undefined
    io_dataOut_0 <= mem_0.MPORT.data @[pass.scala 38:15]
    io_dataOut_1 <= mem_1.MPORT.data @[pass.scala 38:15]
    io_dataOut_2 <= mem_2.MPORT.data @[pass.scala 38:15]
    io_dataOut_3 <= mem_3.MPORT.data @[pass.scala 38:15]
    mem_0.MPORT.addr <= io_addr @[pass.scala 38:20]
    mem_1.MPORT.addr <= io_addr @[pass.scala 38:20]
    mem_2.MPORT.addr <= io_addr @[pass.scala 38:20]
    mem_3.MPORT.addr <= io_addr @[pass.scala 38:20]
    mem_0.MPORT.en <= UInt<1>("h1") @[pass.scala 38:20]
    mem_1.MPORT.en <= UInt<1>("h1") @[pass.scala 38:20]
    mem_2.MPORT.en <= UInt<1>("h1") @[pass.scala 38:20]
    mem_3.MPORT.en <= UInt<1>("h1") @[pass.scala 38:20]
    mem_0.MPORT.clk <= clock @[pass.scala 38:20]
    mem_1.MPORT.clk <= clock @[pass.scala 38:20]
    mem_2.MPORT.clk <= clock @[pass.scala 38:20]
    mem_3.MPORT.clk <= clock @[pass.scala 38:20]

  module fix_div :
    input clock : Clock
    input reset : UInt<1>
    input io_dividend : UInt<10>
    input io_divsor : UInt<10>
    output io_out : UInt<10>

    inst mem of init_mem @[pass.scala 47:19]
    node _dividend_temp_T = cat(UInt<1>("h1"), io_dividend) @[pass.scala 59:26]
    node dividend_temp = _dividend_temp_T
    node mem_out_0 = mem.io_dataOut_0 @[pass.scala 50:32 61:12]
    node _temp1_T = dshr(dividend_temp, mem_out_0) @[pass.scala 55:25]
    node mem_out_1 = mem.io_dataOut_1 @[pass.scala 50:32 61:12]
    node _temp2_T = dshr(dividend_temp, mem_out_1) @[pass.scala 56:25]
    node mem_out_2 = mem.io_dataOut_2 @[pass.scala 50:32 61:12]
    node _temp3_T = dshr(dividend_temp, mem_out_2) @[pass.scala 57:25]
    node mem_out_3 = mem.io_dataOut_3 @[pass.scala 50:32 61:12]
    node _temp4_T = dshr(dividend_temp, mem_out_3) @[pass.scala 58:25]
    node _mem_io_addr_T = bits(io_divsor, 9, 6) @[pass.scala 60:27]
    node temp1 = _temp1_T
    node temp2 = _temp2_T
    node _out_temp_T = add(temp1, temp2) @[pass.scala 63:20]
    node _out_temp_T_1 = tail(_out_temp_T, 1) @[pass.scala 63:20]
    node temp3 = _temp3_T
    node _out_temp_T_2 = add(_out_temp_T_1, temp3) @[pass.scala 63:26]
    node _out_temp_T_3 = tail(_out_temp_T_2, 1) @[pass.scala 63:26]
    node temp4 = _temp4_T
    node _out_temp_T_4 = add(_out_temp_T_3, temp4) @[pass.scala 63:32]
    node _out_temp_T_5 = tail(_out_temp_T_4, 1) @[pass.scala 63:32]
    node out_temp = _out_temp_T_5
    node _io_out_T = bits(out_temp, 9, 0) @[pass.scala 65:21]
    io_out <= _io_out_T @[pass.scala 65:11]
    mem.clock <= clock
    mem.reset <= reset
    mem.io_addr <= _mem_io_addr_T @[pass.scala 60:16]
