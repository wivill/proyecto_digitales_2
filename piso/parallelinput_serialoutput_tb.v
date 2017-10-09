//test bench para el segmento parallelinput_serialoutput.v

module piso_tb;
reg clk, load;
reg [0:9] parallel_in;
wire [0:9] int_re;
wire serial_ou;
initial		//define clock
begin
   clk = 1'b0;
   forever
      #10 clk = ~clk;
end

initial
$monitor ("load=%b, parallel_in=%b, int_re=%b, serial_ou=%b", load, parallel_in, int_re, serial_ou);

initial 		  //apply input vectors
begin

$dumpfile("parallelinput_serialoutput_prueba.vcd");
$dumpvars;

  #0  load = 1'b0; parallel_in = 10'b0000000000;
  #5  load = 1'b1; parallel_in = 10'b0101010101;
  #10 load = 1'b0;
  #30 load = 1'b1; parallel_in = 10'b1100110011;
  #20 load = 1'b0;
  #10 load = 1'b1; parallel_in = 10'b1111111111;
  #10 load = 1'b0;
  #20 load = 1'b1; parallel_in = 10'b1111111111;
  #10 load = 1'b0;
  #30 load = 1'b1; parallel_in = 10'b1100110011;
  #20 load = 1'b0;
  #10 load = 1'b1; parallel_in = 10'b1111111111;
  #10 load = 1'b0;
  #20 load = 1'b1; parallel_in = 10'b1111111111;
  #10 load = 1'b0;
  #30 load = 1'b1; parallel_in = 10'b1100110011;
  #20 load = 1'b0;
  #10 load = 1'b1; parallel_in = 10'b1111111111;
  #10 load = 1'b0;
  #20 load = 1'b1; parallel_in = 10'b1111111111;
  #10 load = 1'b0;
  #30 $stop;
end
piso inst_piso (	 //instancia el modulo piso en 
                         //parallelinput_serialoutput.v
   .clk(clk),
   .load(load),
   .parallel_in(parallel_in),
   .int_re(int_re),
   .serial_ou(serial_ou)
   );
endmodule
