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
$ \begin{bmatrix} 0 & 1 & 0 \\ 1 & -4  & 1 \\ 0 & 1 & 0 \end{bmatrix} $
