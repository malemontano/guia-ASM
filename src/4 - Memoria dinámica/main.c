#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Memoria.h"
int32_t strCmp(char* a, char* b);
extern char* strClone(char* str);

int main() {
	/* Acá pueden realizar sus propias pruebas */
	char* a = "Omega 4";
	char* ac = strClone(a);
	for(int i=0;i<8;i++){
		printf("%d\n", ac[i]);
	}
	strDelete(ac);
	return 0;
}
