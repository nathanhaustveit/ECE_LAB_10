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

wire [7:0] dataBundle[3:0]; // data bundle 1
wire [3:0] selectOut;
//Not Done
//For the next time, have one demux and use it to connect enables to the storages. 

//This demux gets the dataBundleut and shares it to the storages, currently sets the storages
//that arent selected to 0 due to enable issue 
demultiplexer dataDemux(
    .data(data),
    .sel(addr),
    .A(dataBundle[0]),
    .B(dataBundle[1]),
    .C(dataBundle[2]),
    .D(dataBundle[3])
    );

    demultiplexer enabler(
    .data(store),
    .sel(addr),
    .A(selectOut[0]),
    .B(selectOut[1]),
    .C(selectOut[2]),
    .D(selectOut[3])
    );
    
wire [7:0] memoryBundle[3:0];


//The different storages that are to be used. The .D on all of them have to be changed
//When the new demux is made to manage enables
byte_memory first(
    .store(selectOut[0]),
    .data(dataBundle[0]),
    .memory(memoryBundle[0])
    );

byte_memory second(
    .store(selectOut[1]),
    .data(dataBundle[1]),
    .memory(memoryBundle[1])
    );
    
byte_memory third(
    .store(selectOut[2]),
    .data(dataBundle[2]),
    .memory(memoryBundle[2])
    );
    
 byte_memory fourth(
    .store(selectOut[3]),
    .data(dataBundle[3]),
    .memory(memoryBundle[3])
    );

//Done on the mux
mux cool(
    .enable(1),
    .Sel(addr),
    .A(memoryBundle[0]),
    .B(memoryBundle[1]),
    .C(memoryBundle[2]),
    .D(memoryBundle[3]),
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
