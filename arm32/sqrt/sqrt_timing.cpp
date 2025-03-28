#include <cstdio>
#include <cmath>
#include <ctime>

#define RESET   "\033[0m"
#define BLACK   "\033[30m"      /* Black */
#define RED     "\033[31m"      /* Red */
#define GREEN   "\033[32m"      /* Green */
#define YELLOW  "\033[33m"      /* Yellow */
#define BLUE    "\033[34m"      /* Blue */
#define MAGENTA "\033[35m"      /* Magenta */
#define CYAN    "\033[36m"      /* Cyan */
#define WHITE   "\033[37m"      /* White */
#define BOLDBLACK   "\033[1m\033[30m"      /* Bold Black */
#define BOLDRED     "\033[1m\033[31m"      /* Bold Red */
#define BOLDGREEN   "\033[1m\033[32m"      /* Bold Green */
#define BOLDYELLOW  "\033[1m\033[33m"      /* Bold Yellow */
#define BOLDBLUE    "\033[1m\033[34m"      /* Bold Blue */
#define BOLDMAGENTA "\033[1m\033[35m"      /* Bold Magenta */
#define BOLDCYAN    "\033[1m\033[36m"      /* Bold Cyan */
#define BOLDWHITE   "\033[1m\033[37m"      /* Bold White */

#define CLEAR "\033[2J"  // clear screen escape code 

#define fp double

const fp ACC=0.0000000000000001;

fp bab_sqrt(fp n)
{
	fp t;
	fp s=n+1;

	do
	{
		t=s;
		s=.5*(n/t+t);
	} while( t-s > ACC );

	return s;
}

int main()
{
	fp n, r, r_sq;
	printf(CLEAR);
	printf("Square Root Calculator\n\n");
	printf("Enter a value for N (must be positive): ");
	printf(BOLDCYAN);
	scanf("%lf", &n);
	printf(RESET);

	int t=time(0);
	for(int i=0;i<50000000;i++) r=bab_sqrt(n);
	t=time(0)-t;

	printf("Took %d seconds for 50,000,000 iterations (%f seconds/iteration)\n",t);

	float foo;

	t=time(0);
	for(int i=0;i<50000000;i++) foo=sqrt(n);
	t=time(0)-t;

	printf("Took cmath sqrt %d seconds for 50,000,000 iterations (%f seconds/iteration)\n",t);

	r_sq = r*r;

	printf("\nThe square root of %.16lf is %.16lf (with accuracy set at %.16lf)\n", n, r,ACC);
	printf("The square of the square root is %.16lf (err=%.16lf)\n", r_sq, n-r_sq );
	printf("The cmath library sqrt function says sqrt of %.16lf is %.16lf\n", n,sqrt(n));
	printf("The difference between bab_sqrt and cmath sqrt is: %.16lf\n", r-sqrt(n));
	return 0;
}
