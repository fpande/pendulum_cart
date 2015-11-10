#ifndef Visualize_h
#define Visualize_h

#include <GLUT/glut.h>
#include <OpenGL/gl.h>





typedef struct {
	double t;
   	double x_c;
   	double theta;
 	
} VisualSample;


extern VisualSample VISUALSAMPLE;





void *push_to_sample_from_file();

static double get_time_stamp();

void initGL();

void idle();

void renderPC();



#endif