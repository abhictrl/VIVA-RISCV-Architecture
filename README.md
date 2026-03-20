# VIVA: RISC-V Computer Architecture
This repository documents my progress in the **VIVA (Verilog, Interface, Verification, and Architecture)** course, focusing on RISC-V ISA implementation and hardware-software co-design.

---

## Stage 2: Instruction Fetch - 64-bit Program Counter (PC)
### Objective
Implemented the foundational "Fetch" stage of the processor by designing a 64-bit Program Counter (PC) and integrating it into a structural top-level design.

### Hardware Specifications
- **Architecture:** 64-bit (RV64I) datapath.
- **Reset Logic:** Active-High Synchronous Reset to vector `0x0`.
- **Logic Type:** Sequential logic using `always_ff` with non-blocking assignments (`<=`).
- **Next-PC Logic:** Incremental fetch logic implemented as `pc_next = pc_current + 4`.

### File Structure
- `pc.sv`: The sequential Program Counter module.
- `processor.sv`: The top-level structural module instantiating the PC and increment logic.

---

## Stage 1: Algorithmic Logic - Integer Division
### Objective
Verified functional logic requirements by implementing a division algorithm using a restricted RISC-V instruction set: `add`, `sub`, `lw/sw` (or `ld/sd`), and `beq/blt`.

### Implementation Details
- **Algorithm:** Repeated Subtraction ($O(n)$ complexity).
- **Architecture:** Developed for **RV64I** logic.
- **Verification:** Functional verification performed via **CPULator (RV32 SPIM)**.
- **Memory Mapping:**
  - Dividend: `0x1000` | Divisor: `0x1004`
  - Quotient: `0x1010` | Remainder: `0x1018`

### Test Cases
| Operation | Quotient (r3) | Remainder (r4) | Status |
| :--- | :--- | :--- | :--- |
| 15 / 4 | 3 | 3 | Verified |
| 20 / 5 | 4 | 0 | Verified |