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
![Matrix](https://latex.codecogs.com/png.latex?\begin{bmatrix}0&1&0\\1&-4&1\\0&1&0\end{bmatrix})


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

### 5. **GDS Files**
- Layout files generated during the design phase.

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
   git clone https://github.com/your-repo/laplacian-filter.git
   cd laplacian-filter
   ```
   2. **Simulate**
      - Run the Verilog testbench in your preferred simulation tool
  3. **Analyze Results**
     - Use the provided Python script (reconstruct.ipynb) to visualize the output image.
  4. **Modify**
     - Use the modular Verilog code for further enhancements or experiments.
    
