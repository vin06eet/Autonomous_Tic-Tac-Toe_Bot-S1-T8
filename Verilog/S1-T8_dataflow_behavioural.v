//S1-T8
//AUTONOMOUS TIC-TAC-TOE BOT
//M Vineet Nayak 231CS132
//Prahas G R 231CS142
//Nischal Basavaraju 213CS139
//S1-T8.v

//condition1 module
module condition1(a, b, c, d, e, f, o1, o2, o3);
input a, b, c, d, e, f;
    output o1, o2, o3;
    assign o1 = ~(a | b) & d & f;
    assign o2 = ~(c | d) & b & f;
    assign o3 = ~(e | f) & b & d;
endmodule

//desicion1 module
module desicion1(
    input r1, g1, r2, g2, r3, g3,
    input r4, g4, r5, g5, r6, g6,
    input r7, g7, r8, g8, r9, g9,
    output o1, o2, o3, o4, o5, o6, o7, o8, o9
);
    wire m1a, m1b, m1c, m2a, m2b, m2c;
    wire m3a, m3b, m3c, m4a, m4b, m4c;
    wire m5a, m5b, m5c, m6a, m6b, m6c;
    wire m7a, m7b, m7c, m8a, m8b, m8c;

    condition1 mod1(r1, g1, r2, g2, r3, g3, m1a, m1b, m1c);
    condition1 mod2(r4, g4, r5, g5, r6, g6, m2a, m2b, m2c);
    condition1 mod3(r7, g7, r8, g8, r9, g9, m3a, m3b, m3c);
    condition1 mod4(r1, g1, r4, g4, r7, g7, m4a, m4b, m4c);
    condition1 mod5(r2, g2, r5, g5, r8, g8, m5a, m5b, m5c);
    condition1 mod6(r3, g3, r6, g6, r9, g9, m6a, m6b, m6c);
    condition1 mod7(r1, g1, r5, g5, r9, g9, m7a, m7b, m7c);
    condition1 mod8(r3, g3, r5, g5, r7, g7, m8a, m8b, m8c);

    assign o1 = m1a | m4a | m7a;
    assign o2 = m1b | m5a;
    assign o3 = m1c | m6a | m8a;
    assign o4 = m2a | m4b;
    assign o5 = m2b | m5b | m7b | m8b;
    assign o6 = m2c | m6b;
    assign o7 = m3a | m4c | m8c;
    assign o8 = m3b | m5c;
    assign o9 = m3c | m6c | m7c;
    
endmodule

//condition2 module
module condition2(a, b, c, d, e, f, o1, o2, o3);
    input a, b, c, d, e, f;
    output o1, o2, o3;

    assign o1 = ~(a | b) & c & e;
    assign o2 = ~(c | d) & a & e;
    assign o3 = ~(e | f) & a & c;
    
endmodule

//desicion2 module
module desicion2(
    input r1, g1, r2, g2, r3, g3,
    input r4, g4, r5, g5, r6, g6,
    input r7, g7, r8, g8, r9, g9,
    output o1, o2, o3, o4, o5, o6, o7, o8, o9
);
    wire m1a, m1b, m1c, m2a, m2b, m2c;
    wire m3a, m3b, m3c, m4a, m4b, m4c;
    wire m5a, m5b, m5c, m6a, m6b, m6c;
    wire m7a, m7b, m7c, m8a, m8b, m8c;

    condition2 mod1(r1, g1, r2, g2, r3, g3, m1a, m1b, m1c);
    condition2 mod2(r4, g4, r5, g5, r6, g6, m2a, m2b, m2c);
    condition2 mod3(r7, g7, r8, g8, r9, g9, m3a, m3b, m3c);
    condition2 mod4(r1, g1, r4, g4, r7, g7, m4a, m4b, m4c);
    condition2 mod5(r2, g2, r5, g5, r8, g8, m5a, m5b, m5c);
    condition2 mod6(r3, g3, r6, g6, r9, g9, m6a, m6b, m6c);
    condition2 mod7(r1, g1, r5, g5, r9, g9, m7a, m7b, m7c);
    condition2 mod8(r3, g3, r5, g5, r7, g7, m8a, m8b, m8c);

    assign o1 = m1a | m4a | m7a;
    assign o2 = m1b | m5a;
    assign o3 = m1c | m6a | m8a;
    assign o4 = m2a | m4b;
    assign o5 = m2b | m5b | m7b | m8b;
    assign o6 = m2c | m6b;
    assign o7 = m3a | m4c | m8c;
    assign o8 = m3b | m5c;
    assign o9 = m3c | m6c | m7c;

endmodule


//priority encoder
module priority_encoder_16to4 (
    input  in15, in14, in13, in12, in11, in10,in0, in1, in2,
    input  in3, in4, in5, in6, in7, in8, in9,
    output reg [3:0] out
);

