DEFAULT REL
DEFAULT ABS
BITS 64
section .data
  string1: db "HELLO, "
  string1_len equ $ - string1
  string2: db "WORLD!!",10
  string2_len equ $ - string2

section .bss
  callstack resb 1024

section .text
  global _start


    _start:
      call func_print_hello

      call exit


      
    exit:
      mov eax, 60     ;system call code for exit
      xor rdi, rdi    ; zero out rdi
      syscall         ; execute system call

      func_print_hello:
        mov rax, 1       ; use the write syscall
        mov rdi, 1      ; output to the terminal
        lea rsi, [string1]      ;start of first char address till end
        mov rdx, string1_len  ;address of string_len
        syscall      ; invoke syscall for the terminal to respond to our request
        
        call func_print_goodbye
        ret



      func_print_goodbye:
        mov rax, 1
        mov rdi, 1
        lea rsi, [string2]
        mov rdx, string2_len
        syscall
        ret
      

