//test bench for serial-in parallel-out shift register
module sipo_tb;

reg /*reinicio,*/ clk, serial_in;
wire [9:0] parallel_out;

initial      //reloj
begin
   clk = 1'b0;
   forever
      #10 clk = ~clk;
end

initial      //imprimi resultado
$monitor ("serial_in = %b, parallel_out = %b",
             serial_in, parallel_out);

initial     
begin

$dumpfile("serialin_parallelout_prueba.vcd"); //para simular en gtkwave
$dumpvars;

   #0/*    reinicio = 1'b0;*/  //entradas de prueba
         serial_in = 1'b0;
   #5/*    reinicio = 1'b1;*/
         serial_in = 1'b1;
  
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b0;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b0;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b0;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b1;
   #20   serial_in = 1'b0;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b0;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b0;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b0;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b1;
   #10   serial_in = 1'b1;
   #20   serial_in = 1'b0;
   #10   serial_in = 1'b1;

   #30   $stop;
end

   sipo sipo_instcd ( //instancia el modulo sipo en serialinput_paralleloutput.v
   /* .reinicio(reinicio), */
   .clk(clk),
   .serial_in(serial_in),
   .parallel_out(parallel_out)
   );

endmodule
