extern "C" int atoi(char const *);

#include <cstdio>

int main()
{
	char const *test1 = "123456";
	char const *test2 = "-123456";
	char const *test3 = " 123456";
	char const *test4 = " -123456";
	char const *test5 = " X7";
	char const *test6 = "12345678901234567890";
	char const *test7 = "--1234567";
	char const *test8 = "12.345678";

	printf("Testing %s, atoi returned %d\n", test1, atoi(test1) );
	printf("Testing %s, atoi returned %d\n", test2, atoi(test2) );
	printf("Testing %s, atoi returned %d\n", test3, atoi(test3) );
	printf("Testing %s, atoi returned %d\n", test4, atoi(test4) );
	printf("Testing %s, atoi returned %d\n", test5, atoi(test5) );
	printf("Testing %s, atoi returned %d\n", test6, atoi(test6) );
	printf("Testing %s, atoi returned %d\n", test7, atoi(test7) );
	printf("Testing %s, atoi returned %d\n", test8, atoi(test8) );

	return 0;
}

