# SKILL LAB PRATICAL HACKATHON

## Final Project README

> **Project Weight:** 100%  
> **Team Size:** 4/3 students  
> **Project Duration:** 16 hours  
> **Total Time Available:** 32 effort-hours per team  
> **Project Type:** Playful, interactive, technology-based experience

---

# Before you begin

## Fork and rename this repository

After forking this repository, rename it using the format:

`SKILLLAB_PROR-2026-TeamName`

### Example

`SKILLLAB_PROR-2026-AuroWizards`

Do not keep the default repository name.

---

# How to use this README

This file is your team’s **working project document**.

You must keep updating it throughout the build period.  
By the final review, this README should clearly show:

- your idea,
- your planning,
- your design decisions,
- your technical process,
- your build progress,
- your testing,
- your failures and changes,
- your final outcome.

## Rules

- Fill every section.
- Do not delete headings.
- If something does not apply, write `Not applicable` and explain why.
- Add images, screenshots, sketches, links, and videos wherever useful.
- Update task status and weekly logs regularly.
- Use this file as evidence of process, not only as a final report.

---

# 1. Team Identity

## 1.1 Studio / Group Name

`RealBetis`

## 1.2 Team Members

| Name                  | Primary Role                    | Secondary Role   | Strengths Brought to the Project |
| --------------        | ------------------------------- | --------------   | -------------------------------- |
| `Himanshu Rathod`     | `[Electronics / Documentation ]` | `Git`            | `Documentation, Git`|
| `Aadit Pradhan`       | `[Electronics / Fabrication]`   | `[Coding]`       | `Material Handling, Hardware`    |
| `Shivam Sharma`       | `[Electronics / Fabrication]`   | `[Coding]`       | `Material Handling, Hardware`    |
| `Keshavanandan Jha`   | `[Electronics / Documentation]`   | `[documentation]`| `Documentation,Diagrams`    |


## 1.3 Project Title

`"Roll pitch Estimation using Cordic Algorithm"`

<img width="1600" height="1131" alt="image" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/title.jpeg" />

## 1.4 One-Line Pitch

`Real-time roll and pitch estimation using FPGA-based CORDIC acceleration with MPU6050 sensor data acquisition.`

## 1.5 Expanded Project Idea

In 1–2 paragraphs, explain:

- what your project is,
- what kind of experience it creates,
- what technologies are involved.

**Response:**  
`This project implements roll and pitch estimation using MPU6050 sensor data. The sensor data is acquired using software developed in Vitis.
The data is processed and sent to the Spartan-7 FPGA, where a CORDIC algorithm is implemented in hardware. The FPGA computes the roll and pitch angles efficiently using fixed-point arithmetic.
The results are then displayed through a terminal interface. This setup demonstrates the use of FPGA as a hardware accelerator for computational tasks.`

---

# 2. Inspiration

## 2.1 References

List what inspired the project.

| Source Type | Title / Link                                                        | What Inspired You                                                                         |
| ----------- | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `[Video]`   | `https://youtu.be/m1e8IbDsIKw?si=r6b_8s5Hem0YE8sS` | `Detailed explanation of how CORDIC replaces expensive multiplications with simple bit-shifts and additions, which is essential for efficient FPGA-based hardware acceleration.`|
|  `Research paper`           |`https://www.google.com/search?q=https://doi.org/10.1093/comjnl/bxr012 `       | `This paper provides a breakthrough for high-precision hardware by reducing the iteration count to 2n+3 cycles for n-digit decimal operands through a "selection by rounding" technique.`                                                                                          |
|             |                                                                     |                                                                                           |

## 2.2 Original Twist

What makes your project original?

**Response:**  
`Unlike traditional implementations that compute roll and pitch using software floating-point operations, this project uses a hardware-accelerated CORDIC algorithm on FPGA. This significantly improves computational efficiency and demonstrates real-time embedded system optimization using hardware-software co-design.
Additionally, the integration of Vivado (for hardware design) and Vitis (for software control) showcases a complete FPGA-based embedded workflow.`

---

# 3. Project Intent

## 3.1 User Journey 

