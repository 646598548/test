circuit fp2fix :
  module fp2fix :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip fpin1 : UInt<16>, flip fpin2 : UInt<16>, exp_out : UInt<5>, mout1 : UInt<10>, mout2 : UInt<10>, sign : UInt<1>, except_code : UInt<2>}

    wire exp_temp : UInt<6>
    exp_temp <= UInt<6>("h0")
    wire in1temp : UInt<6>
    in1temp <= UInt<6>("h0")
    wire in2temp : UInt<6>
    in2temp <= UInt<6>("h0")
    node _in1temp_T = bits(io.fpin1, 14, 10) @[pass.scala 46:22]
    in1temp <= _in1temp_T @[pass.scala 46:12]
    node _in2temp_T = bits(io.fpin2, 14, 10) @[pass.scala 47:22]
    in2temp <= _in2temp_T @[pass.scala 47:12]
    node _exp_temp_T = sub(in1temp, in2temp) @[pass.scala 48:22]
    node _exp_temp_T_1 = tail(_exp_temp_T, 1) @[pass.scala 48:22]
    node _exp_temp_T_2 = add(_exp_temp_T_1, UInt<4>("hf")) @[pass.scala 48:30]
    node _exp_temp_T_3 = tail(_exp_temp_T_2, 1) @[pass.scala 48:30]
    exp_temp <= _exp_temp_T_3 @[pass.scala 48:13]
    node _io_except_code_T = bits(exp_temp, 5, 5) @[pass.scala 49:33]
    node _io_except_code_T_1 = eq(_io_except_code_T, UInt<1>("h1")) @[pass.scala 49:36]
    node _io_except_code_T_2 = gt(in1temp, in2temp) @[pass.scala 49:54]
    node _io_except_code_T_3 = mux(_io_except_code_T_2, UInt<1>("h1"), UInt<2>("h2")) @[pass.scala 49:46]
    node _io_except_code_T_4 = mux(_io_except_code_T_1, _io_except_code_T_3, UInt<1>("h0")) @[pass.scala 49:24]
    io.except_code <= _io_except_code_T_4 @[pass.scala 49:19]
    node _io_exp_out_T = bits(exp_temp, 4, 0) @[pass.scala 50:25]
    io.exp_out <= _io_exp_out_T @[pass.scala 50:15]
    node _io_mout1_T = bits(io.fpin1, 9, 0) @[pass.scala 51:23]
    io.mout1 <= _io_mout1_T @[pass.scala 51:13]
    node _io_mout2_T = bits(io.fpin2, 9, 0) @[pass.scala 52:23]
    io.mout2 <= _io_mout2_T @[pass.scala 52:13]
    node _io_sign_T = bits(io.fpin1, 15, 15) @[pass.scala 53:22]
    node _io_sign_T_1 = bits(io.fpin2, 15, 15) @[pass.scala 53:35]
    node _io_sign_T_2 = xor(_io_sign_T, _io_sign_T_1) @[pass.scala 53:26]
    io.sign <= _io_sign_T_2 @[pass.scala 53:12]

