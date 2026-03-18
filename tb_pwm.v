`timescale 1ns/1ps

module tb_pwm;

reg clk;
reg [3:0] duty_cycle;

wire clk_scaled;
wire pwm_signal;

freq_scale fs(
    .clk_50M(clk),
    .clk_3125KHz(clk_scaled)
);

pwm_generator pwm(
    .clk_3125KHz(clk_scaled),
    .duty_cycle(duty_cycle),
    .pwm_signal(pwm_signal)
);

always #10 clk = ~clk;

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,clk,duty_cycle,clk_scaled,pwm_signal);

  $monitor("Time: %t | Duty: %d | PWM: %b", 
           $time, duty_cycle, pwm_signal);

  clk = 0;

  duty_cycle = 4;  #12000;
  duty_cycle = 8;  #12000;
  duty_cycle = 12; #12000;

  $finish;
end

endmodule
