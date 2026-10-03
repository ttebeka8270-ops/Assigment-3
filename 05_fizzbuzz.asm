.data
fizz:    .asciiz "Fizz\n"
buzz:    .asciiz "Buzz\n"
fizzbuzz:.asciiz "FizzBuzz\n"
newline: .asciiz "\n"

.text
.globl main
main:
    li   $t0, 1              # number = 1
    li   $t1, 100            # limit = 100

loop:
    bgt  $t0, $t1, done

    li   $t2, 15
    div  $t0, $t2
    mfhi $t3                 # remainder after division by 15
    beq  $t3, $zero, print_fizzbuzz

    li   $t2, 3
    div  $t0, $t2
    mfhi $t3
    beq  $t3, $zero, print_fizz

    li   $t2, 5
    div  $t0, $t2
    mfhi $t3
    beq  $t3, $zero, print_buzz

    li   $v0, 1              # print ordinary number
    move $a0, $t0
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall
    j    next

print_fizzbuzz:
    li   $v0, 4
    la   $a0, fizzbuzz
    syscall
    j    next

print_fizz:
    li   $v0, 4
    la   $a0, fizz
    syscall
    j    next

print_buzz:
    li   $v0, 4
    la   $a0, buzz
    syscall

next:
    addi $t0, $t0, 1
    j    loop

done:
    li   $v0, 10
    syscall
