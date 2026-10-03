.data
value1:  .word 12
value2:  .word 30
result:  .word 0
label:   .asciiz "12 + 30 = "
newline: .asciiz "\n"

.text
.globl main
main:
    la   $t0, value1         # address of first integer
    la   $t1, value2         # address of second integer
    la   $t2, result         # address where result will be stored

    lw   $s0, 0($t0)         # load value1 into register $s0
    lw   $s1, 0($t1)         # load value2 into register $s1
    addu $s2, $s0, $s1       # add the register values
    sw   $s2, 0($t2)         # store the sum back to memory

    li   $v0, 4
    la   $a0, label
    syscall
    li   $v0, 1
    move $a0, $s2
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall
    li   $v0, 10
    syscall
