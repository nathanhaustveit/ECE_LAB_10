`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 09:36:39 AM
// Design Name: 
// Module Name: mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Outputs the selected ouput from the different storages
module mux(
    input [1:0] Sel,
    input [7:0] A, B, C, D, 
    input enable,
    output [7:0] Y
);


    
    assign Y = enable ? ((Sel == 'b00 ? A :
                Sel == 'b01 ? B :
                Sel == 'b10 ? C : 
                Sel == 'b11 ? D : 0)) : 0;

   
     
    
endmodule
