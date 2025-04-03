; -- definindo nº da instrução do branch (loop_A) --
addi 3      ; r0 = 2
slr r0, r0
addi 7
addi 7
addi 7
addi 6
add r2, r0  ; r2 = 2
sub r0, r0  ; zera r0
addi -1     ; r0 = -1 (255)
st r2, r0   ; guarda 2 na posição 255
sub r2, r2  ; zera r2

sub r0, r0  ; zero r0
addi 1      ; r0 = 1
add r2, r0  ; r2 = 1

; -- posição dos vetores -- 
sub r0, r0  ; zera r0
addi -5     ; r0 = -5
addi -5     ; r0 = -10
addi -5     ; r0 = -15
slr r0, r2  ; r0 = -30
add r1, r0  ; r1 = -30 

sub r0, r0  ; zera r0
addi 5      ; r0 = 10
addi 5
add r3, r0  ; r3 = 10 (auxiliar do r0)
sub r0, r0
add -2
st r3, r0
sub r0, r0

loop_A:         slr r0, r2   ; multiplica valor atual de r0 por 2
                st r0, r1
                addi 1       ; r0 = r0 * 2 + 1


                sub r0, r0
                addi 1
                sub r1, r0   ; avança r1
                sub r0, r0   ; r0 = 0
                addi -1
                ji meio_loop_A1

meio_loop_A4:   ji loop_A

meio_loop_A1:   ld r2, r0    ; R[r2] = M[R[r0]] -> 44
                sub r0, r0
                add r0, r3   ; r0 = r3
                addi -1      ; r0 = r0 - 1
                sub r3, r3   ; r3 = 0
                add r3, r0   ; r3 = r0
                ji meio_loop_A2

meio_loop_A3:   ji meio_loop_A4

meio_loop_A2:   brzr r0, r2
                sub r0, r0
                sub r2, r2
                addi 1
                add r2, r0
                sub r0, r0
                add r0, r3

                ji meio_loop_A3
ji end_loop_A
end_loop_A: ebreak