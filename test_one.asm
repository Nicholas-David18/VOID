DEFAULT REL
DEFAULT ABS
BITS 64

section .data
  ghost_msg: db "What is your name: ",10
  g_len equ $ - ghost_msg

  nIS: db "You're name is: "
  nIS_len equ $ - nIS

section .bss
  buffer resb 12
  space resb 4

section .text
  global _start
    _start:

      mov rax, 1
      mov rdi, 1
      lea rsi, [ghost_msg]
      mov rdx, g_len
      syscall

      mov rax, 0
      mov rdi, 0
      lea rsi, [buffer]
      syscall

      mov rax, 1
      mov rdi, 1
      mov rsi, nIS
      mov rdx, nIS_len
      syscall

      mov rax, 1
      mov rdi, 1
      lea rsi, [buffer]
      mov rdx, 14
      syscall

      mov rax, 60
      mov rsi, 0
      syscall
