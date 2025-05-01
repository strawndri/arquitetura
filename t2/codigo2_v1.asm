; -- tamanho do vetor --
addiu 10      ; r0 = 10
add r1, r0    ; r1 = 10

; -- definindo nº da instrução do jump (loop vetor A e B) --
addiu 11      ; r0 = 21
add r2, r0    ; r2 = 21

; -- definindo nº da instrução do branch (loop vetor A e B) --
add r0, r0  ; r0 = 21 + 21 = 42
addi 2      ; r0 = 42 + 2 = 44
add r3, r0  ; r3 = 44

; -- guardando na memória valor de salto branch (loop vetores A e B) --
addi -5     ; r0 = 5 
slr r0, r0  ; r0 = (5 * 2^5) = 160
st r2, r0   ; guarda 22 na posição 160

; -- guardando na memória valor de salto jump (loop vetores A e B) --
inc r0      ; incrementa r0
st r3, r0   ; guarda 44 na posição 161

; -- guardando tamanho do vetor (para os loops A/B e R) --
inc r0      ; incrementa r0
st r1, r0   ; guarda 10 na posição 161

; -- posição inicial do vetor -- 
addi 7      ; r0 = 168
add r1, r0  ; r1 = 168
sub r0, r0  ; zera r0

; -- valor auxiliar (vale 1) --
sub r2, r2  ; zera r2
inc r2      ; r2 = r2 + 1 = 1

sub r3, r3  ; zera r3

loop_AB:    st r3, r1   ; M[r1] = r3 (A)
            inc r3      ; r3 = r3 + 1
            addiu 10    ; r0 = 10
            add r1, r0  ; avança r1 em 10 posições
            st r3, r1   ; M[r1] = r3 (B)

            sub r1, r0  ; retorna r1 em 10 posições
            addi -5     ; r0 = 5
            slr r0, r0  ; r0 = (5 * 2^5) = 160
            addi 2      ; r0 = 162
            ld r3, r0   ; r3 = M[r0]
            sub r3, r2  ; r3 = r3 - 1

            st r3, r0   ; guarda r3-- na posição 162
            addi -2     ; r0 = 160
            ld r2, r0   ; r2 = M[r0] = 160
            brzr r3, r2 ; se r3 = 0, vai para instrução 63

            sub r0, r0  ; zera r0
            sub r2, r2  ; zero r2

            inc r2      ; incrementa r2 (161)
            ld r3, r1   ; r3 = M[r1]
            inc r1      ; incrementa r1
            inc r3      ; incrementa r3
            inc r3      ; incrementa r3

            jr r2       ; volta para loop_AB

fim_loop_AB: ebreak;