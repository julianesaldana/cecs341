`timescale 1ns / 1ps

module Control(
    input [5:0] Op,
    input [5:0] Func,
    output reg [3:0] ALUCntl,
    output reg RegWrite,
    output reg Regdst,
    output reg [1:0] Branch,
    output reg Memread,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg Jump
    );
    
    always@(*) begin
        // r type
        if (Op == 6'b0) begin
            RegWrite = 1'b1;                //write back to register file
            Regdst   = 1'b1;                //Inst[15:11]write back address
            Branch   = 2'b0;                //No branching performed
            Memread  = 1'b0;                //no read from memory
            MemtoReg = 1'b0;                //write back data comes from alu
            MemWrite = 1'b0;                //no write to memory
            ALUSrc   = 1'b0;                // source b comes from register file
            Jump = 1'b0; 
            case(Func)
                6'h20: ALUCntl = 4'b1010;    // add signed
                6'h21: ALUCntl = 4'b0010;    // add unsigned        
                6'h22: ALUCntl = 4'b1110;    // subtract signed      
                6'h23: ALUCntl = 4'b0110;    // subtract unsigned          
                6'h24: ALUCntl = 4'b0000;    // and            
                6'h25: ALUCntl = 4'b0001;   // or         
                6'h26: ALUCntl = 4'b0011;   // xor             
                6'h27: ALUCntl = 4'b1100;    // nor
                6'h2A: ALUCntl = 4'b1000;   // set less than		
                6'h2B: ALUCntl = 4'b1001;   // set less than unsigned
                default: ALUCntl = 4'b0000;
            endcase
        end
        //i type
        else begin
            case(Op)
                6'h08:begin             //addi              
					RegWrite = 1'b1;               
					Regdst   = 1'b0;	  // [20:16]         
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b1010;    // add signed
					Jump = 1'b0;
			    end
				6'h09: begin            //addiu
					RegWrite = 1'b1;               
					Regdst   = 1'b0;	  // [20:16] 
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b0010;    // add unsigned
					Jump = 1'b0;
				end
                6'h0C: begin            //andi
					RegWrite = 1'b1;               
					Regdst   = 1'b0;                //[20-16]
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b0000;    // and
					Jump = 1'b0;
				end
                6'h0D: begin            //ori
					RegWrite = 1'b1;               
					Regdst   = 1'b0;                //[20-16]
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b0001;   // or 
					Jump = 1'b0;
				end
			    6'h23: begin             //lw
					RegWrite = 1'b1;               
					Regdst   = 1'b0;                //[20-16]
					Branch   = 2'b0;                
					Memread  = 1'b1;                
					MemtoReg = 1'b1;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b1010;    // add signed
					Jump = 1'b0;
				end
				6'h2B: begin            //sw
					RegWrite = 1'b0;               
					Regdst   = 1'b0;
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b1;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b1010;    // add signed
					Jump = 1'b0;
				end
				6'h04: begin            //beq
					RegWrite = 1'b0;               
					Regdst   = 1'b0;
					Branch   = 2'b01;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b1;             
					ALUSrc   = 1'b0;                
					ALUCntl = 4'b1110;    // subtract signed
					Jump = 1'b0;
				end
			    6'h05: begin         //bne
					RegWrite = 1'b0;               
					Regdst   = 1'b0;
					Branch   = 2'b10;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b0;                
					ALUCntl = 4'b1110;    // subtract signed
					Jump = 1'b0;
				end
				6'h0A: begin            //slti
					RegWrite = 1'b1;               
					Regdst   = 1'b0;                //[20-16]
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b1000;   // set less than
					Jump = 1'b0;
				end
				6'h0B: begin            //sltiu
					RegWrite = 1'b1;               
					Regdst   = 1'b0;                //[20-16]
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl = 4'b1001;   // set less than unsigned
					Jump = 1'b0;
				end
				// j type
				6'h02: begin
				    RegWrite = 1'b0;               
					Regdst   = 1'b0;                //[20-16]
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b0;                
					ALUCntl = 4'b1111;   // jump unconditional, no slt unsigned
					Jump = 1'b1;
                end
				default: begin    
					RegWrite = 1'b0;               
					Regdst   = 1'b0;                //[20-16]
					Branch   = 2'b0;                
					Memread  = 1'b0;                
					MemtoReg = 1'b0;                
					MemWrite = 1'b0;             
					ALUSrc   = 1'b1;                
					ALUCntl  = 4'b1010;
					Jump = 1'b0;
				end
			endcase
		end
    end
endmodule