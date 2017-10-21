#include <linux/limits.h>
#include <stdio.h>

int main() {

	int pathmax; 
	int namemax;

	pathmax = PATH_MAX;
	namemax = NAME_MAX;

	printf("NAME_MAX = %d ; PATH_MAX = %d\n",namemax,pathmax);

	return 0;
}
