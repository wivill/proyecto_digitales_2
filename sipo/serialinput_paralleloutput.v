//Segmento de conversión de entrada en serie a salida en paralelo
//del bloque de transmición de la parte física de la PCIExpress.

module sipo (/*reinicio,*/ clk, serial_in, parallel_out);

//reinicio:reinicia el segmento(limpia); clk:reloj; serial_in:entrada en serie 
input /*reinicio,*/ clk, serial_in;
output [9:0] parallel_out; //salida en paralelo

reg [9:0] parallel_out;

/*always @ (reinicio)
begin
   if (reinicio == 0)
      shift_reg <= 8'b0000_0000;
end*/

always @ (posedge clk) //conversión serie-paralelo
begin
   parallel_out [9] <= serial_in;
   parallel_out [8] <= parallel_out [9];
   parallel_out [7] <= parallel_out [8];
   parallel_out [6] <= parallel_out [7];
   parallel_out [5] <= parallel_out [6];
   parallel_out [4] <= parallel_out [5];
   parallel_out [3] <= parallel_out [4];
   parallel_out [2] <= parallel_out [3];
   parallel_out [1] <= parallel_out [2];
   parallel_out [0] <= parallel_out [1];
end
endmodule

//presenta muchas salidas indefinidas durante varios
//ciclos iniciales
