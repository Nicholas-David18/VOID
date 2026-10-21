DEFAULT REL
DEFAULT ABS
BITS 64
section .ascii
  hello: db "Hello World!", 10
  hello_len equ $ - hello

  say_bye: db "Good-Bye",10
  bye_len equ $ - say_bye

section .text
  global _start

    _start:
      jmp print

      bye:
        mov rax, 1
        mov rdi, 1
        lea rsi, say_bye
        lea rdx, [bye_len]
        syscall
        jmp exit

      print:
        mov rax, 1
        mov rdi, 1
        lea rsi, [hello]
        lea rdx, [hello_len]
        syscall
        jmp bye

      exit:
        mov rax, 60
        xor rdi, rdi
        syscall
