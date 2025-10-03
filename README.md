# Low-Power Multi-Clock Digital Communication System

## 1. Overview
This project implements a **low-power multi-clock digital communication system** with UART-based master-slave interaction.  
The system supports multiple clock domains to optimize power consumption while ensuring reliable communication.  

- **Input**: Commands received from the master through `UART_RX`.  
- **Processing**: Commands decoded and executed by the system core.  
- **Output**: Results transmitted back to the master via `UART_TX`.  

---

## 2. System Architecture
The design is partitioned into the following blocks:
- **UART RX Module**: Receives serial data from the master and performs oversampling + start/stop/parity checking.  
- **Command Decoder**: Decodes received instructions and maps them to corresponding operations.  
- **Processing Unit**: Executes arithmetic/logic/control operations based on decoded commands.  
- **Result Register**: Stores the operation result before transmission.  
- **UART TX Module**: Serializes the result and transmits it to the master.  
- **Multi-Clock Support**: Different blocks operate on separate clocks to reduce dynamic power consumption.  

---

## 3. Backend Implementation Flow
The complete ASIC backend flow was performed:

1. **RTL Design & Verification**  
   - Written in **SystemVerilog**  
   - Simulated using functional testbenches  

2. **Logic Synthesis**  
   - Tool: **Synopsys Design Compiler**  
   - Generated gate-level netlist with timing and power constraints  

3. **DFT Insertion**  
   - Tool: **Synopsys DFT Compiler**  
   - Scan chains inserted for improved testability  

4. **Formal Verification**  
   - Tool: **Synopsys Formality**  
   - Verified equivalence between RTL and gate-level netlist  

5. **Place & Route (PR)**  
   - Tool: **Synopsys IC Compiler II**  
   - Performed floorplanning, placement, clock tree synthesis, routing, and timing closure  

---

## 4. Tools Used
- **Synopsys VCS / QuestaSim** – Functional simulation  
- **Synopsys Design Compiler** – Logic synthesis  
- **Synopsys DFT Compiler** – Scan insertion  
- **Synopsys Formality** – Equivalence checking  
- **Synopsys ICC2** – Physical design (PR)  

---

## 5. Deliverables
- RTL source code (`.v` files)  
- Testbenches for verification  
- Synthesized netlist  
- Scan-inserted netlist  
- Formality verification reports  
- Place-and-route reports (timing, power, area)  
- Final GDSII layout  

---

## 6. Usage
1. Connect the master device to the UART interface.  
2. Send commands through `UART_RX`.  
3. System executes the command and generates results.  
4. Results are sent back through `UART_TX`.  

---

## 7. Future Work
- Low-power optimization with clock gating and power gating.  
- Support for additional communication protocols (e.g., SPI, I2C).  
- Extended instruction set for more complex operations.  

---
