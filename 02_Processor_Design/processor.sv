// VIVA Homework 2: Processor Top-Level
// Instantiates PC and implements PC+4 increment logic 
// Author: Abhishek Rana

module processor (
    input  logic        clk,
    input  logic        reset,
    output logic [63:0] pc_out // Added for visibility/verification
);

    logic [63:0] pc_next;
    logic [63:0] pc_current;

    // Connect internal signal to output port
    assign pc_out = pc_current;

    // Instance of PC module 
    pc pc_inst (
        .clk        (clk),
        .reset      (reset),
        .pc_next    (pc_next),
        .pc_current (pc_current)
    );

    // Simple Next-PC Logic 
    // Increments by 4 to point to the next instruction in memory
    assign pc_next = pc_current + 64'd4;

endmodule