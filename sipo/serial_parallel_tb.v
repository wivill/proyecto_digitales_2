// Test bench para el convertidor serial paralelo
//nombrado serial_parallel.v

module sipo_tb;

reg  clk, serial_in;     
wire  [9:0] parallel_out; //deberia ser un reg en el test bench; pero si se usa reg da error
wire   [9:0] tmp;           
                           
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

$dumpfile("serial_parallel_test.vcd"); //para simular en gtkwave
$dumpvars;
  
   serial_in = 0;
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
