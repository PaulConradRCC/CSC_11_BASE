#include <iostream>
#include <time.h>
using namespace std;
 
timespec diff(timespec start, timespec end);
 
int main()
{
	timespec time1, time2;

	int x[1000];
	for(int i=0;i<1000;i++) x[i]=i+1;
	int s=5; // some scalar

	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);
	for (int i = 0; i< 2000; i++)
		for(int j=999;j>=0;j-=64)
		{
			x[j]=x[j]+s;
			x[j-1]=x[j-1]+s;
			x[j-2]=x[j-2]+s;
			x[j-3]=x[j-3]+s;
			x[j-4]=x[j-4]+s;
                        x[j-5]=x[j-5]+s;
                        x[j-6]=x[j-6]+s;
                        x[j-7]=x[j-7]+s;
			x[j-8]=x[j-8]+s;
                        x[j-9]=x[j-9]+s;
                        x[j-10]=x[j-10]+s;
                        x[j-11]=x[j-11]+s;
			x[j-12]=x[j-12]+s;
                        x[j-13]=x[j-13]+s;
                        x[j-14]=x[j-14]+s;
                        x[j-15]=x[j-15]+s;
			x[j-16]=x[j-16]+s;
                        x[j-17]=x[j-17]+s;
                        x[j-18]=x[j-18]+s;
                        x[j-19]=x[j-19]+s;
                        x[j-20]=x[j-20]+s;
                        x[j-21]=x[j-21]+s;
                        x[j-22]=x[j-22]+s;
                        x[j-23]=x[j-23]+s;
                        x[j-24]=x[j-24]+s;
                        x[j-25]=x[j-25]+s;
                        x[j-26]=x[j-26]+s;
                        x[j-27]=x[j-27]+s;
                        x[j-28]=x[j-28]+s;
                        x[j-29]=x[j-29]+s;
                        x[j-30]=x[j-30]+s;
                        x[j-31]=x[j-31]+s;
			x[j-32]=x[j-32]+s;
                        x[j-33]=x[j-33]+s;
                        x[j-34]=x[j-34]+s;
                        x[j-35]=x[j-35]+s;
                        x[j-36]=x[j-36]+s;
                        x[j-37]=x[j-37]+s;
                        x[j-38]=x[j-38]+s;
                        x[j-39]=x[j-39]+s;
                        x[j-40]=x[j-40]+s;
                        x[j-41]=x[j-41]+s;
                        x[j-42]=x[j-42]+s;
                        x[j-43]=x[j-43]+s;
                        x[j-44]=x[j-44]+s;
                        x[j-45]=x[j-45]+s;
                        x[j-46]=x[j-46]+s;
                        x[j-47]=x[j-47]+s;
			x[j-48]=x[j-48]+s;
                        x[j-49]=x[j-49]+s;
                        x[j-50]=x[j-50]+s;
                        x[j-51]=x[j-51]+s;
                        x[j-52]=x[j-52]+s;
                        x[j-53]=x[j-53]+s;
                        x[j-54]=x[j-54]+s;
                        x[j-55]=x[j-55]+s;
                        x[j-56]=x[j-56]+s;
                        x[j-57]=x[j-57]+s;
                        x[j-58]=x[j-58]+s;
                        x[j-59]=x[j-59]+s;
                        x[j-60]=x[j-60]+s;
                        x[j-61]=x[j-61]+s;
                        x[j-62]=x[j-62]+s;
                        x[j-63]=x[j-63]+s;
		}
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);
	cout<<(diff(time1,time2).tv_sec/2000000)<<":"<<(diff(time1,time2).tv_nsec/2000000)<<endl;
	return 0;
}
 
timespec diff(timespec start, timespec end)
{
	timespec temp;
	if ((end.tv_nsec-start.tv_nsec)<0) {
		temp.tv_sec = end.tv_sec-start.tv_sec-1;
		temp.tv_nsec = 1000000000+end.tv_nsec-start.tv_nsec;
	} else {
		temp.tv_sec = end.tv_sec-start.tv_sec;
		temp.tv_nsec = end.tv_nsec-start.tv_nsec;
	}
	return temp;
}
