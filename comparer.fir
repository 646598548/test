circuit comparer :
  module comparer :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a_in : UInt<10>, flip b_in : UInt<10>, out : UInt<1>}

    wire temp : UInt<1>
    temp <= UInt<1>("h0")
    node _T = geq(io.a_in, io.b_in) @[pass.scala 11:17]
    when _T : @[pass.scala 11:27]
      temp <= UInt<1>("h1") @[pass.scala 12:14]
    else :
      temp <= UInt<1>("h0") @[pass.scala 14:14]
    io.out <= temp @[pass.scala 16:11]

