.data
newline: .asciiz "\n"

.text
.globl main
main:
    li   $t0, 1              # counter = 1
    li   $t1, 100            # limit = 100

print_loop:
    bgt  $t0, $t1, done      # branch when counter > 100
    li   $v0, 1              # print integer
    move $a0, $t0
    syscall
    li   $v0, 4              # print newline
    la   $a0, newline
    syscall
    addi $t0, $t0, 1         # counter++
    j    print_loop

done:
    li   $v0, 10
    syscall
