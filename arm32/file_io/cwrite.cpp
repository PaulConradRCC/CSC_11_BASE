#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <cstdio>

int main()
{
	int fd;
	int data[5] = { 1,3,5,7,9 };

	if ( (fd = open("./filename", O_WRONLY|O_CREAT|O_TRUNC, 0x644) ) == -1 )
        {
        	printf("Error: can't create file\n");
		return 1;
        }

	write(fd,data,20);

	close(fd);

	return 0;
}
