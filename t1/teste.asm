    sub r0, r0  ; Zera R0
    sub r1, r1  ; Zera R1 (endereço do vetor)
    sub r2, r2  ; Zera R2 (valores)
    sub r3, r3  ; Zera R3 (iterador)
    addi -1
    add r2, r0
    sub r0, r0
    addi 4
    slr r0, r0
    add r1, r0
    sub r0, r0
    addi 1
    add r3, r0
    sub r0, r0
    addi 5
    addi 5
loop_R: st r1, r0
    add r1, r3
    addi -1
    brzr r0, r2
    ji loop_R