import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import firrtl.annotations.MemoryLoadFileType

//make two exp part sub ,
class sign_exp extends Module {
    val io=IO(new Bundle{
        val fpin1=Input(UInt(16.W))
        val fpin2=Input(UInt(16.W))
        val exp_out=Output(UInt(5.W))
        val mout1=Output(UInt(10.W))
        val mout2=Output(UInt(10.W))
        val sign=Output(UInt(1.W))
        val except_code=Output(UInt(2.W)) //00 normal   01 shangyi 10 xiayi  11 undefined
    })
    val exp_temp=WireInit(0.U(6.W))
    val in1temp=WireInit(0.U(6.W))
    val in2temp=WireInit(0.U(6.W))
    in1temp:=io.fpin1(14,10)
    in2temp:=io.fpin2(14,10)
    exp_temp:=in1temp-in2temp+15.U
    io.except_code:=Mux(exp_temp(5)===1.U,Mux(in1temp>in2temp,1.U,2.U),0.U)
    io.exp_out:=exp_temp(4,0)
    io.mout1:=io.fpin1(9,0)
    io.mout2:=io.fpin2(9,0)
    io.sign:=Mux(io.fpin1(15)===io.fpin2(15),1.U,0.U)
}
//the lut 
class init_mem extends Module{
    val io=IO(new Bundle{
    val addr = Input(UInt(4.W))
    val dataOut = Output(Vec(4,UInt(4.W)))
    })

    val mem=SyncReadMem(16,Vec(4,UInt(4.W)))
    loadMemoryFromFile(mem,"mem.txt")
    io.dataOut:=mem(io.addr)
}
// wei shu chu fa
class fix_div extends Module{
    val io=IO(new Bundle{
        val dividend=Input(UInt(10.W))
        val divsor =Input(UInt(10.W))
        val out=Output(UInt(11.W))
    })
    val mem=Module(new init_mem)
    val dividend_temp=WireInit(0.U(11.W))
    val out_temp=WireInit(0.U(11.W))
    val mem_out=VecInit.fill(4)(0.U(4.W))
    val temp1=WireInit(0.U(11.W))
    val temp2=WireInit(0.U(11.W))
    val temp3=WireInit(0.U(11.W))
    val temp4=WireInit(0.U(11.W))
    temp1:=dividend_temp>>mem_out(0)
    temp2:=dividend_temp>>mem_out(1)
    temp3:=dividend_temp>>mem_out(2)
    temp4:=dividend_temp>>mem_out(3)
    dividend_temp:="b1".U##io.dividend
    mem.io.addr:=io.divsor(9,6)
    mem_out:=mem.io.dataOut
    out_temp:=temp1+temp2+temp3+temp4
    io.out:=out_temp
}

// main
class float_div_lut extends Module{
    val io=IO(new Bundle{
        val dividend_float=Flipped(DecoupledIO(UInt(16.W)))
        val divsor_float  =Flipped(DecoupledIO(UInt(16.W)))
        val exception     =DecoupledIO(UInt(2.W))
        val div_out       =DecoupledIO(UInt(16.W))
    })
    val separate_float=Module(new sign_exp)
    val temp_exp=WireInit(0.U(5.W))
    val u_fix_div=Module(new fix_div)
    val temp_m=WireInit(0.U(11.W))
    val cnt=RegInit(0.U(2.W))
    cnt:=Mux(cnt===1.U,0.U,cnt+1.U)
        //initilize
        io.dividend_float.ready:=false.B
        io.divsor_float.ready:=false.B
        io.exception.valid:=false.B
        io.div_out.valid:=false.B

    when(cnt===0.U){
        io.dividend_float.ready:=true.B
        io.divsor_float.ready:=true.B
        io.exception.valid:=false.B
        io.div_out.valid:=false.B
    }
   
    separate_float.io.fpin1:=io.dividend_float.bits
    separate_float.io.fpin2:=io.divsor_float.bits
    io.exception.bits:=separate_float.io.except_code
   // io.div_out(15):=separate_float.io.sign
   // temp_exp:=separate_float.io.exp_out
    u_fix_div.io.dividend:=separate_float.io.mout1
    u_fix_div.io.divsor  :=separate_float.io.mout2
   // temp_m:=u_fix_div.io.out
    when(u_fix_div.io.out(10)===1.U){
        temp_m:=u_fix_div.io.out
        temp_exp:=separate_float.io.exp_out
    }.otherwise{
        temp_m:=u_fix_div.io.out<<1.U
        temp_exp:=separate_float.io.exp_out-1.U
    }
    when(cnt===1.U){
        io.exception.valid:=true.B
        io.div_out.valid:=true.B
        io.dividend_float.ready:=false.B
        io.divsor_float.ready:=false.B
    }
     io.div_out.bits:=separate_float.io.sign##temp_exp##temp_m(9,0)
}

object mycomparer extends App {
    println(getVerilogString(new float_div_lut ))
    emitVerilog(new float_div_lut)
}
