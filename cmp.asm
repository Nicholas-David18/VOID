DEFAULT REL
DEFAULT ABS
BITS 64

section .data
  s1: db "1, 2, 3, 4, 5", 10
  s1_len equ $ - s1

section .text
  global _start

  _start:
    mov rbx, 0

    loop:
      cmp rbx, 3
      jge exit
    ;----print as many times until rbx is up to 3
    print:
      mov rax, 1
      mov rdi, 1
      lea rsi, [s1]
      mov rdx, s1_len
      syscall
      inc rbx
      jmp loop
    ;----------
    exit:
      mov rax, 60
      mov rdi, 0
      syscall