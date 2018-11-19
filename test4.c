#include <stdio.h>

int main () {
   FILE *f;
   int size;
   f = fopen("test.txt","r");
   fseek(f, 0, SEEK_END); // seek to end of file
   size = ftell(f); // get current file pointer   
   fclose(f);

	printf("Total size of file.txt = %d bytes\n", size);
   
   return(0);
}