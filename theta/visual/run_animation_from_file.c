#include <pthread.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>
#include <stdio.h>
#include <Visualize.h>





int main(int argc, char** argv) {
	
   
	//-----------------------------------GLUT SETUP--------------------------------------------------
   
   glutInit(&argc, argv);          
   glutInitDisplayMode(GLUT_DOUBLE);  
   glutInitWindowSize(720, 720);   
   glutInitWindowPosition(50, 50); 
   glutCreateWindow("Animation"); 

   //register callback
   glutDisplayFunc(renderPC);       
   
   glutIdleFunc(idle);  

   initGL();                       
   //-----------------------------------GLUT SETUP END--------------------------------------------------
   

   //create thread for reading file
   pthread_t read_file;
   pthread_create(&read_file, NULL, push_to_sample_from_file, NULL);


   glutMainLoop();                
   return 0;
}