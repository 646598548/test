circuit fp2fix :
  module fp2fix :
    input clock : Clock
    input reset : UInt<1>
    input io_fpin1 : UInt<16>
    input io_fpin2 : UInt<16>
    output io_exp_out : UInt<5>
    output io_mout1 : UInt<10>
    output io_mout2 : UInt<10>
    output io_sign : UInt<1>
    output io_except_code : UInt<2>

    node _in1temp_T = bits(io_fpin1, 14, 10) @[pass.scala 46:22]
    node _in2temp_T = bits(io_fpin2, 14, 10) @[pass.scala 47:22]
    node in1temp = pad(_in1temp_T, 6)
    node in2temp = pad(_in2temp_T, 6)
    node _exp_temp_T = sub(in1temp, in2temp) @[pass.scala 48:22]
    node _exp_temp_T_1 = tail(_exp_temp_T, 1) @[pass.scala 48:22]
    node _exp_temp_T_2 = add(_exp_temp_T_1, UInt<4>("hf")) @[pass.scala 48:30]
    node _exp_temp_T_3 = tail(_exp_temp_T_2, 1) @[pass.scala 48:30]
    node exp_temp = _exp_temp_T_3
    node _io_except_code_T = bits(exp_temp, 5, 5) @[pass.scala 49:33]
    node _io_except_code_T_1 = eq(_io_except_code_T, UInt<1>("h1")) @[pass.scala 49:36]
    node _io_except_code_T_2 = gt(in1temp, in2temp) @[pass.scala 49:54]
    node _io_except_code_T_3 = mux(_io_except_code_T_2, UInt<1>("h1"), UInt<2>("h2")) @[pass.scala 49:46]
    node _io_except_code_T_4 = mux(_io_except_code_T_1, _io_except_code_T_3, UInt<1>("h0")) @[pass.scala 49:24]
    node _io_exp_out_T = bits(exp_temp, 4, 0) @[pass.scala 50:25]
    node _io_mout1_T = bits(io_fpin1, 9, 0) @[pass.scala 51:23]
    node _io_mout2_T = bits(io_fpin2, 9, 0) @[pass.scala 52:23]
    node _io_sign_T = bits(io_fpin1, 15, 15) @[pass.scala 53:22]
    node _io_sign_T_1 = bits(io_fpin2, 15, 15) @[pass.scala 53:35]
    node _io_sign_T_2 = xor(_io_sign_T, _io_sign_T_1) @[pass.scala 53:26]
    io_exp_out <= _io_exp_out_T @[pass.scala 50:15]
    io_mout1 <= _io_mout1_T @[pass.scala 51:13]
    io_mout2 <= _io_mout2_T @[pass.scala 52:13]
    io_sign <= _io_sign_T_2 @[pass.scala 53:12]
    io_except_code <= _io_except_code_T_4 @[pass.scala 49:19]
