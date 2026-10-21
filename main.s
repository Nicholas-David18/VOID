DEFAULT REL
BITS 64

section .bss
  buffer resb 4

section .data
  intro: db "i am jason", 10
  intro_len equ $ - intro

section .text
  global _start

    _start:
      mov rax, 0
      mov rdi, 0
      mov al, 4
      add al, '0'
      mov [buffer], al
      mov [buffer+1], 'A'
      mov [buffer+2], 'B'
      mov [buffer+3], 10

      mov rax, 1
      mov rdi, 1
      lea rsi, [buffer]
      mov rdx, 4
      syscall

      mov rax, 1
      mov rdi, 1
      mov rsi, intro
      mov rdx, intro_len
      syscall

      ; mov rax, 1
      ; mov rdi, 1
      ; mov ax, 'n'
      ; lea rsi, ax
      ; mov rdx, 1
      ; syscall

      mov rax, 60
      syscall
