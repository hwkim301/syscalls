CC = gcc
DIRS = open 

all: $(DIRS)

$(DIRS):
	@echo "Building $@..."
	$(CC) $(CFLAGS) $@/$@.c -o $@/$@

clean:
	@for dir in $(DIRS); do \
		rm -f $$dir/$$dir; \
	done

.PHONY: all clean $(DIRS)
