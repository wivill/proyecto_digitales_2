// Código en verilog para el segmento de conversión de 
// entrada en paralelo - salida en serie del bloque de 
// transmisición de la capa física de la pcie

module piso(clk, load, parallel_in, int_re, serial_ou);

input clk, load;         //clk:reloj; load:señal de carga
input [0:9] parallel_in; //entrada en paralelo
output [0:9] int_re;    //registro interno de la entrada   
output serial_ou;        //salida en serie

reg [0:9] int_re; 
assign serial_ou = int_re[9]; //pasa el registro interno a la salida 
                               //en serie    
always @ (posedge clk) //convierte la entrada en paralelo a serie
begin
   int_re[0] <= ((load && parallel_in[0]) || (~load && 1'b0));
   int_re[1] <= ((load && parallel_in[1]) || (~load && int_re[0]));
   int_re[2] <= ((load && parallel_in[2]) || (~load && int_re[1]));
   int_re[3] <= ((load && parallel_in[3]) || (~load && int_re[2]));
   int_re[4] <= ((load && parallel_in[4]) || (~load && int_re[3]));
   int_re[5] <= ((load && parallel_in[5]) || (~load && int_re[4]));
   int_re[6] <= ((load && parallel_in[6]) || (~load && int_re[5]));
   int_re[7] <= ((load && parallel_in[7]) || (~load && int_re[6]));
   int_re[8] <= ((load && parallel_in[8]) || (~load && int_re[7]));
   int_re[9] <= ((load && parallel_in[9]) || (~load && int_re[8]));
end

endmodule

