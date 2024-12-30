INCLUDE Irvine32.inc

.data
; Declare message for procedure completion
msg db "Assembly procedure completed successfully.", 0

; Parameters (placeholders, values set by the C function call)
arr DWORD 0        ; Address of the array
size DWORD 0       ; Size of the array
result DWORD 0     ; Address to store the result

.code
asmfunc PROC
    ; Prologue
    push ebp
    mov ebp, esp

    ; Load parameters from the stack into local variables
    mov esi, [ebp+8]     ; Load the address of the array into ESI
    mov ecx, [ebp+12]    ; Load the size of the array into ECX
    mov edi, [ebp+16]    ; Load the address of the result into EDI
    xor eax, eax         ; Clear EAX (sum accumulator)

sum_loop:
    cmp ecx, 0           ; Check if size is zero
    je end_loop          ; If size == 0, exit loop

    mov ebx, [esi]       ; Load the current element
    test ebx, 1          ; Test if the number is odd
    jz skip_odd          ; Skip addition if even

    add eax, ebx         ; Add the odd number to EAX

skip_odd:
    add esi, 4           ; Move to the next array element (4 bytes per int)
    dec ecx              ; Decrement the counter
    jmp sum_loop         ; Repeat the loop

end_loop:
    mov [edi], eax       ; Store the sum in the result variable

    ; Print completion message
    mov edx, OFFSET msg
    call WriteString
    call Crlf

    ; Epilogue
    pop ebp
    ret                  ; Return to the caller
asmfunc ENDP
END
