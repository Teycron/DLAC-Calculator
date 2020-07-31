CC := c++
FILENAME := calc
TESTFILE := ./testfiles/testfile_valid
LIB := ./libs/functions.cpp

all: clean calc

clean: 
	if [ -d "./build" ]; then rm -r build; fi
	rm -f $(FILENAME)

calc:
	mkdir build
	bison src/$(FILENAME).y -d -b build/$(FILENAME)
	flex -o build/lex.yy.c src/$(FILENAME).l
	$(CC) -o $(FILENAME) build/lex.yy.c build/$(FILENAME).tab.c $(LIB) -lfl

test:
	if [ ! -d "./build" ]; then make all; fi
	./calc $(TESTFILE)
