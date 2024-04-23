circuit init_mem :
  module init_mem :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip addr : UInt<4>, dataOut : UInt<4>[4]}

    smem mem : UInt<4>[4] [16] @[pass.scala 36:24]
    infer mport MPORT = mem[io.addr], clock @[pass.scala 38:20]
    io.dataOut <= MPORT @[pass.scala 38:15]

