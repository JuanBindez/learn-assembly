SRC = main.asm

OBJ = main.o

TARGET = exec-x86-64

ASM = nasm
LD = ld

ASMFLAGS = -f elf64
LDFLAGS = -s -o

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) $(TARGET) $(OBJ)

$(OBJ): $(SRC)
	$(ASM) $(ASMFLAGS) -o $(OBJ) $(SRC)

clean:
	rm -f $(OBJ) $(TARGET)
