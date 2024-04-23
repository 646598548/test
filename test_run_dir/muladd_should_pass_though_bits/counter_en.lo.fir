circuit counter_en :
  module counter_en :
    input clock : Clock
    input reset : UInt<1>
    input io_en : UInt<1>
    output io_out : UInt<4>

    reg count : UInt<4>, clock with :
      reset => (UInt<1>("h0"), count) @[pass.scala 24:22]
    node _T = neq(count, UInt<4>("h9")) @[pass.scala 25:21]
    node _T_1 = and(io_en, _T) @[pass.scala 25:15]
    node _count_T = add(count, UInt<1>("h1")) @[pass.scala 26:21]
    node _count_T_1 = tail(_count_T, 1) @[pass.scala 26:21]
    node _GEN_0 = mux(_T_1, _count_T_1, UInt<1>("h0")) @[pass.scala 25:28 26:14 28:14]
    io_out <= count @[pass.scala 30:11]
    count <= mux(reset, UInt<4>("h0"), _GEN_0) @[pass.scala 24:{22,22}]
