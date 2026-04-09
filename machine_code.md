# RV64I Instruction Encoding Practice

## R-Type Encoding
**Instruction:** `sub x10, x11, x12` (x10 = x11 - x12)
- **Breakdown:** `funct7` (0100000) | `rs2` (01100) | `rs1` (01011) | `funct3` (000) | `rd` (01010) | `opcode` (0110011)
- **Binary:** `0100000_01100_01011_000_01010_0110011`
- **Hex:** `0x40C58533`

## I-Type Encoding
**Instruction:** `ld x5, 8(x6)`
- **Breakdown:** `imm[11:0]` (000000001000) | `rs1` (00110) | `funct3` (011) | `rd` (00101) | `opcode` (0000011)
- **Binary:** `000000001000_00110_011_00101_0000011`
- **Hex:** `0x00833283`

## S-Type Encoding
**Instruction:** `sd x7, 16(x2)`
- **Breakdown:** `imm[11:5]` (0000000) | `rs2` (00111) | `rs1` (00010) | `funct3` (011) | `imm[4:0]` (10000) | `opcode` (0100011)
- **Binary:** `0000000_00111_00010_011_10000_0100011`
- **Hex:** `0x00713823`