Describe exactly how a user will use the project.Make it a story
**Response:**  
`A user integrates the system into a small drone prototype and powers it on. As the drone initializes, the MPU6050 sensor begins capturing motion and orientation data, while the FPGA is ready to process it in real time.
Before takeoff, the user places the drone on a flat surface and checks the terminal output. The roll and pitch values are close to zero, confirming proper calibration.
As the drone lifts off, slight tilts occur due to air disturbances. Instantly, the system detects these changes, and the FPGA computes updated roll and pitch values. The user monitors these values on the terminal to understand the drone’s orientation.
During flight, when the drone tilts forward to move ahead, the pitch value increases. When it tilts sideways to change direction, the roll value changes accordingly. The real-time feedback helps the user analyze how the drone maintains balance.
If the drone becomes unstable, the user can observe rapid changes in roll and pitch, helping in debugging or improving control algorithms.
By the end of the flight, the user clearly sees how real-time orientation estimation using FPGA acceleration plays a crucial role in drone stability and navigation.`



---

# 4. Definition of Success

## 4.1 Definition of “Usable”
**Response:**  

`A usable system is one that can reliably read sensor data, process it, and display correct roll and pitch angles in real time without crashes or major delays.`

## 4.2 Minimum Usable Version

What is the smallest version of this project that still delivers the core experience?

**Response:**  
The minimum usable version includes:
- Successful reading of MPU6050 accelerometer data via I2C
- Basic roll and pitch calculation using software (C)
- Sending input values to CORDIC and receiving computed angles
- Displaying roll and pitch values in real-time

This version proves the core concept of hardware-accelerated orientation estimation.

## 4.3 Stretch Features

What features are nice to have but not essential?
- Complementary filter using gyroscope + accelerometer
- Kalman filter for improved accuracy
- Real-time graphical visualization of orientation
- AXI-Stream based high-speed data transfer
- Interrupt-based communication instead of polling
- Integration with mobile or PC dashboard

---

# 5. System Overview

## 5.1 Project Type

Check all that apply.

- [x] Electronics-based

- [ ] Mechanical

- [x] Sensor-based

- [ ] App-connected

- [ ] Motorized

- [ ] Sound-based

- [ ] Light-based

- [ ] Screen/UI-based

- [ ] Fabricated structure

- [ ] Game logic based

- [ ] Installation

- [ ] Other:

## 5.2 High-Level System Description

Explain how the system works in simple terms.

Include:

- input,
- processing,
- output,
- physical structure,
- app interaction if any.

**Response:**  
`The system takes input from the MPU6050 sensor, which provides accelerometer data (ax, ay, az).
This data is acquired using software developed in Vitis running on the host system. The software processes the raw data and converts it into fixed-point format suitable for FPGA computation.`

`The processed data is then sent to the Spartan-7 FPGA. The FPGA implements a CORDIC algorithm in hardware to compute roll and pitch angles efficiently.
The computed angles are returned to the software and displayed on a terminal. The system continuously updates the output in real time as the sensor orientation changes.`

## 5.3 Input / Output Map

| System Part        | Type     | What It Does                                  |
|-------------------|----------|-----------------------------------------------|
| MPU6050           | Input    | Provides accelerometer data                   |
| Vitis Software    | Process  | Reads and processes sensor data               |
| FPGA (CORDIC)     | Process  | Computes roll and pitch angles                |
| Terminal Output   | Output   | Displays computed values                      |

---

# 6. System Design, Sketches and Visual Planning 

## 6.1 Concept Architecture/sketch/schematic

Add an early sketch of the full idea.

**Insert image below:**  
<img width="1200" height="1000" alt="image" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/sketch2.jpeg" />


## 6.2 Labeled Build Sketch/architecture/flow diagram/algorithm

Add a sketch with labels showing:

- structure, 
- electronics placement,
- user touch points,
- moving parts,
- output elements.

**Insert image below:**  
<img width="700" height="900" alt="" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/block.jpeg" />


## 6.3 Approximate Dimensions

| Dimension        | Value   |
| ---------------- | ------- |
| Length           | `260 mm` |
| Width            | `240 mm` |
| Height           | `50 mm`  |
| Estimated weight | `6g` |

---

# 7. Electronics Planning

## 7.1 Electronics Used

| Component              | Quantity | Purpose                          |
|------------------------|----------|----------------------------------|
| Spartan-7 FPGA Board   | 1        | Hardware computation (CORDIC)     |
| MPU6050                | 1        | Motion sensor                    |
| Jumper wires           | 4     | Connections                      |
| USB Cable              | 1        | Power & programming              |

## 7.2 Wiring Plan

Describe the main electrical connections.

**Response:**  
`
The MPU6050 sensor is connected using I2C communication (SDA, SCL, VCC, GND).
Sensor data is read externally using Vitis-based software.
The processed data is sent to the Spartan-7 FPGA, where the CORDIC module computes roll and pitch values.
The output is transmitted to a terminal using UART communication.
`
## 7.3 Circuit Diagram/architecture diagram

