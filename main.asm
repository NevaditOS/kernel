org 0x7c00
bits 16

.halt:
    cli
    hlt
    jmp .halt

times 510-($-$$) db 0
dw 0AA55h