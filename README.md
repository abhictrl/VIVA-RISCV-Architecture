# VIVA: RISC-V Computer Architecture

This repository documents my progress in the **VIVA (Verilog, Interface, Verification, and Architecture)** course, focusing on RISC-V ISA implementation and hardware-software co-design.

---

## Stage 3: Instruction Decoding & Encoding

### Objective
Mastered the manual translation of **RV64I assembly** into binary and hexadecimal machine code. This forms the logic foundation for the upcoming Control Unit and Immediate Generation hardware modules.

### Key Concepts
* **Field Mapping:** Aligning `opcode`, `rd`, `rs1`, `rs2`, `funct3`, and `funct7` for R, I, and S formats.
* **S-Format Splitting:** Correctly partitioning immediate values (`imm[11:5]` and `imm[4:0]`) to ensure source register fields (`rs1`, `rs2`) remain in fixed positions for simplified hardware decoding.

---

## Stage 2: Instruction Fetch - 64-bit Program Counter (PC)

### Objective
Implemented the foundational **"Fetch"** stage of the processor by designing a 64-bit Program Counter (PC) and integrating it into a structural top-level design.

### Hardware Specifications
* **Architecture:** 64-bit (RV64I) datapath.
* **Reset Logic:** Active-High Synchronous Reset to vector `0x0`.
* **Logic Type:** Sequential logic using `always_ff` with non-blocking assignments (`<=`).
* **Next-PC Logic:** Incremental fetch logic implemented as $$pc\_next = pc\_current + 4$$

### File Structure
* `pc.sv`: The sequential Program Counter module.
* `processor.sv`: The top-level structural module instantiating the PC and increment logic.

---

## Stage 1: Algorithmic Logic - Integer Division

### Objective
Verified functional logic requirements by implementing a division algorithm using a restricted RISC-V instruction set: `add`, `sub`, `ld`, `sd`, and `beq`.

### Implementation Details
* **Algorithm:** Repeated Subtraction ($O(n)$ complexity).
* **Architecture:** Developed for RV64I logic.
* **Verification:** Functional verification performed via CPULator (RV32 SPIM).
* **Memory Mapping:**
    * **Dividend:** `0x1000` | **Divisor:** `0x1008`
    * **Quotient:** `0x1010` | **Remainder:** `0x1018`

### Test Cases

| Operation | Quotient (r3) | Remainder (r4) | Status |
| :--- | :--- | :--- | :--- |
| 15 / 4 | 3 | 3 | Verified |
| 20 / 5 | 4 | 0 | Verified |