Insert a hand-drawn or software-made circuit diagram.

**Insert image below:**  

<img width="500" height="800" alt="" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/pin.jpeg" />


## 7.4 Power Plan

| Question         | Response |
|------------------|----------|
| Power source     | USB power supply (from PC/laptop to FPGA board) |
| Voltage required | 5V input to FPGA board; onboard regulators provide 3.3V for MPU6050 and I2C logic |
| Current concerns | FPGA boards can draw significant current depending on logic usage. The MPU6050 consumes very low current (~3–4 mA), but overall system current depends on FPGA activity. Ensure stable USB power to avoid resets or data glitches |
| Safety concerns  | Ensure correct voltage levels (MPU6050 operates at 3.3V logic), avoid direct 5V connections to sensor pins, maintain proper grounding, and prevent short circuits during wiring |

---

# 8. Software Planning/

## 8.1 Software Tools

| Tool / Platform | Purpose |
|-----------------|--------|
| Vivado | Design and implement FPGA hardware (CORDIC) |
| Vitis | Sensor data acquisition and communication |
| C Programming | Data processing |
| I2C Protocol | MPU6050 communication |
| Teraterm | Display output |

## 8.2 Software Logic  

- Initialize MPU6050 sensor  
- Read accelerometer data (ax, ay, az)  
- Normalize values  
- Convert to fixed-point format  
- Send data to FPGA  
- FPGA computes roll and pitch using CORDIC  
- Receive output  
- Display results on terminal  

## 8.3 Code Flowchart

Insert a flowchart showing your code logic.

Suggested sequence:

- start,
- initialize,
- wait for input,
- read input,
- decision,
- trigger output,
- repeat or reset,
- error handling.

**Insert image below:**  
<img width="600" height="900" alt="image" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/flowc.jpeg" />





# 9. Bill of Materials

## 9.1 Full BOM

| Item                  | Quantity | In Kit? | Need to Buy? | Estimated Cost | Material / Spec         | Why This Choice? |
|-----------------------|----------|---------|--------------|----------------|-------------------------|------------------|
| Spartan-7 FPGA Board  | 1        | Yes     | No           | 0              | Xilinx Spartan-7        | Hardware computation (CORDIC) |
| MPU6050 Sensor        | 1        | Yes     | No           | 0              | 3-axis accel + gyro     | Motion sensing |
| Jumper Wires          | 4     | Yes     | No           | 0              | Male-Female wires       | Connections |
| USB Cable             | 1        | Yes     | No           | 0              | USB                     | Power & programming |
| Laptop / PC           | 1        | Yes     | No           | 0              | -                       | Runs Vivado & Vitis |

---

## 9.2 Material Justification

`The Spartan-7 FPGA was selected due to its capability to implement hardware-based algorithms efficiently. It enables parallel processing and fast computation, making it ideal for implementing the CORDIC algorithm.`

`The MPU6050 sensor was chosen because it provides reliable accelerometer data required for roll and pitch estimation, and it communicates easily via I2C.
Jumper wires and USB connections were used for simplicity and ease of prototyping.`

---

## 9.3 Items You Chose

| Item           | Why Needed            | Status     |
|----------------|----------------------|------------|
| MPU6050        | Sensor input         | Available  |
| FPGA Board     | Computation          | Available  |
| Wires          | Connections          | Available  |

## 9.4 Budget Summary

| Component              | Quantity | Approx Cost (INR) | Total Cost (INR) |
|------------------------|----------|-------------------|------------------|
| Spartan-7 FPGA Board   | 1        | 8000        | 0 (Provided by lab) |
| MPU6050 Sensor         | 1        | 150          | 0 (Provided by lab) |
| Jumper Wires           | 4      | 10              | 0 (Provided by lab) |

---

## 9.5 Budget Reflection

`The project used components available in the lab, minimizing cost. No additional purchases were required.`


# 10. Planning the Work

## 10.1 Team Working Agreement

`The team divided tasks based on individual strengths. Hardware design was handled by members experienced in FPGA and electronics, while software development and documentation were managed by others.`

`Regular discussions were held to track progress and resolve issues. Git was used for version control and documentation updates.
If a task was delayed, responsibilities were redistributed to ensure timely completion.`

---

## 10.2 Task Breakdown

| Task ID | Task                    | Owner        | Status |
|---------|-------------------------|--------------|--------|
| T1      | MPU6050 interfacing     | Shivam      | Done   |
| T2      | CORDIC implementation   | Aadit        | Done   |
| T3      | FPGA integration        | Shivam       | Done   |
| T4      | Testing & validation    | Team         | Done   |
| T4      | Documentation & git    | Himanshu      | Done   |