always @(*) begin
    if (in15)      out = 4'd15;
    else if (in14) out = 4'd14;
    else if (in13) out = 4'd13;
    else if (in12) out = 4'd12;
    else if (in11) out = 4'd11;
    else if (in10) out = 4'd10;
    else if (in5)  out = 4'd5;
    else if (in9)  out = 4'd9;
    else if (in1)  out = 4'd1;
    else if (in3)  out = 4'd3;
    else if (in7)  out = 4'd7;
    else if (in2)  out = 4'd2;
    else if (in8)  out = 4'd8;
    else if (in4)  out = 4'd4;
    else if (in6)  out = 4'd6;
    else if (in0)  out = 4'd0;
    else           out = 4'd15;
    
end

endmodule

//decoder
module decoder_1to16 (
    input [3:0] in,
    output reg out0, out1, out2, out3, out4, out5, out6, out7,
    output reg out8, out9, out10, out11, out12, out13, out14, out15
);

always @(*) begin
    out0 = 1'b0; out1 = 1'b0; out2 = 1'b0; out3 = 1'b0;
    out4 = 1'b0; out5 = 1'b0; out6 = 1'b0; out7 = 1'b0;
    out8 = 1'b0; out9 = 1'b0; out10 = 1'b0; out11 = 1'b0;
    out12 = 1'b0; out13 = 1'b0; out14 = 1'b0; out15 = 1'b0;
    
    case (in)
        4'd0: out0 = 1'b1;
        4'd1: out1 = 1'b1;
        4'd2: out2 = 1'b1;
        4'd3: out3 = 1'b1;
        4'd4: out4 = 1'b1;
        4'd5: out5 = 1'b1;
        4'd6: out6 = 1'b1;
        4'd7: out7 = 1'b1;
        4'd8: out8 = 1'b1;
        4'd9: out9 = 1'b1;
        4'd10: out10 = 1'b1;
        4'd11: out11 = 1'b1;
        4'd12: out12 = 1'b1;
        4'd13: out13 = 1'b1;
        4'd14: out14 = 1'b1;
        4'd15: out15 = 1'b1;
        default: begin
        end
    endcase
end

endmodule


//desicion3 module

module desicion3(
    input r1, g1, r2, g2, r3, g3,
    input r4, g4, r5, g5, r6, g6,
    input r7, g7, r8, g8, r9, g9,
    output o1, o2, o3, o4, o5, o6, o7, o8, o9
);
    wire nor1, nor2, nor3, nor4, nor5, nor6, nor7, nor8, nor9;
    wire [3:0] out;
    wire j1, j2, j3, j4, j5, j6, j7;
    reg lo = 0;

    assign nor1 = ~(r1 | g1);
    assign nor2 = ~(r2 | g2);
    assign nor3 = ~(r3 | g3);
    assign nor4 = ~(r4 | g4);
    assign nor5 = ~(r5 | g5);
    assign nor6 = ~(r6 | g6);
    assign nor7 = ~(r7 | g7);
    assign nor8 = ~(r8 | g8);
    assign nor9 = ~(r9 | g9);

    priority_encoder_16to4 prien(lo, lo, lo, lo, lo, lo, lo, nor1, nor2, nor3, nor4, nor5, nor6, nor7, nor8, nor9, out);
    decoder_1to16 cir2(out, j7, o1, o2, o3, o4, o5, o6, o7, o8, o9, j1, j2, j3, j4, j5, j6);

endmodule


//computer_input module

module computer_input(
    input r1, g1, r2, g2, r3, g3, 
    input r4, g4, r5, g5, r6, g6, 
    input r7, g7, r8, g8, r9, g9,
    output o1, o2, o3, o4, o5, o6, o7, o8, o9
);
    wire b1, b2, b3, b4, b5, b6, b7, b8, b9;
    wire p1, p2, p3, p4, p5, p6, p7, p8, p9;
    wire s1, s2, s3, s4, s5, s6, s7, s8, s9;
    reg lo = 0;

    desicion1 bw(r1, g1, r2, g2, r3, g3, r4, g4, r5, g5, r6, g6, r7, g7, g8, g8, r9, g9, b1, b2, b3, b4, b5, b6, b7, b8, b9);
    desicion2 pw(r1, g1, r2, g2, r3, g3, r4, g4, r5, g5, r6, g6, r7, g7, g8, g8, r9, g9, p1, p2, p3, p4, p5, p6, p7, p8, p9);
    desicion3 as(r1, g1, r2, g2, r3, g3, r4, g4, r5, g5, r6, g6, r7, g7, g8, g8, r9, g9, s1, s2, s3, s4, s5, s6, s7, s8, s9);
    
    assign o1 = (b1 & ~p1 & ~s1) | (b1 & ~p1 & s1) | (b1 & p1 & ~s1) | (b1 & p1 & s1);
    assign o2 = (b2 & ~p2 & ~s2) | (b2 & ~p2 & s2) | (b2 & p2 & ~s2) | (b2 & p2 & s2);
    assign o3 = (b3 & ~p3 & ~s3) | (b3 & ~p3 & s3) | (b3 & p3 & ~s3) | (b3 & p3 & s3);
    assign o4 = (b4 & ~p4 & ~s4) | (b4 & ~p4 & s4) | (b4 & p4 & ~s4) | (b4 & p4 & s4);
    assign o5 = (b5 & ~p5 & ~s5) | (b5 & ~p5 & s5) | (b5 & p5 & ~s5) | (b5 & p5 & s5);
    assign o6 = (b6 & ~p6 & ~s6) | (b6 & ~p6 & s6) | (b6 & p6 & ~s6) | (b6 & p6 & s6);
    assign o7 = (b7 & ~p7 & ~s7) | (b7 & ~p7 & s7) | (b7 & p7 & ~s7) | (b7 & p7 & s7);
    assign o8 = (b8 & ~p8 & ~s8) | (b8 & ~p8 & s8) | (b8 & p8 & ~s8) | (b8 & p8 & s8);
    assign o9 = (b9 & ~p9 & ~s9) | (b9 & ~p9 & s9) | (b9 & p9 & ~s9) | (b9 & p9 & s9);

