CC=clang
OPTS=-o2 -Wall
INC=$(shell pwd)
OBJS= etc/convert.o etc/dump.o etc/sconvert.o rply.o

all: rply.a

rply.a: $(OBJS)
	ar rcs lib/$@ obj/*.o
	
%.o : %.c
	$(CC) -c $(OPTS) $< -o obj/$(notdir $@) -I$(INC)
	
clean:
	rm -f obj/*.o
	rm -f lib/*.a
