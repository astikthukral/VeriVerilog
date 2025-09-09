`timescale 1ns/1ps

module lcd(
input clk, 
output reg[7:0] dout,
output reg rs,rw
);

reg ent=0;
integer count=0;
reg [7:0] data [11:0];
integer i=0;
parameter send_data=1;
parameter send_cmd=0;
reg state = send_cmd;
initial begin
data[0]<=8'h38;
data[1] <= 8'h01; /////CLEAR DISPLAY
data[2] <= 8'h0E;// Display On Cursor Blinking
data[3] <= 8'h06; ////increment cursor from left to right
data[4] <= 8'h80;///// force cursor from beginning of first line
 
data[5]  <= 8'h41; /////ascii value for A
data[6]  <= 8'h73;  ///s
data[7]  <= 8'h74;  ///t
data[8]  <= 8'h69; ///i
data[9]  <= 8'h6B; ///k

end

always @(posedge clk)
begin
if(count<10)
begin
count<=count+1;
end

else 
begin
count<=0;
ent=~ent;
end
end


always@(posedge ent)
case(state)
send_cmd : begin
if(i<4)
begin
rs<=1'b0;
rw<=1'b0;
dout<=data[i];
i<=i+1;
end
else 
begin
state<=send_data;
dout<=data[i];
i<=i+1;
end
end


send_data: begin
if(i<=9)
begin
rs<=1'b1;
rw<=1'b0;
dout<=data[i];
i<=i+1;
end
else
begin
state<=send_cmd;
dout<=8'h00;
rs<=1'b0;
rw<=1'b0;
end

end
endcase

endmodule