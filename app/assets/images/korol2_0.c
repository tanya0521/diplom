//Просто пустая строка
#include <stdio.h>
#include <math.h>
#include <omp.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define DOLLAR 10
int main(void){
	int i, val, val2, k;
	double y=0, x=0, wall_timer;
	float r0=0.45;
	srand(time(NULL));

//================================================================================
    
//One dollar flight.
			for (i=1; i<11; i++){
				
				wall_timer = omp_get_wtime();
				
			  #pragma omp parallel for private(k) num_threads(DOLLAR)
				for (int k=1; k <= DOLLAR; k++) {

					val = 0 + rand() %360;
					val2 = 0 + rand() %360;
		
					y=y+r0 * sin(val);
					x=x+r0 * cos(val2);

					//printf("y: %f, range: %f, <<%d>>\n", y, sin(val), val);
					//printf("x: %f, range: %f, <<%d>>\n\n", x, cos(val2) ,val2);
					printf ("Dollar: %d, wave: %d, x: %f, y: %f, range: %f,%f\n", k, i, x, y, r0*sin(val), r0*cos(val2));

			}
			printf("y: %f\n", y);
			printf("x: %f\n\n", x);
		}
	
	//================================================================================
	return 0;
}

