
TARGET_ELF:=$(OUT)/$(PROJECT).elf
TARGET_BIN:=$(strip $(patsubst %.elf, %.bin, $(TARGET_ELF)))
TARGET_HEX:=$(strip $(patsubst %.elf, %.hex, $(TARGET_ELF)))
TARGET_MAP:=$(strip $(patsubst %.elf, %.map, $(TARGET_ELF)))
TARGET_LST:=$(strip $(patsubst %.elf, %.lst, $(TARGET_ELF)))

CROSS:=riscv-none-embed-

CC:=$(CROSS)gcc
LD:=$(CROSS)gcc
DUMP:=$(CROSS)objdump
COPY:=$(CROSS)objcopy

all: $(TARGET_ELF) $(TARGET_LST) $(TARGET_HEX)

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
LDFLAGS+=-Wl,-Map=$(TARGET_MAP)

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
	@$(LD) -o $@ $(OBJS) $(LDFLAGS)

$(TARGET_LST): $(TARGET_ELF)
	@echo DISASM $@
	@$(DUMP) $(DUMP_FLAGS) $< > $@

$(TARGET_HEX): $(TARGET_ELF)
	@echo GEN $@
	@$(COPY) -O ihex $< $@

clean:
	@echo CLEAN
	@rm -fr $(OUT)

openocd:
	openocd -f wch/wch-riscv.cfg

run: all
	$(CROSS)gdb $(TARGET_ELF) -ex "target remote :3333" -ex "mon reset halt" -ex "load" -ex "continue"

debug: all
	$(CROSS)gdb $(TARGET_ELF) -ex "target remote :3333" -ex "mon reset halt" -ex "load"

flash: all
	@echo "Programming..."
	@openocd -f wch/wch-riscv.cfg -c init -c halt -c "flash erase_sector wch_riscv 0 last" -c "program $(TARGET_ELF) verify" -c wlink_reset_resume -c exit

.PHONY: all clean

-include $(DEPS)
