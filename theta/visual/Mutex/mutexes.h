/*Mutexes defined here and used as global variables in the code. 
Defining them here as extern global variables makes it easy the ensure thread safety
across the codes modules*/

#ifndef mutexes_h
#define mutexes_h

#include <pthread.h>

extern pthread_mutex_t visual_lock;
extern pthread_mutex_t reference_input_lock;



#endif