---

## 10.3 Responsibility Split

| Area          | Main Owner   | Support |
|--------------|-------------|---------|
| Electronics  | Aadit       | Shivam  |
| Coding       | Shivam    | Team    |
| Testing      | Team        | -       |
| Documentation| Himanshu    | Aadit    |
|Git| Himanshu    | keshav    |


# 11 hour Milestones

## 11.1 8-hour Plan(tentetively you may set)

### Bi Hour 1 — Plan and De-risk

Expected outcomes:

- [x] Idea finalized
- [x] Core interaction decided
- [x] Sketches made
- [x] BOM completed
- [x] Purchase needs identified
- [x] Key uncertainty identified
- [x] Basic feasibility tested

### Bi Hour 2 — Build Subsystems

Expected outcomes:

- [x] Electronics tests completed
- [ ] CAD / structure planning completed
- [ ] App UI started if needed
- [x] Mechanical concept tested
- [x] Main subsystems partially working

### Bi Hour 3 — Integrate

Expected outcomes:

- [x] Physical body built
- [x] Electronics integrated
- [x] Code connected to hardware
- [ ] App connected if required
- [x] First playable version exists

### Bi Hour 4 — Refine and Finish

Expected outcomes:

- [x] Technical bugs reduced
- [x] Playtesting completed
- [x] Improvements made
- [x] Documentation completed
- [x] Final build ready


## 12.2 Update Log 

| Time Slot | Planned Goal | What Actually Happened | What Changed | Next Steps |
|-----------|-------------|----------------------|-------------|-----------|
| Hour 0–2 | Finalize idea, architecture, and components | Project idea finalized, CORDIC approach selected, MPU6050 setup started | Shifted from software-only to FPGA-based approach | Complete sensor interfacing |
| Hour 2–4 | Interface MPU6050 and process data | Successfully read accelerometer data and performed normalization & fixed-point conversion | Faced minor I2C and scaling issues | Begin CORDIC implementation |
| Hour 4–6 | Implement CORDIC and integrate FPGA | CORDIC module created in Vivado and integrated with software | Precision and communication delay observed | Optimize scaling and data transfer |
| Hour 6–8 | Test, debug, and finalize system | Roll & pitch computed correctly, system working in real-time, documentation completed | Minor noise and latency remain | Future improvements (filtering, GUI) |

---

# 13. Risks and Unknowns

## 13.1 Risk Register

| Risk                     | Type      | Likelihood | Impact | Mitigation |
|--------------------------|-----------|------------|--------|-----------|
| Incorrect CORDIC scaling | Technical | Medium     | High   | Validate with software results |
| Sensor noise             | Technical | High       | Medium | Apply filtering |

---

## 13.2 Biggest Unknown Right Now

`The main uncertainty is ensuring correct fixed-point scaling and accurate interpretation of CORDIC output values and AXL4-lite IP implementation.`

---

# 14. Testing 

## 14.1 Technical Testing Plan

| What Needs Testing | How You Will Test It | Success Condition |
|-------------------|----------------------|------------------|
| MPU6050 reading   | Compare with expected orientation | Accurate readings |
| CORDIC output     | Compare with software calculation | Matching values |

---

## 14.2 Testing and Debugging Log

| Date | Problem | Solution | Result |
|------|--------|---------|--------|
| Day 1 | Incorrect angle | Fixed scaling | Working |

## 14.3 Playtesting Notes+

NA
---

# 15. Build Documentation

## 15.1 Fabrication Process

**Response:**  

The fabrication process mainly involved electronic setup, system integration, and iterative testing rather than heavy mechanical construction.

**1. Initial Setup:**  
The Spartan-7 FPGA board was powered using a USB connection and configured using Vivado. Required constraints and bitstream were generated and uploaded to the board.

**2. Sensor Integration:**  
The MPU6050 sensor was connected to the FPGA system using I2C communication lines (SDA, SCL, VCC, GND). Proper voltage levels (3.3V) were ensured to avoid damage.

**3. Wiring and Connections:**  
All connections were made using jumper wires. Care was taken to ensure stable and correct connections to avoid signal loss or noise issues.

**4. Hardware Implementation:**  
The CORDIC algorithm was designed and implemented inside the FPGA using Vivado. The hardware block was tested using simulation before deployment.

**5. Software Integration:**  
Using Vitis, software was developed to read sensor data, convert it into fixed-point format, and send it to the FPGA. UART communication was used to display results on the terminal.

