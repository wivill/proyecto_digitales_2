
//Otra opción de diseño para el

//Segmento de conversión de entrada en serie a salida en paralelo
//del bloque de receptor de la parte física de la PCIExpress.

module sipo(clk, serial_in, parallel_out);

input  clk, serial_in;     //clk:reloj; serial_in:entrada en serie
output [9:0] parallel_out; //salida en paralelo
reg    [9:0] tmp;          //almacena de forma temporal la entrada 
                           //para colocarla en la salida
     
always @(posedge clk)
begin
  tmp <= {tmp[8:0], serial_in};
end
   assign parallel_out = tmp;
endmodule
