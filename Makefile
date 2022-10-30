DIR_BUILD = build

.PHONY: all bootloader image always

all: image

image: $(DIR_BUILD)/image.img
$(DIR_BUILD)/image.img: bootloader
	dd if=/dev/zero of=$(DIR_BUILD)/image.img bs=512 count=4096
	dd if=$(DIR_BUILD)/bootloader.bin of=$(DIR_BUILD)/image.img conv=notrunc

bootloader: $(DIR_BUILD)/bootloader.bin
$(DIR_BUILD)/bootloader.bin: always main.asm
	nasm main.asm -f bin -o $(DIR_BUILD)/bootloader.bin
	
always:
	mkdir -p $(DIR_BUILD)