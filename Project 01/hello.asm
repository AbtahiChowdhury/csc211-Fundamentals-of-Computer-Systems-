
; nasm -f elf hello.asm & ld -m elf_i386 hello.o -o hello
; Using the above command, you can assemble and link the 
; assembly code file into an executable file. nasm -f elf
; hello.asm will assemble the file and ld -m elf_i386
; hello.o -o hello will link the file.
; ./hello
; Using the above command will run the created executible
; file.

        global      _start
        section     .text
_start: mov         eax, 4            ;system call number for write
        mov         ebx, 1            ;file handle 1 is stdout
        mov         ecx, message      ;address of string to output
        mov         edx, 35           ;number of bytes (1 per character)
        int 80h                       ;request an interrupt on libc using INT 80h
exit:   mov         eax, 1            ;syscam call number for exit
        mov         ebx, 0            ;return 0 status on exit - 'No Errors'
        int 80h                       ;request an interrupt on libc using INT 80h

        section     .data
message:db          "Abtahi Chowdhury, 23477449, MM1", 0Ah