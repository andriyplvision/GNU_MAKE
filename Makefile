.PHONY: all clean

TARGET = app
CC = gcc
SRC = func1/func1.c func2/func2.c func3/func3.c main.c
OBJS = func1.o func2.o func3.o main.o

ifeq ($(MACHINE),x86_64)
MARCH=x86-64
else ifeq ($(MACHINE),i386)
MARCH=$(uname -m)
endif

VPATH = $(PWD)func1 $(PWD)func2 $(PWD)func3

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $@

func1.o: func1/func1.c
	$(CC) -march=$(MARCH) -c $<

func2.o: func2/func2.c
	$(CC) -march=$(MARCH) -c $<

func3.o: func3/func3.c
	$(CC) -march=$(MARCH) -c $<

main.o: main.c
	$(CC) -march=$(MARCH) -c $<


clean:
	rm *.o app

#include func1.mk
#include func2.mk
#include func3.mk
