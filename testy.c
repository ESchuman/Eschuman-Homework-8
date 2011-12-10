#include "cma.h"

#define MSIZE 1024*16
//unsigned char mem[MSIZE];

int main(int argc, char * argv[]) {
	int zzjky = atoi(argv[1]);
	unsigned int mem[zzjky];
	int i = 0;
	int x = 1;
	int y = x;
	printf("\n\n%d\n\n", zzjky);
	char *strings[50];
	class_memory(mem,zzjky); // give it memory allocator
	strings[i] = (char *)class_malloc(x);
	x = x * 2;
	while (strings[i]){
		y = x;
		i = i + 1;
		strings[i] = (char *)class_malloc(x);
		x = x * 2;
	} //allocate from classmem library
	for (i = 49; i>=0; i--) 
		class_free(strings[i]);
	class_stats();
        printf("\nThe Last, Largest Allocation Was:%d\n", y);
	return 0;
}
