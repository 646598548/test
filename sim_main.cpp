#include <stdlib.h>
#include <iostream>
#include <verilated.h>   //Verilator库的头文件
#include <verilated_vcd_c.h>  //VCD波形输出头文件
#include "Valu.h"
#include "Valu___024unit.h"

#define MAX_SIM_TIME 200 //定义模拟的时钟边沿数（包括上下边沿）
vluint64_t sim_time = 0;

int main(int argc, char** argv,char**env) {
    // 实例化一个 Valu 类型的对象 dut
  Valu *dut=new Valu;
  Verilated::traceEverOn(true);
  VerilatedVcdC *m_trace = new VerilatedVcdC;  
    // 实例化一个 VerilatedVcdC 类型的对象 m_trace，用于波形跟
  dut->trace(m_trace,5);
  m_trace->open("waveform.vcd");
  int a,b,invalid;
  while (sim_time < MAX_SIM_TIME){
    dut->clk^=1;// 取反时钟信号
    if(dut->clk==0){
      a = rand() % 32;// 生成随机数 a
      b = rand() % 32;// 生成随机数 b
      dut->a_in = a;
      dut->b_in = b;
      dut->op_in = rand() % 3;
      invalid = rand() % 2;
      dut->in_valid = invalid;
    }
    dut->eval();
    if(dut->clk == 0 && invalid == 1){
            printf("sim_time = %ld,a = %d, b = %d, dut = %d dut_valid = %d\n",sim_time, a, b, dut->out,dut->out_valid);
        }
         m_trace->dump(sim_time);
        sim_time++; 
  }
 
   m_trace->close();
    delete dut;
   return 0;
  }