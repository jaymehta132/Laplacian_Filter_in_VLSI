# Laplacian Filter for Edge Detection

This repository contains the project submission for the **EE671 VLSI Design** course by Prof. Laxmeesha Somappa. The project involves the implementation of a Laplacian filter for edge detection in hardware using Verilog.

## Team Members (Team 39)
- **Jay Mehta** (22B1281)
- **Vatsal Melwani** (22B0396)
- **Jainam Ravani** (22B1242)
- **Amol Pagare** (22B3971)

---

## Project Overview

The Laplacian filter is a high-pass filter widely used in image processing to detect edges by highlighting regions of rapid intensity change. For this project:
- A 3x3 Laplacian kernel was implemented in hardware using Verilog.
- The filter was tested on a 16x16 grayscale image.

### Laplacian Kernel
The convolution kernel used for the filter is:

| 0 | 1 | 0 |
|---|---|---|
| 1 | -4 | 1 |
| 0 | 1 | 0 |


---

## Repository Contents

### 1. **Verilog Code**
- Modular implementation of the Laplacian filter, including:
  - **PG_gen**
  - **Kogge Stone Adder**
  - **Mat_operation**
  - **Top Level Module**

### 2. **Reports**
- Detailed project report outlining:
  - Theoretical background
  - Implementation details
  - GDS layout and design details
  - Power, performance, and area analysis
  - Waveforms for pre-synthesis, post-synthesis, and post-routing

### 3. **Testbench**
- Verilog testbench to simulate the filter:
  - Reads input pixels from a text file (`image.txt`)
  - Outputs processed pixels to `output_file.txt`

### 4. **Scripts**
- Python scripts for:
  - Generating test images (`image.txt`)
  - Reconstructing output images from `output_file.txt`

---
## Repository Structure

```plaintext                
├── Verilog/                   
│   ├── laplacian.v     
│   ├── laplacian_TB.v    
├── Synthesis/                   
│   ├── Logs/
│     ├── 1-synthesis.log
│     ├── 2-sta.log
│   ├── RTL/
│     ├── laplacian.v
│     ├── waveforms.vcd
├── Physical Design/                   
│   ├── Logs/
│     ├── 12-cts.log
│     ├── 13-cts_sta.log
│     ├── 14-resizer_design.log
│     ├── 15-rsz_design_sta.log
│     ├── 16-resizer_timing.log
│     ├── 17-rsz_timing_sta.log
│     ├── 18-global.log
│     ├── 18-global_write_netlist.log
│     ├── 20-grt_sta.log
│     ├── 21-fill.log
│     ├── 22-detailed.log
│     ├── 23-wire_lengths.log
│   ├── RTL/
│     ├── laplacian.nl.v
│     ├── laplacian.pnl.v
│     ├── waveforms.vcd
├── Physical Verification/                   
│   ├── 32-drc.log     
│   ├── 36-arc.log      
├── Physical Verification/                   
│   ├── image.txt    
│   ├── output.txt    
│   ├── output_file.txt    
│   ├── reconstruct.ipynb     
├── Group_39_Report.pdf
└── README.md             
```
---

## Results

### Key Highlights
- **Clock Frequency:** 33.33 MHz
- **Area:** 35253 µm²
- **Power Consumption:** 2.64 mW

### Validation
The output image was compared against a MATLAB implementation of the Laplacian filter, ensuring correctness.

---

## Future Prospects

While this project focuses on the Laplacian filter, future extensions could involve:
- Implementing the Laplacian of Gaussian (LoG) for better edge detection in noisy images.
- Extending the design to larger image sizes using hardware optimization.

---

## Work Distribution

| Team Member      | Contribution                                                                 |
|------------------|-----------------------------------------------------------------------------|
| **Vatsal Melwani** | Verilog code for Kogge Stone Adder, 2's complement, debugging, and report sections |
| **Jay Mehta**      | Verilog code for Laplacian module, MATLAB and Python scripts, and performance analysis |
| **Jainam Ravani**  | Verilog code for PG_gen and GDS layout                                     |
| **Amol Pagare**    | Initial design, simulation testing, waveform generation, and report compilation |

---

## How to Use

1. **Clone the Repository**
   ```bash
   git clone https://github.com/jaymehta132/Laplacian_Filter_in_VLSI/laplacian-filter.git
   cd laplacian-filter
   ```
2. **Simulate**
      - Run the Verilog testbench in your preferred simulation tool
3. **Analyze Results**
     - Use the provided Python script (reconstruct.ipynb) to visualize the output image.
4. **Modify**
     - Use the modular Verilog code for further enhancements or experiments.

## Acknowledgements
We would like to thank Prof. Laxmeesha Somappa for his guidance throughout the course.
    
