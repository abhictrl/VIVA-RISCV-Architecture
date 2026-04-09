// VIVA Stage 4: Byte-Addressable Data Memory (RV64I)
// Optimized for asynchronous read and synchronous write
module data_memory (
    input  logic        clk,        // System Clock
    input  logic        rst_n,      // Active-Low Synchronous Reset
    input  logic [63:0] addr,       // Memory address from ALU
    input  logic [63:0] write_data, // Data from Register File (rs2)
    input  logic        write_en,   // MemWrite signal from Control Unit
    input  logic        read_en,    // MemRead signal from Control Unit
    output logic [63:0] read_data   // Data to Register File (rd)
);

    // 1024-byte memory array (Internal Storage)
    logic [7:0] mem [0:1023];

    // Synchronous Write Logic: Updates on the rising edge of clk
    // Implements 64-bit store (sd) by writing 8 consecutive bytes
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            // Note: In hardware, initializing large arrays via loops 
            // is inefficient. For simulation, use $readmemh.
        end else if (write_en) begin
            mem[addr]   <= write_data[7:0];
            mem[addr+1] <= write_data[15:8];
            mem[addr+2] <= write_data[23:16];
            mem[addr+3] <= write_data[31:24];
            mem[addr+4] <= write_data[39:32];
            mem[addr+5] <= write_data[47:40];
            mem[addr+6] <= write_data[55:48];
            mem[addr+7] <= write_data[63:56];
        end
    end

    // Asynchronous Read Logic: Combinational output
    // Reconstructs a 64-bit word from 8 bytes (Little-Endian)
    assign read_data = read_en ? { mem[addr+7], mem[addr+6], mem[addr+5], mem[addr+4], 
                                  mem[addr+3], mem[addr+2], mem[addr+1], mem[addr] } 
                                : 64'h0;

endmodule