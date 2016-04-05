#CC = arm-angstrom-linux-gnueabi-gcc
CC = /media/Sky-soft/a20/gcc-linaro-arm-linux-gnueabihf-4.7/bin/arm-linux-gnueabihf-gcc

CFLAGS = -Wall -O3 -ggdb
LDFLAGS = -static -g

#CFLAGS = -Wall -I$(HOME)/lichee/buildroot/output/staging/usr/include
#LDFLAGS = -L$(HOME)/lichee/buildroot/output/target/usr/lib 
#-lSDL -lSDL_mixer -lmad -lSDL_ttf -lSDL_gfx -lpng -ljpeg -lfreetype -lSDL_image -lts -lm -ldirectfb -lfusion -ldirect -lz

EXE = $(shell basename `pwd`)
#SRC = $(wildcard *.c)
SRC = tvin-hdmi.c
OBJ = $(SRC:.c=.o)

.PHONY : all
all: $(SRC) $(EXE)
	
$(EXE): $(OBJ) 
	$(CC) $(LDFLAGS) $(OBJ) -o $@
	
.c.o:
	$(CC) -c $(CFLAGS) $< -o $@
	
.PHONY : all
clean : 
	-rm *.o	$(EXE)
