circuit float_div_lut :
  module sign_exp :
    input clock : Clock
    input reset : UInt<1>
    input io_fpin1 : UInt<16>
    input io_fpin2 : UInt<16>
    output io_exp_out : UInt<5>
    output io_mout1 : UInt<10>
    output io_mout2 : UInt<10>
    output io_sign : UInt<1>
    output io_except_code : UInt<2>

    node _in1temp_T = bits(io_fpin1, 14, 10) @[pass.scala 20:22]
    node _in2temp_T = bits(io_fpin2, 14, 10) @[pass.scala 21:22]
    node in1temp = pad(_in1temp_T, 6)
    node in2temp = pad(_in2temp_T, 6)
    node _exp_temp_T = sub(in1temp, in2temp) @[pass.scala 22:22]
    node _exp_temp_T_1 = tail(_exp_temp_T, 1) @[pass.scala 22:22]
    node _exp_temp_T_2 = add(_exp_temp_T_1, UInt<4>("hf")) @[pass.scala 22:30]
    node _exp_temp_T_3 = tail(_exp_temp_T_2, 1) @[pass.scala 22:30]
    node exp_temp = _exp_temp_T_3
    node _io_except_code_T = bits(exp_temp, 5, 5) @[pass.scala 23:33]
    node _io_except_code_T_1 = eq(_io_except_code_T, UInt<1>("h1")) @[pass.scala 23:36]
    node _io_except_code_T_2 = gt(in1temp, in2temp) @[pass.scala 23:54]
    node _io_except_code_T_3 = mux(_io_except_code_T_2, UInt<1>("h1"), UInt<2>("h2")) @[pass.scala 23:46]
    node _io_except_code_T_4 = mux(_io_except_code_T_1, _io_except_code_T_3, UInt<1>("h0")) @[pass.scala 23:24]
    node _io_exp_out_T = bits(exp_temp, 4, 0) @[pass.scala 24:25]
    node _io_mout1_T = bits(io_fpin1, 9, 0) @[pass.scala 25:23]
    node _io_mout2_T = bits(io_fpin2, 9, 0) @[pass.scala 26:23]
    node _io_sign_T = bits(io_fpin1, 15, 15) @[pass.scala 27:26]
    node _io_sign_T_1 = bits(io_fpin2, 15, 15) @[pass.scala 27:41]
    node _io_sign_T_2 = eq(_io_sign_T, _io_sign_T_1) @[pass.scala 27:30]
    node _io_sign_T_3 = mux(_io_sign_T_2, UInt<1>("h1"), UInt<1>("h0")) @[pass.scala 27:17]
    io_exp_out <= _io_exp_out_T @[pass.scala 24:15]
    io_mout1 <= _io_mout1_T @[pass.scala 25:13]
    io_mout2 <= _io_mout2_T @[pass.scala 26:13]
    io_sign <= _io_sign_T_3 @[pass.scala 27:12]
    io_except_code <= _io_except_code_T_4 @[pass.scala 23:19]

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
    output io_out : UInt<11>

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
    node _out_temp_T = add(temp1, temp2) @[pass.scala 62:20]
    node _out_temp_T_1 = tail(_out_temp_T, 1) @[pass.scala 62:20]
    node temp3 = _temp3_T
    node _out_temp_T_2 = add(_out_temp_T_1, temp3) @[pass.scala 62:26]
    node _out_temp_T_3 = tail(_out_temp_T_2, 1) @[pass.scala 62:26]
    node temp4 = _temp4_T
    node _out_temp_T_4 = add(_out_temp_T_3, temp4) @[pass.scala 62:32]
    node _out_temp_T_5 = tail(_out_temp_T_4, 1) @[pass.scala 62:32]
    node out_temp = _out_temp_T_5
    io_out <= out_temp @[pass.scala 63:11]
    mem.clock <= clock
    mem.reset <= reset
    mem.io_addr <= _mem_io_addr_T @[pass.scala 60:16]

  module float_div_lut :
    input clock : Clock
    input reset : UInt<1>
    output io_dividend_float_ready : UInt<1>
    input io_dividend_float_valid : UInt<1>
    input io_dividend_float_bits : UInt<16>
    output io_divsor_float_ready : UInt<1>
    input io_divsor_float_valid : UInt<1>
    input io_divsor_float_bits : UInt<16>
    input io_exception_ready : UInt<1>
    output io_exception_valid : UInt<1>
    output io_exception_bits : UInt<2>
    input io_div_out_ready : UInt<1>
    output io_div_out_valid : UInt<1>
    output io_div_out_bits : UInt<16>

    inst separate_float of sign_exp @[pass.scala 74:30]
    inst u_fix_div of fix_div @[pass.scala 76:25]
    reg cnt : UInt<2>, clock with :
      reset => (UInt<1>("h0"), cnt) @[pass.scala 78:20]
    node _cnt_T = eq(cnt, UInt<1>("h1")) @[pass.scala 79:17]
    node _cnt_T_1 = add(cnt, UInt<1>("h1")) @[pass.scala 79:31]
    node _cnt_T_2 = tail(_cnt_T_1, 1) @[pass.scala 79:31]
    node _cnt_T_3 = mux(_cnt_T, UInt<1>("h0"), _cnt_T_2) @[pass.scala 79:13]
    node _T = eq(cnt, UInt<1>("h0")) @[pass.scala 86:13]
    node _GEN_0 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[pass.scala 86:20 81:32 87:32]
    node _GEN_1 = mux(_T, UInt<1>("h0"), UInt<1>("h0")) @[pass.scala 86:20 83:27 89:27]
    node _T_1 = bits(u_fix_div.io_out, 10, 10) @[pass.scala 101:26]
    node _T_2 = eq(_T_1, UInt<1>("h1")) @[pass.scala 101:30]
    node _temp_m_T = dshl(u_fix_div.io_out, UInt<1>("h1")) @[pass.scala 105:33]
    node _temp_exp_T = sub(separate_float.io_exp_out, UInt<1>("h1")) @[pass.scala 106:44]
    node _temp_exp_T_1 = tail(_temp_exp_T, 1) @[pass.scala 106:44]
    node _GEN_2 = mux(_T_2, u_fix_div.io_out, _temp_m_T) @[pass.scala 101:37 102:15 105:15]
    node _GEN_3 = mux(_T_2, separate_float.io_exp_out, _temp_exp_T_1) @[pass.scala 101:37 103:17 106:17]
    node _T_3 = eq(cnt, UInt<1>("h1")) @[pass.scala 108:13]
    node _GEN_4 = mux(_T_3, UInt<1>("h1"), _GEN_1) @[pass.scala 108:20 109:27]
    node _GEN_5 = mux(_T_3, UInt<1>("h0"), _GEN_0) @[pass.scala 108:20 111:32]
    node temp_exp = _GEN_3
    node _io_div_out_bits_T = cat(separate_float.io_sign, temp_exp) @[pass.scala 114:45]
    node temp_m = bits(_GEN_2, 10, 0)
    node _io_div_out_bits_T_1 = bits(temp_m, 9, 0) @[pass.scala 114:63]
    node _io_div_out_bits_T_2 = cat(_io_div_out_bits_T, _io_div_out_bits_T_1) @[pass.scala 114:55]
    io_dividend_float_ready <= _GEN_5
    io_divsor_float_ready <= _GEN_5
    io_exception_valid <= _GEN_4
    io_exception_bits <= separate_float.io_except_code @[pass.scala 95:22]
    io_div_out_valid <= _GEN_4
    io_div_out_bits <= _io_div_out_bits_T_2 @[pass.scala 114:21]
    separate_float.clock <= clock
    separate_float.reset <= reset
    separate_float.io_fpin1 <= io_dividend_float_bits @[pass.scala 93:28]
    separate_float.io_fpin2 <= io_divsor_float_bits @[pass.scala 94:28]
    u_fix_div.clock <= clock
    u_fix_div.reset <= reset
    u_fix_div.io_dividend <= separate_float.io_mout1 @[pass.scala 98:26]
    u_fix_div.io_divsor <= separate_float.io_mout2 @[pass.scala 99:26]
    cnt <= mux(reset, UInt<2>("h0"), _cnt_T_3) @[pass.scala 78:{20,20} 79:8]
