; -- definindo nº da instrução do branch (loop vetor A e B) --
addi 4      ; r0 = 4
slr r0, r0  ; r0 = (4 * 2^4) = 64
addi -1     ; r0 = 63
add r2, r0  ; r2 = 63

; -- definindo nº da instrução do branch (loop vetor R) --
addi -8     ; r0 = 55
addi -8     ; r0 = 47
addi -6     ; r0 = 41
add r1, r0  ; r1 = 41
add r1, r2  ; r1 = 41 + 63 = 104

; -- tamanho do vetor --
sub r0, r0  ; zera r0
addi 5      ; r0 = 5
addi 5      ; r0 = 10
add r3, r0  ; r3 = 10
sub r0, r0  ; zera r0

; -- guardando na memória valor de salto (loop vetores A e B) --
addi 5      ; r0 = 5 
slr r0, r0  ; r0 = (5 * 2^5) = 160
st r2, r0   ; guarda 63 na posição 160

; -- guardando na memória valor de salto (loop R) --
addi 1      ; r0 = 161
st r1, r0   ; guarda 104 na posição 161

; -- guardando tamanho do vetor (para os loops A/B e R) --
addi 1      ; r0 = 66
st r3, r0   ; guarda 10 na posição 162
addi 1      ; r0 = 67
st r3, r0   ; guarda 10 na posição 163

; -- posição inicial do vetor -- 
sub r1, r1  ; zera r1
addi 5      ; r0 = 168
add r1, r0  ; r1 = 168

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
                addi 5      ; r0 = 10
                add r1, r0  ; avança r1 em 10 posições
                st r3, r1   ; M[r1] = r3 (B)
                ji meio_loop_AB1

meio_loop_AB6:  ji loop_AB

meio_loop_AB1:  sub r1, r0  ; retorna r1 em 10 posições
                addi -5     ; r0 = 5
                slr r0, r0  ; r0 = (5 * 2^5) = 160
                addi 2      ; r0 = 162
                ld r3, r0   ; r3 = M[r0]
                sub r3, r2  ; r3 = r3 - 1
                ji meio_loop_AB2

meio_loop_AB5:  ji meio_loop_AB6

meio_loop_AB2:  st r3, r0   ; guarda r3-- na posição 162
                addi -2     ; r0 = 160
                ld r2, r0   ; r2 = M[r0]
                brzr r3, r2 ; se r3 = 0, vai para instrução 63
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

end_loop_AB:    sub r0, r0  ; zera r0
                addi -5     ; r0 = -5
                addi -4     ; r0 = -9
                add r1, r0  ; r1 = 168

loop_soma_R:	sub r0, r0  ; zera r0
		        sub r2, r2  ; zera r2
                addi 5      ; r0 = 5
                slr r0, r0  ; r0 = (5 * 2^5) = 160
                addi 1      ; r0 = 161
                ji loop_soma_R1
                
loop_soma_R8:   ji loop_soma_R
                
loop_soma_R1:   ld r2, r0   ; r2 = M[r0]
                addi 2      ; r0 = 163
                ld r3, r0   ; r3 = M[r0] 
                brzr r3, r2 ; se r3 = 0, vai para instrução 104
                sub r2, r2  ; zera r2
                add r2, r0  ; r2 = 163
                ji loop_soma_R2
                
loop_soma_R7:   ji loop_soma_R8
                
loop_soma_R2:   sub r0, r0  ; zera r0
                addi 1      ; r0 = 1
                sub r3, r0  ; r3 = r3 - 1
                st r3, r2   ; guarda r3-- na posição 163
                ld r2, r1   ; r2 = M[r1]
                addi 4      ; r0 = 5
                ji loop_soma_R3

loop_soma_R6:   ji loop_soma_R7
            
loop_soma_R3:   addi 5      ; r0 = 10
                add r1, r0  ; r1 = 178
                ld r3, r1   ; r3 = M[r0]
                add r3, r2  ; r3 = r3 + r2 (R = A + B)
                add r1, r0  ; r1 = 188 (vetor R)
                st r3, r1   ; M[r1] = r3
                ji loop_soma_R4
                
loop_soma_R5:   ji loop_soma_R6

loop_soma_R4:   sub r1, r0  ; r1 = 178 (vetor B)
                sub r1, r0  ; r1 = 168 (vetor A)
                sub r0, r0  ; zera r0
                addi 1      ; r0 = 1
                add r1, r0  ; aumenta r1 em 1 posição
                ji loop_soma_R5
                
ji 0