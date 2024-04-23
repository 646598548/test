circuit init_mem :
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
