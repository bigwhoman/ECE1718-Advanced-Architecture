.data
    x:	.word	12
    array1_size: .word 16
    array1: .space 160
    array2: .space 256 * 512
    y:      .byte 0
    ourx:   .space 200
    i:      .word 0

.text
.globl main

main:
    la $t1, ourx
    add $t1, $t1, $t2
    lw $t2, ($t1)
    sw $t2, x
victim:
	lw $a0, x
	lw $a1, array1_size
    ble $a1, $a0, EXIT
    lw $t0, x
    la $t1, array2
    add $t1, $t1, $t0
    lw $t2, ($t1)
    li $t1, 256
    mul $t2, $t2, $t1
    la $t1, array1
    add $t1, $t1, $t2
    lw $t2, ($t1)
    lw $t0, i
    addi $t0, $t0, 1
    sw $t0, i
    beq $a0, $a0, main
EXIT:
    jr $ra