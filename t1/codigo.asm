    sub r0, r0  ; Zera R0
    sub r1, r1  ; Zera R1 
    sub r2, r2  ; Zera R2 
    sub r3, r3  ; Zera R3 
    addi 3
    slr r0, r0
    addi 2
    add r2, r0
    sub r0, r0
    addi 4
    slr r0, r0
    add r1, r0  ; posição de r1 na memória
    sub r0, r0
    addi 5
    addi 5
    add r3, r0
loop_R: sub r0, r0
    st r0, r1
    addi 1
    add r1, r0   ; avança r1
    sub r0, r0   ; r0 = 0 
    add r0, r3   ; r0 = 10
    addi -1      ; r0 = 9
    sub r3, r3   ; r3 = 0
    add r3, r0   ; r3 = 9
    brzr r0, r2
    ji loop_R
ji end_R
end_R: 
    ebreak