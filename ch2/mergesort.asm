;
; Mergesort
;


section .data
    ; array goes here


section .text
    global main

main:
    nop


;------------------------------------------------------------------------------;
; merge: merge results of sort                                                 ;
;                                                                              ;
; in:                                                                          ;
;   rdi: pointer to array                                                      ;
;   rsi: p (start)                                                             ;
;   rdx: q (midpoint)                                                          ;
;   rcx: r (end)                                                               ;
;                                                                              ;
; reg:                                                                         ;
;   ebx: counter for left array                                                ;
;   ecx: counter for left array                                                ;
;                                                                              ;
; out:                                                                         ;
;                                                                              ;
;------------------------------------------------------------------------------;
merge:
    push rbp
    mov rbp, rsp

    mov rax, 
    sub rsp, 16

    .array equ 0

    mov [rsp+.array], rdi

    ; q - p + 1
    mov ebx, edx
    sub ebx, esi
    inc ebx

    ; r - q
    sub ecx,  edx

    leave
    ret

