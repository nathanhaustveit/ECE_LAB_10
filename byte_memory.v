`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 10:19:43 AM
// Design Name: 
// Module Name: byte_memory
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

//Loops dlatch and stores 8 bits from data given
module byte_memory(
    input [7:0] data,
    input store,
    output reg [7:0] memory
);

genvar i;
generate
    for(i = 0; i < 8; i = i + 1) begin
        d_latch str(
            .E(store),
            .D(data[i]),
            .Q(memory[i])
        );
    end
endgenerate        

    // Herein, implement D-Latch style memory
    // that stores the input data into memory
    // when store is high

    // Memory should always output the value
    // stored, and it should only change
    // when store is high

endmodule
