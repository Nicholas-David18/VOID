DEFAULT REL
DEFAULT ABS
BITS 64

section .bss
  char resb 1
  buffer resb 10

section .text
  global _start

_start:
  mov rsi, [buffer+9]
  mov rbx, 10

  convert_loop:
    xor rdi, rdi
    mov rax, [rbx]
    mov rcx, 10
    div rcx

    add dl, '0'
    mov [char], dl
    mov rdx, 1
    

  exit:
    mov rax, 60
    mov rdi, 0
    syscall