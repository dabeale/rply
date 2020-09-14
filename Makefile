
OPTS=-o2 -fPIC

INC=$(shell pwd)
OBJS= etc/convert.o etc/dump.o etc/sconvert.o rply.o

AR=ar -rcs
RM=rm -rf
MKDIR=mkdir -p

LIB_DIR=lib
OBJ_DIR=obj

OUT_LIB=librply.a

all: $(OBJ_DIR) $(OUT_LIB)

$(OUT_LIB): $(OBJS)
	$(MKDIR) $(LIB_DIR)
	$(AR) $(LIB_DIR)/$@ $(OBJ_DIR)/*.o
	
%.o : %.c
	$(MKDIR) $(dir $@)
	$(CC) -c $(OPTS) $< -o $(OBJ_DIR)/$(notdir $@) -I$(INC)
	
$(OBJ_DIR):
	$(MKDIR) $@
	
clean:
	$(RM) $(OBJ_DIR)
	$(RM) $(LIB_DIR)

