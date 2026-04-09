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


## Capstone: Division Algorithm Program
**Algorithm:** Repeated Subtraction ($O(n)$)
**Memory Map Context:** `x13` is pre-loaded with the base data memory address `0x1000`.

| PC Offset | Assembly | Format | Binary Breakdown | Hexadecimal |
| :--- | :--- | :--- | :--- | :--- |
| `0x00` | `ld x10, 0(x13)` | **I-Type** | `000000000000_01101_011_01010_0000011` | `0x0006B503` |
| `0x04` | `ld x11, 8(x13)` | **I-Type** | `000000001000_01101_011_01011_0000011` | `0x0086B583` |
| `0x08` | `add x12, x0, x0` | **R-Type** | `0000000_00000_00000_000_01100_0110011` | `0x00000633` |
| **Loop:** | | | | |
| `0x0C` | `blt x10, x11, end` | **B-Type** | `0000000_01011_01010_100_10000_1100011` | `0x00B54863` |
| `0x10` | `sub x10, x10, x11` | **R-Type** | `0100000_01011_01010_000_01010_0110011` | `0x40B50533` |
| `0x14` | `addi x12, x12, 1` | **I-Type** | `000000000001_01100_000_01100_0010011` | `0x00160613` |
| `0x18` | `beq x0, x0, loop` | **B-Type** | `1111111_00000_00000_000_10101_1100011` | `0xFE000A63` |
| **End:** | | | | |
| `0x1C` | `sd x12, 16(x13)` | **S-Type** | `0000000_01100_01101_011_10000_0100011` | `0x00C6B823` |
| `0x20` | `sd x10, 24(x13)` | **S-Type** | `0000000_01010_01101_011_11000_0100011` | `0x00A6BC23` |