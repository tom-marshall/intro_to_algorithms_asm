;
; Insertion sort
;

section .data
    pfmt    db  "%d", 10, 0
    array   dd  625, 928, 155, 929, 482, 858, 415, 777,
            dd  496, 363, 657, 734, 651,  45, 544, 228,
            dd   95, 941, 158, 301, 705, 931, 730, 621,
            dd  337,  82, 380, 843, 792, 451, 152, 715,
            dd  846, 578, 193, 488, 684, 285, 470, 963,
            dd  876, 672, 520, 948, 531, 231,  50, 321,
            dd  220,  22, 354, 793, 857, 426,  57, 761,
            dd  536, 260, 746, 161,  84, 693, 790, 595,

    arrsz equ ($ - array) / 4


section .text
    extern printf
    global main

; Registers:
;
;   rdi: number currently being sorted
;   rsi: numbers less than current
;   ebx: outer index variable
;   ecx: inner index variable

main:
    push rbp
    mov rbp, rsp

    mov ebx, 1                  ; start from n = 1

.outerloop:
    mov edi, [array+ebx*4]      ; current element being sorted

    mov ecx, ebx                ; inner index is outer minus 1
    dec ecx

.innerloop
    mov esi, [array+ecx*4]      ; test array element to the left
    cmp esi, edi                ; compare them
    jl .endouterloop            ; skip swap if they're sorted

    mov [array+(ecx+1)*4], esi  ; swap elements
    mov [array+ecx*4], edi

    dec ecx
    jge .innerloop

.endouterloop:
    inc ebx                     ; move to next element in array for testing
    cmp ebx, arrsz              ; see if we've tested the entire array
    jl .outerloop               ; if not, start from the outer loop

    xor eax, eax                ; exit status 0

    leave                       ; clean up stack
    ret                         ; return from main


; TODO implement printing array
;print:
;    lea rdi, [pfmt]
;    movsxd rsi, dword [array+ebx*4]
;    xor eax, eax
;    call printf

