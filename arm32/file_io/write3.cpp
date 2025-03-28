
#include <stdio.h>
#include <stdlib.h>

struct threeNum
{
   int n1, n2, n3;
};

int main()
{
      FILE *fptr;
         fptr = fopen("C:\\program.txt","wb");
         
            if(fptr == NULL)
               {
                     printf("Error!");   
                           exit(1);             
                              }
					struct threeNum num;
					for(int n = 1; n < 5; ++n)
					   {
					         num.n1 = n;
					               num.n2 = 5*n;
					                     num.n3 = 5*n + 1;
					                           fwrite(&num, sizeof(struct threeNum), 1, fptr); 
		                              }                                    
                                          fclose(fptr);
                                          
                                             return 0;
                                             }
