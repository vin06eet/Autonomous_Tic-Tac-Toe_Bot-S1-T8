//S1-T8
//AUTONOMOUS TIC-TAC-TOE BOT
//M Vineet Nayak 23CS132
//Prahas G R 231CS142
//Nischal Basavaraju 231CS139
//S1-T8_tb.v


module testbench;
    reg r1, g1, r2, g2, r3, g3, r4, g4, r5, g5, r6, g6, r7, g7,r8, g8, r9, g9, bot, rs;
    wire R1, R2, R3, R4, R5, R6, R7, R8, R9;
    wire G1, G2, G3, G4, G5, G6, G7, G8, G9;
    wire rt, gt, rw, gw;

    // Instantiate the main module
    main UUT (
        r1, g1, r2, g2, r3, g3, r4, g4, r5, g5, r6, g6, r7, g7,r8,g8, r9, g9, bot, rs,R1, R2, R3, R4, R5, R6, R7, R8, R9,G1, G2, G3, G4, G5, G6, G7, G8, G9,rt, gt, rw, gw
    );

    // Initialize inputs
    initial begin
        r1=0;
        g1=1;
        r2=0;
        g2=0;
        r3=0;
        g3=0;
        r4=0;
        g4=0;
        r5=1;
        g5=0;
        r6=1;
        g6=0;
        r7=0;
        g7=0;
        r8=0;
        g8=0;
        r9=0;
        g9=0;
    end

    // Monitor the outputs
    initial begin
        $monitor(" %b%b  %b%b  %b%b\n %b%b  %b%b  %b%b\n %b%b  %b%b  %b%b\n,", 
                 R1,G1,R2,G2,R3,G3,R4,G4,R5,G5,R6,G6,R7,G7,R8,G8,R9,G9
                 );
    end
endmodule

