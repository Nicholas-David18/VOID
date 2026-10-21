BITS 64
DEFAULT REL
DEFAULT ABS


; section .bss
;   align 16
;   callstack: resb 1024

section .data
  string1: db "HELLO, "
  string1_len equ $ - string1

  string2: db "WORLD!!",10
  string2_len equ $ - string2
  
  num_string: db "12345", 10
  num_string_len equ $ - num_string

section .text
  global _start

_start:
    ;----first print with arguements------
    lea rdi, [string1]
    mov rsi, string1_len
    call print_string

    lea rdi, [string2]
    mov rsi, string2_len
    call print_string

    mov rdi, num_string
    mov rsi, num_string_len
    call print_string

    

    call exit

    print_string:
        mov rax, 1
        mov rdx, rsi
        mov rsi, rdi
        mov rdi, 1
        syscall
        ret
    
    exit:
        mov rax, 60
        mov rdi, 0
        syscall
        ret
  