endmodule


//mux module

module mux_2to1 (
    input wire in0,
    input wire in1,
    input wire sel,
    output wire out
);

    assign out = (in0 & ~sel) | (in1 & sel);

endmodule

//d flip-flop

module d_flip_flop (
    input wire d,
    input wire clk,
    input wire clr,
    input wire en,
    output reg q
);

    always @(posedge clk or posedge clr) begin
        if (clr) begin
            q <= 1'b0;
        end else if (en) begin
            q <= d;
        end
    end

endmodule

//input_module module

module input_module(
    input wire i1, i2, i3, i4, i5, i6, i7, i8, i9,
    input wire en, rs,
    input wire e1, e2, e3, e4, e5, e6, e7, e8, e9,
    output wire o1, o2, o3, o4, o5, o6, o7, o8, o9
);

    wire lo = 1'b0;
    wire m1, m2, m3, m4, m5, m6, m7, m8, m9;
    
    assign m1 = (en) ? i1 : lo;
    assign m2 = (en) ? i2 : lo;
    assign m3 = (en) ? i3 : lo;
    assign m4 = (en) ? i4 : lo;
    assign m5 = (en) ? i5 : lo;
    assign m6 = (en) ? i6 : lo;
    assign m7 = (en) ? i7 : lo;
    assign m8 = (en) ? i8 : lo;
    assign m9 = (en) ? i9 : lo;

    wire en1 = ~e1;
    wire en2 = ~e2;
    wire en3 = ~e3;
    wire en4 = ~e4;
    wire en5 = ~e5;
    wire en6 = ~e6;
    wire en7 = ~e7;
    wire en8 = ~e8;
    wire en9 = ~e9;

    d_flip_flop dff1(m1, m1, rs, en1, o1);
    d_flip_flop dff2(m2, m2, rs, en2, o2);
    d_flip_flop dff3(m3, m3, rs, en3, o3);
    d_flip_flop dff4(m4, m4, rs, en4, o4);
    d_flip_flop dff5(m5, m5, rs, en5, o5);
    d_flip_flop dff6(m6, m6, rs, en6, o6);
    d_flip_flop dff7(m7, m7, rs, en7, o7);
    d_flip_flop dff8(m8, m8, rs, en8, o8);
    d_flip_flop dff9(m9, m9, rs, en9, o9);

endmodule


//win_condition module

module win_condition(i1, i2, i3, i4, i5, i6, i7, i8, i9, o);
    input i1, i2, i3, i4, i5, i6, i7, i8, i9;
    output o;
    
    assign o = (i1 & i2 & i3) | 
               (i4 & i5 & i6) | 
               (i7 & i8 & i9) | 
               (i1 & i4 & i7) | 
               (i2 & i5 & i8) | 
               (i3 & i6 & i9) | 
               (i1 & i5 & i9) | 
               (i3 & i5 & i7);
endmodule


//main 

module main(
input r1, g1, r2, g2, r3, g3, r4, g4, r5, g5, r6, g6, r7, g7,r8, g8, r9, g9, bot, rs,
output wire R1, R2, R3, R4, R5, R6, R7, R8, R9,
output wire G1, G2, G3, G4, G5, G6, G7, G8, G9,
output rt, gt, rw, gw
);

	wire o1,o2,o3,o4,o5,o6,o7,o8,o9;
	computer_input compi(r1, g1, r2, g2, r3, g3, r4, g4, r5, g5, r6, g6, r7, g7,r8, g8, r9, g9, o1, o2, o3, o4, o5, o6, o7, o8, o9);

	assign G1=o1?o1:g1;
	assign G2=o2?o2:g2;
	assign G3=o3?o3:g3;
	assign G4=o4?o4:g4;
	assign G5=o5?o5:g5;
	assign G6=o6?o6:g6;
	assign G7=o7?o7:g7;
	assign G8=o8?o8:g8;
	assign G9=o9?o9:g9;

	assign R1=r1;
	assign R2=r2;
	assign R3=r3;
	assign R4=r4;
	assign R5=r5;
	assign R6=r6;
	assign R7=r7;
	assign R8=r8;
	assign R9=r9;

	win_condition win_ply(R1,R2,R3,R4,R5,R6,R7,R8,R9,rw);
	win_condition win_bot(G1,G2,G3,G4,G5,G6,G7,G8,G9,gw);

endmodule
