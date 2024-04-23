circuit counter_en :
  module counter_en :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip en : UInt<1>, out : UInt<4>}

    reg count : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[pass.scala 24:22]
    node _T = neq(count, UInt<4>("h9")) @[pass.scala 25:21]
    node _T_1 = and(io.en, _T) @[pass.scala 25:15]
    when _T_1 : @[pass.scala 25:28]
      node _count_T = add(count, UInt<1>("h1")) @[pass.scala 26:21]
      node _count_T_1 = tail(_count_T, 1) @[pass.scala 26:21]
      count <= _count_T_1 @[pass.scala 26:14]
    else :
      count <= UInt<1>("h0") @[pass.scala 28:14]
    io.out <= count @[pass.scala 30:11]

