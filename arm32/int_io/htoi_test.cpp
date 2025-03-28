extern "C" int htoi(char const *);

#include <cstdio>

int main()
{
	char const *test1 = "0400";
	char const *test2 = "FFFFFFFF";
	char const *test3 = "FFFFFFFFF";
	char const *test4 = "12345678";
	char const *test5 = "123XYZ";
	char const *test6 = "XYZ";
	char const *test7 = " 1234";
	char const *test8 = " ABCD";

	printf("Testing 0x%s, htoi returned %d\n", test1, htoi(test1) );
	printf("Testing 0x%s, htoi returned %d\n", test2, htoi(test2) );
	printf("Testing 0x%s, htoi returned %d\n", test3, htoi(test3) );
	printf("Testing 0x%s, htoi returned %d\n", test4, htoi(test4) );
	printf("Testing 0x%s, htoi returned %d\n", test5, htoi(test5) );
	printf("Testing 0x%s, htoi returned %d\n", test6, htoi(test6) );
	printf("Testing 0x%s, htoi returned %d\n", test7, htoi(test7) );
	printf("Testing 0x%s, htoi returned %d\n", test8, htoi(test8) );

	return 0;
}

