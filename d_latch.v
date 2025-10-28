`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 09:44:29 AM
// Design Name: 
// Module Name: DLatch
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

//Stores individual bit
module d_latch(
    input D, E,
    output reg Q,
    output NotQ
);

    always @(E,D) begin
    if(E)
        Q <= D;
        
    end
    
    assign NotQ = ~Q;
    // Will contain D-Latch behavior

endmodule