# Variables
JAVAC = javac
JAVA = java
JFLAGS = -d bin
SRC = src
BIN = bin
MAINCLASS = com.craftinginterpreters.lox.Lox

# Source files
SOURCES = $(wildcard $(SRC)/com/craftinginterpreters/lox/*.java)

# Default target
all: $(BIN)/$(MAINCLASS).class

# Compile the Java source files
$(BIN)/$(MAINCLASS).class: $(SOURCES)
	@mkdir -p $(BIN)
	$(JAVAC) $(JFLAGS) $(SOURCES)

# Run the program in interactive mode
run: $(BIN)/$(MAINCLASS).class
	$(JAVA) -cp $(BIN) $(MAINCLASS)

# Run the program with a script file
runfile: $(BIN)/$(MAINCLASS).class
	@read -p "Enter script file path: " script; \
	$(JAVA) -cp $(BIN) $(MAINCLASS) $$script

# Clean the compiled files
clean:
	rm -rf $(BIN)/*

# Phony targets
.PHONY: all run runfile clean

