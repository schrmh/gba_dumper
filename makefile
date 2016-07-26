CC = gcc
CFLAGS = -Wall

INCLUDEDIR = include
SOURCEDIR = src

DEPS = $(wildcard $(INCLUDEDIR)/*.h) $(wildcard $(INCLUDEDIR)/*/*.h)
SOURCES = $(wildcard $(SOURCEDIR)/*.c) $(wildcard $(SOURCEDIR)/*/*.c)

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: $(SOURCES)
	$(CC) -o rom_dumper $(SOURCES) $(CFLAGS)

debug: $(SOURCES)
	$(CC) -o rom_dumper_debug $(SOURCES) -g $(CFLAGS)

.PHONY: clean

clean:
	rm -f src/*.o rom_dumper
	