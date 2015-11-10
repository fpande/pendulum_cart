#defining compiler
CC=gcc

#setting location for Visualize header
IDIR=./

IDIR1=./Mutex/


#setting the flags for the compiler
CFLAGS=-Wall -I$(IDIR) -I$(IDIR1) 
#setting source code
SRC = ./Visualize.c ./run_animation_from_file.c 


visualmake: $(SRC)
	$(CC) -o visual $(SRC) $(CFLAGS) -framework GLUT -framework OpenGL 
