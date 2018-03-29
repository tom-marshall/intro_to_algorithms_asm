phony: is

is:
	yasm -f elf64 -g dwarf2 insertionsort.asm -l insertionsort.lst
	gcc -o insertionsort insertionsort.o
