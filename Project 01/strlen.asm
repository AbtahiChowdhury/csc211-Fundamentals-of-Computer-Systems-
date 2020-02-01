
; nasm -f elf strlen.asm & ld -m elf_i386 strlen.o -o strlen
; Using the above command, you can assemble and link the 
; assembly code file into an executable file. nasm -f elf
; strlen.asm will assemble the file and ld -m elf_i386
; strlen.o -o strlen will link the file.
; ./strlen
; Using the above command will run the created executible
; file.


section .data
msg     db      'Hello world!', 0Ah, 00h

section .text

global _start

_start:
    push msg      		  ; push the string to the stack
	call strlen   		  ; call strlen function

	add esp, 4			  ; remove the argument from the stack

	mov edx, eax		  ; save the string length into edx
    pop eax               ; restore eax

	mov eax, 4            ; system call number for write
    mov ebx, 1            ; file handle 1 is stdout
    mov ecx, msg          ; number of bytes (1 per character)
    int 80h               ; request an interrupt on libc using INT 80h

exit:
	mov eax, 1            ; syscam call number for exit
    mov ebx, 0            ; return 0 status on exit - 'No Errors'
    int 80h               ; request an interrupt on libc using INT 80h

strlen:
    push ebp              ; save the old base pointer value
    mov  ebp, esp         ; set the new base pointer value
    sub  esp, 4

    mov eax, [ebp+8]      ; get the address of the first char
    mov [ebp-4], dword 0  ; set the length of the string to 0
    cmp byte[eax], 0Ah    ; check if the string is empty
    je  finished          ; reached end of the string

nextchar:
    inc eax               ; increment the pointer to the next char
    add [ebp-4], dword 1  ; increment the length of the string by 1
    cmp byte[eax], 0Ah    ; check if the string is done
    jne nextchar          ; if not keep looping through the string

finished:
    mov eax, [ebp-4]      ; store the length of the string to eax
    mov esp, ebp          ; reset the stack pointer
    pop ebp               ; restore the caller's base pointer
    ret                   ; return to where the function has been called


