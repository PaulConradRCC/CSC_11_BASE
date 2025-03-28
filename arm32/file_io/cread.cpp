#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <cstdio>

int main()
{
	int fd;
	int data[5] = { 0,0,0,0,0 };

	printf("O_RDONLY=%d, O_WRONLY=%d, O_RDWR=%d\r\n",O_RDONLY,O_WRONLY,O_RDWR);

	fd = open("filename", O_RDONLY);

	if ( fd == -1 )
        {
        	printf("Error: can't read file\n");
		return 1;
        }

	read(fd,data,20);

	close(fd);

	for(int i=0;i<5;i++) printf("%d\n",data[i]);

	return 0;
}
