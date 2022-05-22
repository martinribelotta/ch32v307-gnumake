OUT:=build
PROJECT:=firmware
CSRC:=$(wildcard src/*.c)
ASRC:=$(wildcard src/*.S)
INCLUDES:=src
DEFINES:=
OPT:=-Og -g3
SPECS:=nosys nano
LIBPATH:=
LIBS:=
EXTRA_CFLAGS:=
EXTRA_LDFLAGS:=

include mk/common.mk
