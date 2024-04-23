circuit float_div_lut :
  module sign_exp :
    input clock : Clock
    input reset : Reset
    output io : { flip fpin1 : UInt<16>, flip fpin2 : UInt<16>, exp_out : UInt<5>, mout1 : UInt<10>, mout2 : UInt<10>, sign : UInt<1>, except_code : UInt<2>}

    wire exp_temp : UInt<6>
    exp_temp <= UInt<6>("h0")
    wire in1temp : UInt<6>
    in1temp <= UInt<6>("h0")
    wire in2temp : UInt<6>
    in2temp <= UInt<6>("h0")
    node _in1temp_T = bits(io.fpin1, 14, 10) @[pass.scala 20:22]
    in1temp <= _in1temp_T @[pass.scala 20:12]
    node _in2temp_T = bits(io.fpin2, 14, 10) @[pass.scala 21:22]
    in2temp <= _in2temp_T @[pass.scala 21:12]
    node _exp_temp_T = sub(in1temp, in2temp) @[pass.scala 22:22]
    node _exp_temp_T_1 = tail(_exp_temp_T, 1) @[pass.scala 22:22]
    node _exp_temp_T_2 = add(_exp_temp_T_1, UInt<4>("hf")) @[pass.scala 22:30]
    node _exp_temp_T_3 = tail(_exp_temp_T_2, 1) @[pass.scala 22:30]
    exp_temp <= _exp_temp_T_3 @[pass.scala 22:13]
    node _io_except_code_T = bits(exp_temp, 5, 5) @[pass.scala 23:33]
    node _io_except_code_T_1 = eq(_io_except_code_T, UInt<1>("h1")) @[pass.scala 23:36]
    node _io_except_code_T_2 = gt(in1temp, in2temp) @[pass.scala 23:54]
    node _io_except_code_T_3 = mux(_io_except_code_T_2, UInt<1>("h1"), UInt<2>("h2")) @[pass.scala 23:46]
    node _io_except_code_T_4 = mux(_io_except_code_T_1, _io_except_code_T_3, UInt<1>("h0")) @[pass.scala 23:24]
    io.except_code <= _io_except_code_T_4 @[pass.scala 23:19]
    node _io_exp_out_T = bits(exp_temp, 4, 0) @[pass.scala 24:25]
    io.exp_out <= _io_exp_out_T @[pass.scala 24:15]
    node _io_mout1_T = bits(io.fpin1, 9, 0) @[pass.scala 25:23]
    io.mout1 <= _io_mout1_T @[pass.scala 25:13]
    node _io_mout2_T = bits(io.fpin2, 9, 0) @[pass.scala 26:23]
    io.mout2 <= _io_mout2_T @[pass.scala 26:13]
    node _io_sign_T = bits(io.fpin1, 15, 15) @[pass.scala 27:26]
    node _io_sign_T_1 = bits(io.fpin2, 15, 15) @[pass.scala 27:41]
    node _io_sign_T_2 = eq(_io_sign_T, _io_sign_T_1) @[pass.scala 27:30]
    node _io_sign_T_3 = mux(_io_sign_T_2, UInt<1>("h1"), UInt<1>("h0")) @[pass.scala 27:17]
    io.sign <= _io_sign_T_3 @[pass.scala 27:12]

  module init_mem :
    input clock : Clock
    input reset : Reset
    output io : { flip addr : UInt<4>, dataOut : UInt<4>[4]}

    smem mem : UInt<4>[4] [16] @[pass.scala 36:24]
    infer mport MPORT = mem[io.addr], clock @[pass.scala 38:20]
    io.dataOut <= MPORT @[pass.scala 38:15]

  module fix_div :
    input clock : Clock
    input reset : Reset
    output io : { flip dividend : UInt<10>, flip divsor : UInt<10>, out : UInt<11>}

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
    node _temp1_T = dshr(dividend_temp, mem_out[0]) @[pass.scala 55:25]
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
    io.out <= out_temp @[pass.scala 63:11]

  module float_div_lut :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip dividend_float : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, flip divsor_float : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, exception : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<2>}, div_out : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}

    inst separate_float of sign_exp @[pass.scala 74:30]
    separate_float.clock <= clock
    separate_float.reset <= reset
    wire temp_exp : UInt<5>
    temp_exp <= UInt<5>("h0")
    inst u_fix_div of fix_div @[pass.scala 76:25]
    u_fix_div.clock <= clock
    u_fix_div.reset <= reset
    wire temp_m : UInt<11>
    temp_m <= UInt<11>("h0")
    reg cnt : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[pass.scala 78:20]
    node _cnt_T = eq(cnt, UInt<1>("h1")) @[pass.scala 79:17]
    node _cnt_T_1 = add(cnt, UInt<1>("h1")) @[pass.scala 79:31]
    node _cnt_T_2 = tail(_cnt_T_1, 1) @[pass.scala 79:31]
    node _cnt_T_3 = mux(_cnt_T, UInt<1>("h0"), _cnt_T_2) @[pass.scala 79:13]
    cnt <= _cnt_T_3 @[pass.scala 79:8]
    io.dividend_float.ready <= UInt<1>("h0") @[pass.scala 81:32]
    io.divsor_float.ready <= UInt<1>("h0") @[pass.scala 82:30]
    io.exception.valid <= UInt<1>("h0") @[pass.scala 83:27]
    io.div_out.valid <= UInt<1>("h0") @[pass.scala 84:25]
    node _T = eq(cnt, UInt<1>("h0")) @[pass.scala 86:13]
    when _T : @[pass.scala 86:20]
      io.dividend_float.ready <= UInt<1>("h1") @[pass.scala 87:32]
      io.divsor_float.ready <= UInt<1>("h1") @[pass.scala 88:30]
      io.exception.valid <= UInt<1>("h0") @[pass.scala 89:27]
      io.div_out.valid <= UInt<1>("h0") @[pass.scala 90:25]
    separate_float.io.fpin1 <= io.dividend_float.bits @[pass.scala 93:28]
    separate_float.io.fpin2 <= io.divsor_float.bits @[pass.scala 94:28]
    io.exception.bits <= separate_float.io.except_code @[pass.scala 95:22]
    u_fix_div.io.dividend <= separate_float.io.mout1 @[pass.scala 98:26]
    u_fix_div.io.divsor <= separate_float.io.mout2 @[pass.scala 99:26]
    node _T_1 = bits(u_fix_div.io.out, 10, 10) @[pass.scala 101:26]
    node _T_2 = eq(_T_1, UInt<1>("h1")) @[pass.scala 101:30]
    when _T_2 : @[pass.scala 101:37]
      temp_m <= u_fix_div.io.out @[pass.scala 102:15]
      temp_exp <= separate_float.io.exp_out @[pass.scala 103:17]
    else :
      node _temp_m_T = dshl(u_fix_div.io.out, UInt<1>("h1")) @[pass.scala 105:33]
      temp_m <= _temp_m_T @[pass.scala 105:15]
      node _temp_exp_T = sub(separate_float.io.exp_out, UInt<1>("h1")) @[pass.scala 106:44]
      node _temp_exp_T_1 = tail(_temp_exp_T, 1) @[pass.scala 106:44]
      temp_exp <= _temp_exp_T_1 @[pass.scala 106:17]
    node _T_3 = eq(cnt, UInt<1>("h1")) @[pass.scala 108:13]
    when _T_3 : @[pass.scala 108:20]
      io.exception.valid <= UInt<1>("h1") @[pass.scala 109:27]
      io.div_out.valid <= UInt<1>("h1") @[pass.scala 110:25]
      io.dividend_float.ready <= UInt<1>("h0") @[pass.scala 111:32]
      io.divsor_float.ready <= UInt<1>("h0") @[pass.scala 112:30]
    node _io_div_out_bits_T = cat(separate_float.io.sign, temp_exp) @[pass.scala 114:45]
    node _io_div_out_bits_T_1 = bits(temp_m, 9, 0) @[pass.scala 114:63]
    node _io_div_out_bits_T_2 = cat(_io_div_out_bits_T, _io_div_out_bits_T_1) @[pass.scala 114:55]
    io.div_out.bits <= _io_div_out_bits_T_2 @[pass.scala 114:21]

