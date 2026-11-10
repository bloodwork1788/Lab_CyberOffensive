CC      = x86_64-w64-mingw32-gcc
CFLAGS  = -O2 -Wall -Wextra -mwindows
TARGET  = loader.exe
SRC     = loader.c
HDR     = shellcode_enc.h

all: $(TARGET)

$(TARGET): $(SRC) $(HDR)
	$(CC) $(CFLAGS) -o $@ $(SRC)

clean:
	rm -f $(TARGET)

.PHONY: all clean
