AS = as
LINKER = ld
ASFLAGS = -v -V -D -k -n \
          -march=generic64 \
          --64 \
          --size-check=warning \
          --gen-debug \
          --gstabs \
          --gstabs+ \
          --gdwarf-2 \
          --gdwarf-sections \
          --statistics \
          --mmnemonic=att \
          --msyntax=att

LFLAGS = 
INCLUDES =
LIBS =

# assembly source files
SRC = compare.s

OBJS = $(SRC:.s=.o)

MAIN = cmp

.PHONY: depend clean

all: $(MAIN)
	@echo Done

$(MAIN): $(OBJS)
	$(LINKER) -o $(MAIN) $(OBJS)

.s.o:
	$(AS) $(ASFLAGS) $(INCLUDES) $< -o $@

clean:
	$(RM) *.o *.~ $(MAIN)

depend: $(SRCS)
	makedepend $(INCLUDES) $^

# DO NOT DELETE THIS LINE -- make depend needs it
