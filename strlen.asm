DEFAULT REL
DEFAULT ABS
BITS 64

section .bss
  block2 resb 64

section .data
  s1: db "Hello111111111wwdsaasdasdawdawdawda!", 0
  s2: db "second00!", 0

section .text
  global _start

_start:
lea rdi, [s1]
call sizeof_str

call display

call exit

sizeof_str:
xor rcx, rcx
mov rax, rdi

return_by_death:
mov bl, [rax]
cmp bl, 0
je _strlen_exit
inc rcx
inc rax
jmp return_by_death

_strlen_exit:
mov rbx, 10
mov rsi, block2
mov rax, rcx
xor r8, r8

push_digits:
xor rdx, rdx
div rbx
add dl, '0'
push rdx
inc r8
cmp rax, 0
jne push_digits
;end of loop put return in RAX
mov rsi, block2
mov rcx, r8

pop_digits:
pop rax
mov [rsi], al
inc rsi
dec r8
jnz pop_digits
ret

display:
mov rax, 1
mov rdi, 1
lea rsi, [block2]
mov rdx, rcx
syscall

exit:
; int3
mov rax, 60
syscall