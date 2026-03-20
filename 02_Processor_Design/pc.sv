// VIVA Homework 2: 64-bit Program Counter
// Verified for Active-High Synchronous Reset per RV64I spec
// Author: Abhishek Rana

module pc (
    input  logic        clk,
    input  logic        reset,
    input  logic [63:0] pc_next,
    output logic [63:0] pc_current
);

    // Using always_ff for synthesizable sequential logic
    always_ff @(posedge clk) begin
        if (reset) begin
            pc_current <= 64'h0; // Reset vector 
        end else begin
            pc_current <= pc_next; // Non-blocking assignment 
        end
    end

endmodule