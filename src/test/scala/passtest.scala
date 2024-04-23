import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class passthroughtest extends AnyFlatSpec with ChiselScalatestTester{
    behavior of "muladd"
    it should "pass though bits" in{
        test(new float_div_lut).withAnnotations(Seq(WriteVcdAnnotation)){ c=>
        c.io.dividend_float.valid.poke(true.B)
        c.io.divsor_float.valid.poke(true.B)
        c.io.dividend_float.bits.poke("b1_10000_1011101101".U)
        c.io.divsor_float.bits.poke("b1_10010_0001111110".U)
        for(i<-0 to 15){
        c.clock.step(1)
        }
        }
         println("SUCCESS!!") 
    }
}