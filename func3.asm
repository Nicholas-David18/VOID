DEFAULT REL
DEFAULT ABS
BITS 64

section .data
  name: db "Jason",10
  name_len equ $ - name

  bye: db "Good bye"
  bye_len equ $ - bye

section .bss
  buffer resb 10

section .text
  global _start

    _start:
      ; lea rdi, [name]
      ; mov rsi, name_len
      ; call print_string
      call print_buff
      
      call exit


      exit:
        mov rax, 60
        mov rdi, 0
        syscall
        ret
      
      print_buff:
        lea rdi, [buffer]
        mov rsi, 14
        call input

        mov rax, 1
        mov rdx, rsi
        lea rsi, [rdi]
        mov rdi, 1
        syscall
        ret

      goodbye:
        mov rax, 1
        mov rdx, rsi
        lea rsi, [rdi]
        mov rdi, 1
        syscall
        ret
      
      print_string:
        mov rax, 1
        mov rdx, rsi
        lea rsi, [rdi]
        mov rdi, 1
        syscall
        ;------bye-----
        lea rdi, [bye]
        mov rsi, bye_len
        call goodbye
        ret
      
      input:
        mov rax, 0
        mov rdx, rsi
        lea rsi, [rdi]
        mov rdi, 0
        syscall
        ret


      
