SHELL=/bin/sh

CC=gcc


INCLUDE_DIRS = -I./include -I./SDL/include/SDL2
LIB_DIR = -L./SDL/lib
LIBS = -lSDL2

SRC_DIR = src

OBJ_DIR = build

src = $(wildcard $(SRC_DIR)/*.c)
objs = $(subst $(SRC_DIR)/, $(OBJ_DIR)/, $(patsubst %.c, %.o, $(src)))

all: directories $(objs)

.PHONY: directories
directories:
	mkdir -p $(OBJ_DIR)

$(objs):$(src)
	$(CC) -c $(INCLUDE_DIRS) -o $@ $(patsubst %.o, %.c, $(subst build, src, $@))

.PHONY: clean
clean:
	rm a.out -rf $(OBJ_DIR) $(TARGET_DIR)
