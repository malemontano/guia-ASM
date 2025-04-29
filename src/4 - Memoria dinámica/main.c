#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Memoria.h"
int32_t strCmp(char* a, char* b); 
int main() {
	/* Acá pueden realizar sus propias pruebas */
	printf("%d\n", strCmp("sar", "23"));   // debe dar -1
	return 0;
}
