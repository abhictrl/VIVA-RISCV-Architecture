# VIVA: RISC-V Computer Architecture
This repository documents my progress in the **VIVA (Verilog, Interface, Verification, and Architecture)** course, focusing on RISC-V ISA implementation and hardware-software co-design.

## Project 1: Integer Division via Repeated Subtraction
### Objective
Implement a functional division algorithm using a restricted RISC-V instruction set: `add`, `sub`, `lw/sw` (or `ld/sd`), and `beq/blt`.

### Implementation Details
- **Algorithm:** Repeated Subtraction ($O(n)$ complexity).
- **Architecture:** Developed for **RV64I** logic.
- **Verification:** Simulated using **CPULator (RV32 SPIM)**.
- **Memory Mapping:**
  - Dividend: `0x1000`
  - Divisor: `0x1008`
  - Quotient: `0x1010`
  - Remainder: `0x1018`

### Test Cases
| Operation | Quotient (r3) | Remainder (r4) | Status |
| :--- | :--- | :--- | :--- |
| $15 \div 4$ | 3 | 3 | Verified |
| $20 \div 5$ | 4 | 0 | Verified |