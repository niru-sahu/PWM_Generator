# PWM Generator using Verilog

## 📌 Description
This project implements a PWM (Pulse Width Modulation) generator using Verilog HDL.

## ⚙️ Features
- Frequency scaling from 50MHz to 3.125MHz
- Adjustable duty cycle (4-bit input)
- Testbench with waveform output

## 🧠 Modules
1. `freq_scale` – Divides clock frequency
2. `pwm_generator` – Generates PWM signal
3. `tb_pwm` – Testbench

## 📊 Duty Cycle Examples
- 25% → 4
- 50% → 8
- 75% → 12

## ▶️ Simulation
Use tools like:
- Icarus Verilog
- ModelSim

Run:
```bash
iverilog -o pwm tb_pwm.v pwm_generator.v
vvp pwm
gtkwave dump.vcd# PWM_Generator
PWM Generator using Verilog with frequency scaling and testbench
