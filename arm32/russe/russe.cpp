/* * PROGRAMMER: Paul Conrad
 * PROBLEM TITLE: Multiplcation a la Russe
 * PROBLEM DEFINITION: This program contains the multiplication a la Russe algorithm that is
 * introduced in: Fundamentals of Algorithmics by G. Brassard, P. Bratley
 * DATE: 4/9/2016
 * SYSTEM - HARDWARE: Intel i7
 * - SOFTWARE: GNU C++, Open Suse Linux 13
 * Input Devices: Keyboard for user input
 * Output Devices: Terminal screen for result output
 *
 * ASSUMPTIONS: This program will prompt the user to enter two integer values, m and n.
 * The values are assumed to be positive numbers. */
#include <iostream>
using namespace std; 

int russe(int m, int n); // function prototype/header for russe
// main function here
int main() {
	int m,n;
	
	cout << "Enter a value for M: ";
	cin >> m;
	
	cout << "Enter a value for N: ";
	cin >> n;
	
	cout << "The result of " << m << " times " << n << " a la Russe is " << russe(m,n) << endl;
	
	return 0;
}

int russe(int m, int n) {
	// if m and/or n is zero, result is 0
	if ( m==0 || n==0 ) return 0;
	// handle special case if m or n are 1...
	if ( m==1 ) return n;
	if ( n==1 ) return m;
	
	int result = 0;
	int tm, tn;
	int counter=0;
	tm=m, tn=n;
	if (m>n)
	{
		tm=n;
		tn=m;
	}
	
	do
	{
		counter++;
		cout << "tm="<<tm<<", tn="<<tn<<", result="<<result<<endl;
		if ( (tm%2) != 0 )
		{
			cout << "....tm is odd....\n";
			result = result + tn; // if m is odd, the result=result+n
		}
		tm=tm/2;
		tn=tn+tn;
	} while(tm > 0);
	cout << "Took " << counter << " iterations to compute product." << endl;
	return result;
}
