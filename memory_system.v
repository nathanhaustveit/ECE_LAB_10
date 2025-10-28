`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 10:19:43 AM
// Design Name: 
// Module Name: memory_system
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


module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

wire [7:0] inp[3:0];
//Not Done
//For the next time, have one demux and use it to connect enables to the storages. 

//This demux gets the input and shares it to the storages, currently sets the storages
//that arent selected to 0 due to enable issue 
demultiplexer idk(
    .data(data),
    .sel(addr),
    .A(inp[0]),
    .B(inp[1]),
    .C(inp[2]),
    .D(inp[3])
    );
    
wire [7:0] ans[3:0];


//The different storages that are to be used. The .D on all of them have to be changed
//When the new demux is made to manage enables
byte_memory first(
    .E(store),
    .D(inp[0]),
    .memory(ans[0])
    );

byte_memory second(
    .E(store),
    .D(inp[1]),
    .memory(ans[1])
    );
    
byte_memory third(
    .E(store),
    .D(inp[2]),
    .memory(ans[2])
    );
    
 byte_memory fourth(
    .E(store),
    .D(inp[3]),
    .memory(ans[3])
    );

//Done on the mux
mux cool(
    .enable(store),
    .sel(addr),
    .A(ans[0]),
    .B(ans[1]),
    .C(ans[2]),
    .D(ans[3]),
    .Y(memory)
    );
    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

endmodule