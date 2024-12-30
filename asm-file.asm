INCLUDE Irvine32.inc

.data
; Declare message for procedure completion
msg db "Assembly procedure completed successfully.", 0

.code
asmfunc PROC arr:DWORD, array_size:DWORD, result:DWORD
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
mov eax,[edi]
    add eax, ebx         ; Add the odd number to EAX
mov [edi], eax 
skip_odd:
    add esi, 4           ; Move to the next array element (4 bytes per int)
 ;   dec ecx              ; Decrement the counter
    jmp sum_loop         ; Repeat the loop

end_loop:
         ; Store the sum in the result variable

    ; Print completion message
    mov edx, OFFSET msg
    call WriteString
    call Crlf

    ; Epilogue
    pop ebp
    ret                  ; Return to the caller
asmfunc ENDP
END
