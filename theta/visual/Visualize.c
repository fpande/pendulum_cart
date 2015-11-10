#include <time.h>
#include <math.h>
#include <sys/time.h>
#include <unistd.h>
#include <stdio.h>
#include <pthread.h>
#include <mutexes.h>
#include <string.h>
#include <Visualize.h>



//Initialize global variable. 
//ONLY initialized here.
VisualSample VISUALSAMPLE;

pthread_mutex_t visual_lock;


//Pushes data from file to the global VISUALSAMPLE. 
//It runs in its own thread from run_animation_from_file.c
void *push_to_sample_from_file()
{
   
   char str[80];
   
   double t;
   double x_c;
   double theta;




   FILE *file_pointer;
   file_pointer = fopen("../model/sim_pc_visual.dat", "r");
   if(file_pointer == NULL) 
   {
      printf("%s\n", "Error opening file");
   }

   double start_time = get_time_stamp();

   while(1){ 
         if( fgets (str, 80, file_pointer)!=NULL ){   
            printf("%s","data: ");
            sscanf(str,"%lf"  "%lf"  "%lf", &t, &x_c, &theta);
            printf("%s\n",str);
            while( (get_time_stamp()-start_time) < t)
            {
               continue;
            }
            pthread_mutex_lock(&visual_lock);
            VISUALSAMPLE = (VisualSample) { t, x_c, theta };
            pthread_mutex_unlock(&visual_lock);
            usleep(1000);
         }      
   }
}








static double get_time_stamp()
{
   struct timeval Mytv;
   gettimeofday( &Mytv, NULL);
   double time_stamp = (double) (Mytv.tv_sec + (Mytv.tv_usec/1000000.0));
   return time_stamp;
}







//----------------------------GL---------------------------------------


void initGL() 
{
    
   glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}
 

void idle() 
{
   glutPostRedisplay();   
}


void renderPC() 
{


   //glLineWidth(4.0);
   glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);   
   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();
   gluOrtho2D(-10, 10, -10, 10);




   pthread_mutex_lock(&visual_lock);
   double x_c = VISUALSAMPLE.x_c;
   double theta = VISUALSAMPLE.theta;
   pthread_mutex_unlock(&visual_lock);
   

   double x_p = x_c + sin(theta);
   double y_p = cos(theta);

   double radius_pendulum = 0.1;
   double PI=3.14159265359;


   glMatrixMode(GL_MODELVIEW);
   glLoadIdentity();
   gluLookAt(x_c,0.0,1.0,
             x_c,0.0, 0.0,
             0.0,1.0,0.0);



  
      

   //the cart
   glPushMatrix();
   glTranslatef(x_c, -0.25f, 0.0f);    
   glRotatef(0.0f, 0.0f, 0.0f, 0.0f); 
   glBegin(GL_QUADS);                  
      glColor3f(1.0f, 1.0f, 1.0f);     
      glVertex2f(-0.4, 0.25);
      glVertex2f(0.4, 0.25);
      glVertex2f(0.4, -0.25);
      glVertex2f(-0.4, -0.25);
   glEnd();
   glPopMatrix(); 

   //the pendulum
   glPushMatrix();
   glTranslatef(0.0f, 0.0f, 0.0f);    
   glRotatef(0.0f, 0.0f, 0.0f, 0.0f); 
   glBegin(GL_LINES);                  
      glColor3f(1.0f, 0.0f, 0.0f);     
      glVertex2f(x_p, y_p);
      glVertex2f(x_c, 0);
   glEnd();
   glBegin(GL_POLYGON);
      for(double i = 0; i < 2 * PI; i += PI / 6)
            glVertex3f(x_p+cos(i) * radius_pendulum, y_p+sin(i) * radius_pendulum, 0.0);
   glEnd();
   glPopMatrix(); 





   //obstacle
   glPushMatrix();
   glTranslatef( 0.0f, 0.0f, 0.0f);    
   glRotatef(0.0f, 0.0f, 0.0f, 0.0f); 
   glBegin(GL_QUADS);                  
      glColor3f(1.0f, 1.0f, 1.0f);     
      glVertex2f(-0.1, 0.0);
      glVertex2f(0.1, 0.0);
      glVertex2f(0.1, -2);
      glVertex2f(-0.1, -2);
   glEnd();
   glPopMatrix(); 


   //TODO : render path












   


   

   glPopMatrix();    
                 
   
   glutSwapBuffers();
}

//------------------------------------GL END-----------------------------------

