`timescale 1ns / 1ps

module ALU(                                                                                                 
        input [31:0] a,                                                                                     
        input [31:0] b,                                                                                       
        input [3:0] ALUCntl,                                                                                 
        output reg [31:0] ALUout,                                                                           
        output reg Carryout,                                                                                
        output reg OverFlow,                                                                                
        output Zero,                                                                                        
        output reg Negative                                                                                 
        );                                                                                                  
                                                                                                            
                                                                                                            
    reg signed [31:0] as, bs;                                                                                 
    assign Zero = {ALUout==32'b0} ? 1'b1:1'b0;                                                               
                                                                                                            
    always@(*) begin                                                                                        
        as = $signed(a);                                                                                               
        bs = $signed(b);                                                                                               
        case(ALUCntl)                                                                                       
        4'b1010:begin  //add                                                                                  
                    {Carryout,ALUout} = as + bs;                                                            
                    if ((as[31] & bs[31] & ~ALUout[31]) || (~as[31] & ~bs[31] & ~ALUout[31]))               
                        OverFlow = 1'b1;                                                                      
                    else                                                                                    
                        OverFlow = 1'b0;                                                                      
               Negative = ALUout[31];                                                                         
               end                                                                                          
        4'b0010: begin //add unsigned                                                                       
                {Carryout,ALUout} = a + b;                                                                      
                OverFlow = Carryout;                                                                          
                Negative = 1'b0;                                                                              
             end                                                                                            
        4'b0000: begin //and                                                                                
                {OverFlow,Carryout,ALUout} = {2'bxx,{a&b}};                                                 
                Negative = ALUout[31];                                                                        
             end                                                                                            
        4'b0001:begin  //or                                                                                  
                {OverFlow,Carryout,ALUout} = {2'bxx,{a|b}};                                                   
                Negative = ALUout[31];                                                                        
                                                                                                            
            end                                                                                             
        4'b0011:begin  //xor                                                                                  
                 {OverFlow,Carryout,ALUout}={2'bxx,{a^b}};                                                  
                 Negative=ALUout[31];                                                                       
            end
        4'b1110:begin  //subtract                                                                             
                    {Carryout,ALUout} = as - bs;                                                            
                    if ((as[31] & ~bs[31] & ~ALUout[31]) || (~as[31] & bs[31] & ALUout[31]))               
                        OverFlow=1'b1;                                                                      
                    else                                                                                    
                        OverFlow=1'b0;                                                                      
                  Negative=ALUout[31];                                                                      
               end                                                                                                         
        4'b0110:begin  //subtract unsigned                                                                    
                {Carryout,ALUout}=a-b;                                                                      
                OverFlow=Carryout;                                                                          
                Negative=1'b0;                                                                                           
            end                                                                                             
        4'b1100:begin  //nor                                                                                  
                {OverFlow,Carryout,ALUout}={2'bxx,{a|~b}};                                                  
                Negative=ALUout[31];                                                                        
            end                                                                                             
        4'b0111:begin  //not                                                                                  
               {OverFlow,Carryout,ALUout}={2'bxx,{~a}};                                                     
               Negative=ALUout[31];                                                                         
            end
        4'b1101:begin  //shift left logical
            {OverFlow, ALUout} = {1'bx, a << 1};
            Carryout = a[31];
            Negative = ALUout[31];                                                               
        end                                                                                             
        4'b0100:begin  //set less than
                Carryout = 1'bx;
                OverFlow = 1'bx;                                                                  
                if (as < bs)
                   ALUout = 32'b1;
                else
                   ALUout = 32'b0;                                                                        
        end   
        4'b1111:begin  //set less than unsigned                                                                  
                Carryout = 1'bx;
                OverFlow = 1'bx;
                if (a < b)
                   ALUout = 32'b1;
                else
                   ALUout = 32'b0;
            end
         default: begin
            {Carryout, OverFlow, Negative} = 3'bx;
            ALUout = 32'bx;
         end                                                                                                                                                                                                                                                                                          
    endcase                                                                                                 
   end                                                                                                                                                                                                                                                                                                                          
endmodule                                                                                                   
	                                                                                                            
