; -- definindo nº da instrução do branch (loop A) --
addi 3      ; r0 = 2
slr r0, r0  ; r0 = (3 * 2^3) = 24
addi 7      ; r0 = 31
addi 7      ; r0 = 38
addi 7      ; r0 = 45
addi 7      ; r0 = 52
addi 6      ; r0 = 59
add r2, r0  ; r2 = 59

; -- nº da iteração (ver se vale a pena) --
sub r0, r0  ; zera r0
addi 5      ; r0 = 10
addi 5      ; r0 = 5
add r3, r0  ; r3 = 10
sub r0, r0  ; zera r0

; -- guardando na memória valor de salto (loop AB) --
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

sub r3, r3  ; zera r3

loop_AB:        st r3, r1   ; M[r1] = r3 (A)
                add r3, r0  ; r3 = r3 + 1
                sub r0, r0  ; zera r0
                addi 5      ; r0 = 5
                addi 5      ; r0 = 5
                add r1, r0
                st r3, r1   ; M[r1] = r3 (B)
                ji meio_loop_AB1

meio_loop_AB6:  ji loop_AB

meio_loop_AB1:  sub r1, r0
                addi -5
                slr r0, r0  ; r0 = (4 * 2^4) = 64
                addi 3      ; r0 = 67
                ld r3, r0   ; r3 = r0 (10)
                sub r3, r2  ; r3 = r3 - 1
                ji meio_loop_AB2

meio_loop_AB5:  ji meio_loop_AB6

meio_loop_AB2:  st r3, r0   ; guarda r0-- na posição 67
                addi -3     ; r0 = 64
                ld r2, r0   ; r2 = M[r0]
                brzr r3, r2 ; se r0 = 0, vai para instrução 51
                sub r0, r0  ; zera r0
                sub r2, r2  ; zero r2
                
                ji meio_loop_AB3

meio_loop_AB4:  ji meio_loop_AB5

meio_loop_AB3:  addi 1      ; r0 = 1
                add r2, r0  ; r2 = 1
                ld r3, r1   ; r3 = M[r1]
                add r1, r2  ; aumenta posição do vetor r1
                add r3, r0  ; r3 = r3 + 1
                add r3, r0  ; r3 = r3 + 1
                ji meio_loop_AB4

ji end_loop_AB
end_loop_AB: 
    ebreak