**6. Testing and Debugging:**  
The system was tested step-by-step:
- Sensor data verification  
- Data transfer validation  
- CORDIC output verification  

Errors such as incorrect scaling, communication delay, and noise were identified and fixed.

**7. Final Assembly:**  
All components were arranged neatly on the workspace. Loose connections were secured, and the system was organized for stable operation and demonstration.

**8. Iterations and Improvements:**  
Multiple refinements were made during development, including:
- Adjusting fixed-point scaling  
- Improving accuracy of CORDIC output  
- Reducing noise and instability  

The final system achieved reliable real-time roll and pitch estimation.
## 16 Build Photos

Add photos throughout the project.

Suggested images:

- early sketch,
- prototype,
- electronics testing,
- mechanism test,
- app screenshot,
- final build.
<img width="800" height="1100" alt="WhatsApp Image 2026-04-24 at 9 46 02 AM (1)" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/build2.jpeg" />
<img width="800" height="1100" alt="WhatsApp Image 2026-04-24 at 9 46 02 AM (1)" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/build1.jpeg" />
<img width="800" height="1100" alt="WhatsApp Image 2026-04-24 at 9 46 02 AM (1)" src="https://github.com/Aadit2308/SKILLLAB_PROR-2026-RealBetis/blob/main/images/output.jpeg" />




# 17. Final Outcome

## 17.1 Final Description  

`The final system successfully implements real-time roll and pitch estimation using MPU6050 sensor data. The accelerometer data is processed using software and passed to the Spartan-7 FPGA.`

`The FPGA computes the angles using a hardware-based CORDIC algorithm, enabling efficient and fast trigonometric calculations. The output is displayed in real time on a terminal, reflecting the orientation of the sensor.`

`This project demonstrates the effectiveness of FPGA as a hardware accelerator for computational tasks.`

---

## 17.2 What Works Well  

- Real-time roll and pitch computation  
- Accurate CORDIC implementation  
- Efficient hardware-based processing  
- Stable communication between system and FPGA  
- AXL4-lite IP implementation
---

## 17.3 What Still Needs Improvement  

- Sensor noise reduction using advanced filtering (Kalman / complementary filter)  
- More accurate fixed-point optimization  
- Graphical visualization of output  
- Faster data transfer mechanism  

---

## 17.4 What Changed From the Original Plan  

`Initially, the project aimed to implement the CORDIC algorithm as a packaged IP core using AXI4-Lite for communication between the processor and FPGA. This approach was intended to provide a structured and efficient hardware-software interface.`

`However, due to challenges in IP packaging and AXI4-Lite integration within the given time constraints, the approach was modified. Instead, the team utilized Vitis to develop a C-based implementation for handling data communication and processing.`

`This change allowed faster integration and successful completion of the project, ensuring reliable real-time roll and pitch estimation while still demonstrating hardware acceleration using FPGA.`

---

# 18. Reflection

## 18.1 Team Reflection  

`The team worked collaboratively by dividing tasks based on individual strengths. Regular discussions helped in resolving technical issues quickly.
Time management was effective, and documentation was maintained continuously throughout the project.`

---

## 18.2 Technical Reflection  

We gained hands-on experience in:

- FPGA design using Vivado  
- Sensor interfacing using I2C  
- Fixed-point arithmetic  
- Hardware implementation of algorithms (CORDIC)  
- Debugging hardware-software interaction  

This project improved our understanding of real-time embedded systems.

---

## 18.3 Design Reflection  

We learned that:

- Hardware acceleration significantly improves performance  
- Proper system design is essential for accuracy  
- Debugging requires step-by-step validation  
- Iterative improvements are necessary for stability  

---

## 18.4 If You Had One More Hour  

If given more time, we would:

- Implement a complementary or Kalman filter for improved accuracy  
- Add graphical visualization (GUI) for better understanding  
- Optimize FPGA design for faster computation  
- Improve overall system robustness
- AXL wrapped IP for Cordic

---

# 19. Final Submission Checklist

Before submission, confirm that:

- [x] Team details are complete
- [x] Project description is complete
- [x] Inspiration sources are included
- [x] Sketches are added
- [x] BOM is complete
- [x] Purchase list is complete
- [x] Budget summary is complete
- [x] Mechanical planning is documented if applicable
- [ ] App planning is documented if applicable
- [x] Code flowchart is added
- [x] Task breakdown is complete
- [x] Weekly logs are updated
- [x] Risk register is complete
- [x] Testing log is updated
- [x] Playtesting notes are included
- [x] Build photos are included
- [x] Final reflection is written

---

---


