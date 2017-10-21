#include <stdio.h>
#include <unistd.h>
#include <assert.h>

int main(int argc , char **argv){

  /* char *str;*/
  int retour;
  retour = getopt(argc , argv , "vrxw");
  //assert(retour!=-1);
  printf("%d",retour);
  
  return 0;
}
 
