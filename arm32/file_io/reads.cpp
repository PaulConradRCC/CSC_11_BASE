//Modified from page 7 of Interprocess Communication in Unix by John
//Shapely Gray 
//Usage: a.out filename
//Displays the contents of filename

#include <cstdio>
#include <unistd.h>
#include <cstdlib>
#include <sys/types.h> //needed for open
#include <sys/stat.h>  //needed for open
#include <fcntl.h>     //needed for open

using namespace std;

int main (int argc, char *argv[])
{
        int inFile;
                int n_char=0;
                	char buffer[10];
                	
                	        inFile=open(argv[1],O_RDONLY);
                	                if (inFile==-1)
                	                        {
                	                                        exit(1);
                	                                                }
                	                                                
                	                                                        //Use the read system call to obtain 10 characters from inFile
                	                                                                while( (n_char=read(inFile, buffer, 10))!=0)
                	                                                                        {
                	                                                                                        //Display the characters read
                	                                                                                                        n_char=write(1,buffer,n_char);
                	                                                                                                                }
                	                                                                                                                
                	                                                                                                                        close (inFile);
                	                                                                                                                        
                	                                                                                                                                return 0;
                	                                                                                                                                }
