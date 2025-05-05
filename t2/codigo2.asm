; -- tamanho do vetor --
addiu 10     ; r0 = 10
add r1, r0   ; r1 = 10

; -- definindo nº da instrução do jump (loop A/B) --
addiu 9      ; r0 = 19
add r2, r0   ; r2 = 19

; -- definindo nº da instrução do branch (loop A/B) --
add r0, r0   ; r0 = 19 + 19 = 38
addi 6       ; r0 = 38 + 6 = 44
add r3, r0   ; r3 = 44

; -- guardando na memória valor do jump (loop A/B) --
sub r0, r0   ; zera r0
addi 5       ; r0 = 5 
slr r0, r0   ; r0 = (5 * 2^5) = 160
st r2, r0    ; guarda 19 na posição 160

; -- guardando na memória valor do branch (loop A/B) --
inc r0       ; incrementa r0
st r3, r0    ; guarda 44 na posição 161

; -- guardando tamanho do vetor --
inc r0       ; incrementa r0
st r1, r0    ; guarda 10 na posição 162

; -- posição inicial do vetor -- 
inc r0       ; incrementa r0
sub r1, r1   ; zera r1
add r1, r0   ; r1 = 163

sub r3, r3   ; zera r3

loop_AB:    sub r0, r0  ; zera r0
            sub r2, r2  ; zera r2
            inc r2      ; incrementa r2

            st r3, r1   ; M[r1] = r3 (A)
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
            addi -1     ; r0 = 161
            ld r2, r0   ; r2 = M[r0] = 161
            brzr r3, r2 ; r3 = 0, vai p/ inst 44

            addi -1     ; r0 = 160
            ld r2, r0   ; r2 = M[r0]

            ld r3, r1   ; r3 = M[r1]
            inc r1      ; incrementa r1
            inc r3      ; incrementa r3
            inc r3      ; incrementa r3

            jr r2       ; volta p/ inst 19

sub r0, r0   ; zera r0

; -- recalcula nº da instrução do jump (loop R) --
addiu 14     ; r0 = 14
add r2, r0   ; r0 = 14 + 44 = 58
add r3, r0   ; r3 = 14
addi -2      ; r0 = 12
sub r1, r0   ; r1 = 160
st r2, r1    ; M[r1] = r2

; -- recalcula nº da instrução do branch (loop R) --
inc r1       ; incrementa r1 (161)
add r2, r3   ; r2 = 58 + 14 = 72
add r2, r0   ; r2 = 72 + 12 = 84
st r2, r1    ; M[r1] = r0

; -- recalcula tamanho do vetor (loop R) --
inc r1       ; incrementa r1 (162)
addi -2      ; r0 = 10
st r0, r1    ; M[r1] = 10 (tam vetor)

loop_R:     inc r1       ; incrementa r1
            sub r0, r0   ; zera r0
            ld r3, r1    ; r3 = M[r1]
            addi 5       ; r0 = 5
            addi 5       ; r0 = 10
            add r1, r0   ; vai para vetor B
            ld r2, r1    ; r2 = M[r1]
            add r3, r2   ; r3 = r3 + r2 (R = A + B)
            add r1, r0   ; vai para vetor R
            st r3, r1    ; M[r1] = r3
            sub r1, r0   ; volta para vetor B
            sub r1, r0   ; volta para vetor A

            addi -5      ; r0 = 5
            slr r0, r0   ; r0 = (5 * 2^5) = 160
            addi 2       ; r0 = 162
            ld r3, r0    ; r3 = M[r0]
            sub r2, r2   ; zera r2
            inc r2       ; incrementa r2
            sub r3, r2   ; decrementa r3
            st r3, r0    ; M[r0] = r3
            addi -1      ; r0 = 161
            ld r2, r0    ; r2 = M[r0]
            brzr r3, r2  ; r3 = 0, vai p/ inst 84

            addi -1      ; r0 = 160
            ld r2, r0    ; r2 = M[r0]

            jr r2        ; volta p/ inst 58

ji 0   ; finaliza programa