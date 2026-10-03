.data
label:   .asciiz "Sum of even integers from 1 through 100: "
newline: .asciiz "\n"

.text
.globl main
main:
    li   $t0, 2              # current even number
    li   $t1, 100            # limit
    li   $t2, 0              # sum = 0

sum_loop:
    bgt  $t0, $t1, print_sum
    addu $t2, $t2, $t0       # sum += current
    addi $t0, $t0, 2         # next even number
    j    sum_loop

print_sum:
    li   $v0, 4
    la   $a0, label
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall
    li   $v0, 10
    syscall
