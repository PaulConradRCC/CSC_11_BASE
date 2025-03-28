#include <cstdio>

int main()
{
	FILE* ptr = fopen("test.txt","r");
	int value, sum=0;

	do
	{
		fscanf(ptr, "%d", &value);
		if (value==-1) break;
		sum += value;
	} while(true);

	fclose(ptr);
	return sum;
}
