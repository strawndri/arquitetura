; -- definindo nº da instrução do branch (loop A) --
addi 3      ; r0 = 2
slr r0, r0  ; r0 = (3 * 2^3) = 24
addi 7      ; r0 = 31
addi 7      ; r0 = 38
addi 7      ; r0 = 45
addi 4      ; r0 = 49
add r2, r0  ; r2 = 49

; -- nº da iteração (ver se vale a pena) --
sub r0, r0  ; zera r0
addi 5      ; r0 = 10
addi 5      ; r0 = 5
add r3, r0  ; r3 = 10
sub r0, r0  ; zera r0

; -- guardando na memória valor de salto (loop A) --
addi 5      ; r0 = 4 
slr r0, r0  ; r0 = (4 * 2^4) = 64
st r2, r0   ; guarda 51 na posição 64

; -- guardando nº da iteração --
addi 3      ; r0 = 67
st r3, r0   ; guarda 10 na posição 67

; -- posição inicial do vetor -- 
addi 5      ; r0 = 72
add r1, r0  ; r1 = 72

; -- valor auxiliar (vale 1) --
sub r2, r2  ; zera r2
sub r0, r0  ; zero r0
addi 1      ; r0 = 1
add r2, r0  ; r2 = 1

sub r0, r0  ; zera r0
sub r3, r3  ; zera r3

loop_A:         st r3, r1    ; M[r1] = r0
                sub r0, r0   ; zera r0
                addi 5      ; r0 = 4
                slr r0, r0  ; r0 = (4 * 2^4) = 64
                addi 3      ; r0 = 67
                ld r3, r0   ; r3 = r0 (10)
                ji meio_loop_A1

meio_loop_A4:   ji loop_A

meio_loop_A1:   sub r3, r2  ; r3 = r3 - 1
                st r3, r0   ; guarda r0-- na posição 67
                addi -3     ; r0 = 64
                ld r2, r0   ; r2 = M[r0]
                brzr r3, r2 ; se r0 = 0, vai para instrução 51
                sub r0, r0  ; zera r0
                ji meio_loop_A2

meio_loop_A3:   ji meio_loop_A4

meio_loop_A2:   sub r2, r2  ; zero r2
                addi 1      ; r0 = 1
                add r2, r0  ; r2 = 1
                ld r3, r1   ; r3 = M[r1]
                add r1, r2  ; aumenta posição do vetor
                add r3, r0  ; r3 = r3 + 1
                add r3, r0  ; r3 = r3 + 1

                ji meio_loop_A3
ji end_loop_A
end_loop_A: ebreak