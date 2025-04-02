addi 7 
addi 2
add r2, r0 ;; r2 = 9 contador
addi 6
addi 4
add r3, r0 ;; r3 = 19 -> brzr
addi -4
add r1, r0 ;; r1 = 15
addi -6
addi -6
slr r1, r0  ;; shifter de 3 posições Endereco base de R = 120
addi -3 ;; r0 = 0  ou FAZER XOR
;; inicializar R com zeros [120 - 129]
loop_r: brzr r2, r3
        st r0, r1 ;; R[r1] = 0
        addi 1
        add r1, r0 ;; r1+1 -> anda 1 posição no R
        sub r2, r0 ;; decrementa contador
        sub r0, r0 ;; r0 = 0
    ji loop_r 

;; !!r0 e r2 iguais a 0

;; inicializar A [130 - 139] e B [140 - 149] ao mesmo tempo -> linha 20

;;Pos 255 = 1 && Pos 254 = 10
addi 1 ;; r0 = 1
add r2, r0 ;; r2 = 1
addi 14  ;; r0 = 255
st r2, r0 ;; Guardar 1 na posicao 255
xor r0, r0 ;; Zerar r0
addi 7 
addi 2 ;; r0 = 9
add r2, r0 ;; r2 = 10
xor r0, r0 ;; Zerar r0
addi 14 ;; r0 = 254
st r2, r0 ;; Guardar 10 na posição 254
xor r0, r0 ;; Zerar r0

addi 7
addi 2 ;; r0 = 9 
add r2, r0 ;; r2 = 19 

addi 7 ;; r = 16
addi 4 ;; r = 20
add r1, r0 ;; r1 = 149 -> posicao final de B
addi 7 ;; r0 = 27
addi 7 ;; r0 = 34 
addi 7 ;; r0 = 41
addi 7 ;; r0 = 48 
addi 5 ;; r0 = 52
add r3, r0 ;; r3 = 72 VALOR PARA PULAR, CALCULAR DEPOIS 
xor r0, r0 ;; Limpar r0

loop_ab:        brzr r2, r3 ;; No final do loop r1 está em 139 -> fim de A
                st r2, r1 ;; B[r1] = r2
                addi 14 ;; Acessar posicao 254 -> Guarda 10 -> r0 = 254
                ld r0, r0 ;; r0 = 10
                sub r1, r0 ;; Chegar ao vetor A

                ji loop_ab_c;
loop_ab_aux_2:  ji loop_ab

loop_ab_c:      xor r0, r0 ;; Limpar r0
                addi 15 ;; Acessar posicao 255 -> Guarda 1 -> r0 = 255
                ld r0, r0 ;; r0 = 1
                sub r2, r0 ;; r2 = r2 - 1 -> Decrementa contador -> Número par
                st r2, r1 ;; A[r1] = r2
                ;; brzr r2, r3 ;; se A chegar a 0 pula aqui r1 finaliza em 130 -> inicio de A
                ji loop_ab_c_1
loop_ab_aux_1:  ji loop_ab_aux_2

loop_ab_c_1:    xor r0, r0 ;; Limpar r0 
                addi 14 ;; Acessar posicao 254 -> Guarda 10  
                ld r0, r0 ;; r0 = 10 
                add r1, r0 ;; Retorna ao vetor B
                xor r0, r0 ;; Limpa r0

                ji loop_ab_c_2
loop_ab_aux:    ji loop_ab_aux_1;

loop_ab_c_2:    addi 15 ;; Acessar posicao 255 -> Guarda 1 -> r0 = 255
                ld r0, r0 ;; r0 = 1
                sub r1, r0 ;; Decrementa uma posicao do vetor B
                sub r2, r0 ;; Decrementa contador -> Número ímpar
                xor r0, r0 ;; Limpa r0

                ji loop_ab_aux ;; Pula para o auxiliar




;; Se atentar a otimizar guardar os valores na memória, o 10 e o 1
;; Depois: Melhorar forma que zero o vetor R

