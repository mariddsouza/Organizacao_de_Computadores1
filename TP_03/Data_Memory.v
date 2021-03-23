module Data_Memory(
	Mem_Addr, Write_Data, clk, MemWrite, MemRead, reset, Read_Data
);
	input wire [63:0] Mem_Addr, Write_Data;
	input wire clk, MemWrite, MemRead, reset;
	output reg [63:0] Read_Data;

reg [63:0] Memory [63:0];
integer i;

initial
begin
	for(i=0; i < 64; i = i + 1)
	begin
		Memory[i] <= 0;
	end	
end
always@(*) begin
  for(i=0; i < 32; i = i +1) begin
		$display ("Memory[%0d] = %0b", i, Memory[i]);
	end
		$display("\n");
end


always @ (posedge clk) begin 
    if (reset) begin
	    Memory[0] <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      Memory[1] <= 64'b0000000000000000000000000000000000000000000000000000000000000001;
      Memory[2] <= 64'b0000000000000000000000000000000000000000000000000000000000000010;
      Memory[3] <= 64'b0000000000000000000000000000000000000000000000000000000000000011;
      Memory[4] <= 64'b0000000000000000000000000000000000000000000000000000000000000100;
      Memory[5] <= 64'b0000000000000000000000000000000000000000000000000000000000000101;
      Memory[6] <= 64'b0000000000000000000000000000000000000000000000000000000000000110;
      Memory[7] <= 64'b0000000000000000000000000000000000000000000000000000000000000111;
      Memory[8] <= 64'b0000000000000000000000000000000000000000000000000000000000001000;
      Memory[9] <= 64'b0000000000000000000000000000000000000000000000000000000000001001;
      Memory[10] <= 64'b000000000000000000000000000000000000000000000000000000000001010;
      Memory[11] <= 64'b0000000000000000000000000000000000000000000000000000000000001011;
      Memory[12] <= 64'b0000000000000000000000000000000000000000000000000000000000001100;
      Memory[13] <= 64'b0000000000000000000000000000000000000000000000000000000000001101;
      Memory[14] <= 64'b0000000000000000000000000000000000000000000000000000000000001110;
      Memory[15] <= 64'b0000000000000000000000000000000000000000000000000000000000001111;
      Memory[16] <= 64'b0000000000000000000000000000000000000000000000000000000000010000;
      Memory[17] <= 64'b0000000000000000000000000000000000000000000000000000000000010001;
      Memory[18] <= 64'b0000000000000000000000000000000000000000000000000000000000010010;
      Memory[19] <= 64'b0000000000000000000000000000000000000000000000000000000000010011;
      Memory[20] <= 64'b0000000000000000000000000000000000000000000000000000000000010100;
      Memory[21] <= 64'b0000000000000000000000000000000000000000000000000000000000010101;
      Memory[22] <= 64'b0000000000000000000000000000000000000000000000000000000000010110;
      Memory[23] <= 64'b0000000000000000000000000000000000000000000000000000000000010111;
      Memory[24] <= 64'b0000000000000000000000000000000000000000000000000000000000011000;
      Memory[25] <= 64'b0000000000000000000000000000000000000000000000000000000000011001;
      Memory[26] <= 64'b0000000000000000000000000000000000000000000000000000000000011011;
      Memory[27] <= 64'b0000000000000000000000000000000000000000000000000000000000011100;
      Memory[28] <= 64'b0000000000000000000000000000000000000000000000000000000000011101;
      Memory[29] <= 64'b0000000000000000000000000000000000000000000000000000000000011110;
      Memory[30] <= 64'b0000000000000000000000000000000000000000000000000000000000011111;
      Memory[31] <= 64'b0000000000000000000000000000000000000000000000000000000000100000;
    
    end
    else begin
      if (MemWrite) begin
        Memory[Mem_Addr] <= Write_Data;
      end
      else if(MemRead) begin
        Read_Data <= Memory[Mem_Addr];
      end
    end

end

endmodule		