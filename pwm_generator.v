module freq_scale(
    input clk_50M,
    output reg clk_3125KHz = 0
);

reg [2:0] counter = 0;

always @(posedge clk_50M)
begin
    if(counter == 7)
    begin
        counter <= 0;
        clk_3125KHz <= ~clk_3125KHz;
    end
    else
        counter <= counter + 1;
end

endmodule


module pwm_generator(
    input clk_3125KHz,
    input [3:0] duty_cycle,
    output reg pwm_signal = 0
);

reg [3:0] pwm_counter = 0;

always @(posedge clk_3125KHz)
begin
    pwm_counter <= pwm_counter + 1;

    if(pwm_counter < duty_cycle)
        pwm_signal <= 1;
    else
        pwm_signal <= 0;
end

endmodule
