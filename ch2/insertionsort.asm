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
            ; dd   55, 458, 828, 720, 768, 384, 788, 153,
            ; dd  209,  37, 427, 811, 695, 217, 620, 503,
            ; dd  991, 299, 889, 320,  40, 704, 692, 749,
            ; dd  640, 786, 934, 747,  41, 205, 925, 823,
            ; dd  855, 958, 533,  99, 953, 377, 799, 537,
            ; dd  558, 758, 502, 248, 617, 776, 366, 407,
            ; dd  241, 306, 183, 262, 582, 181, 383,  68,
            ; dd   42, 330, 148, 772, 996, 440, 844,  29,
            ; dd  114, 439, 516, 716, 779, 517, 519, 460,
            ; dd  910, 745, 932, 838,  89, 466, 298, 472,
            ; dd  736, 431, 521, 102, 168, 236, 560, 795,
            ; dd  200, 143, 284, 317, 572, 735, 853, 528,
            ; dd  576, 748, 972,  85, 796,  16, 452, 282,
            ; dd  323, 146, 875, 389, 454, 381, 498, 882,
            ; dd  579, 246, 347, 697, 281, 107, 191, 943,
            ; dd  151, 801, 673, 216,  69, 903, 967, 921,
            ; dd  774, 271, 485,  93, 690, 676, 269, 149,
            ; dd  201, 511, 954, 182, 969, 824, 944,  61,
            ; dd   17, 335, 800, 481, 237, 861, 229, 532,
            ; dd  568, 414, 887, 504, 174, 805, 372, 421,
            ; dd   38, 683, 975, 541, 847, 571,  18, 121,
            ; dd  630, 513, 198,  94, 256, 696, 816, 997,
            ; dd  353, 866, 711, 888,  12,  70, 636, 717,
            ; dd  413, 386, 642, 868, 397, 157,  20, 622,
            ; dd  113, 136, 794, 245,  48, 926, 737,  62,

    arrsz equ ($ - array) / 4


section .text
    extern printf
    global main


; Registers:
;   rdi: number currently being sorted
;   rsi: numbers less than current
;   ebx: outer index variable
;   ecx: inner index variable
main:
    push rbp
    mov rbp, rsp

    mov ebx, 1                      ; start from n = 1

.outerloop:
    mov edi, [array+ebx*4]

    mov ecx, ebx
    dec ecx

.innerloop
    mov esi, [array+ecx*4]
    cmp esi, edi
    jl .endouterloop

    mov [array+(ecx+1)*4], esi
    mov [array+ecx*4], edi
    dec ecx
    jge .innerloop


.endouterloop:
    inc ebx
    cmp ebx, arrsz
    jl .outerloop

.skipswap:

    xor eax, eax
    jmp .end

.print:
    lea rdi, [pfmt]
    movsxd rsi, dword [array+ebx*4]
    xor eax, eax
    call printf
    xor eax, eax

.end
    leave
    ret

