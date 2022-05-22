
TARGET_ELF:=$(OUT)/$(PROJECT).elf
TARGET_BIN:=$(patsubst %.elf, %.bin, $(TARGET_ELF))
TARGET_HEX:=$(patsubst %.elf, %.hex, $(TARGET_ELF))
TARGET_MAP:=$(patsubst %.elf, %.map, $(TARGET_ELF))
TARGET_LST:=$(patsubst %.elf, %.lst, $(TARGET_ELF))

CROSS:=riscv-none-embed-

CC:=$(CROSS)gcc
LD:=$(CROSS)gcc
DUMP:=$(CROSS)objdump

all: $(TARGET_ELF) $(TARGET_LST)

include wch/wch.mk

OBJS:=$(addprefix $(OUT)/, $(patsubst %.c, %.o, $(CSRC)) $(patsubst %.S, %.o, $(ASRC)))
DEPS:=$(patsubst %.o, %.d, $(OBJS))

SPECS_FLAGS:=$(addsuffix .specs, $(addprefix -specs=, $(SPECS)))
CFLAGS:=$(ARCH) 
CFLAGS+=$(OPT) -ffunction-sections -fdata-sections
CFLAGS+=$(SPECS_FLAGS)
CFLAGS+=$(EXTRA_CFLAGS)
CFLAGS+=$(addprefix -I, $(INCLUDES))
CFLAGS+=$(addprefix -D, $(DEFINES))

LDFLAGS:=$(ARCH)
LDFLAGS+=-nostartfiles
LDFLAGS+=$(SPECS_FLAGS)
LDFLAGS+=$(addprefix -L, $(LIBPATH))
LDFLAGS+=$(addprefix -l, $(LIBS))
LDFLAGS+=$(addprefix -T, $(LINKER_SCRIPTS))
LDFLAGS+=-Wl,--print-memory-usage
LDFLAGS+=$(EXTRA_LDFLAGS)

DUMP_FLAGS:=-dxfSs

$(OUT)/%.o: %.c
	@mkdir -p $(@D)
	@echo CC $<
	@$(CC) -MMD -c $(CFLAGS) -o $@ $<

$(OUT)/%.o: %.S
	@mkdir -p $(@D)
	@echo AS $<
	@$(CC) -MMD -c $(CFLAGS) -o $@ $<

$(TARGET_ELF): $(OBJS)
	@echo LD $@
	@$(LD) $(LDFLAGS) $(OBJS) -o $@

$(TARGET_LST): $(TARGET_ELF)
	@echo DISASM $@
	@$(DUMP) $(DUMP_FLAGS) $< > $@

clean:
	@echo CLEAN
	@rm -fr $(OUT)
