#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<unistd.h>
#include<assert.h>
#include<dirent.h>
#include<linux/limits.h>
#include<string.h>
#include<search.h>

#define TAILLE_MAX 500

int du_file(const char* pathname);

int fill(struct dirent f);

static int opt_follow_links = 0;
static int opt_apparent_size = 0;

static int statuss;




int main(int argc, char **argv){
  int opt;
  char *path;
  statuss = hcreate(TAILLE_MAX);
  while ((opt = getopt(argc,argv,"bL")) != -1) {
    switch(opt) {
    case 'b':
      opt_apparent_size = 1;
      break;
    case 'L':
      opt_follow_links = 1;
      break;
    default:
      break;
    }
  }
  argc -= optind;
  argv += optind;
  path = argv[0];
  printf("%d\n",du_file(path));
  return 0;
}

int du_file(const char* pathname){
  struct stat st;
  int status;
  int size = 0;
  
  if (opt_follow_links) {
    status = stat(pathname,&st);
  } else  {
    status = lstat(pathname,&st);
    
  }
  assert(status != -1);

  if (opt_apparent_size) {
    size += st.st_size;
  } else {
    size += st.st_blocks;
  }

  
  if (S_ISDIR(st.st_mode)) {
    
    DIR *dir;
    struct dirent *f;
    char path[PATH_MAX+1];
    dir = opendir(pathname);
    assert(dir != NULL);
    while ((f = readdir(dir)) != NULL) {
      if ((strcmp(f->d_name,".")) && (strcmp(f->d_name,".."))) {
	snprintf(path,PATH_MAX,"%s/%s",pathname,f->d_name);
	size += du_file(path);
      }
    }
    closedir(dir);
  }
  return size;

}


int fillmap(struct stat st) {
  ENTRY entry;
  ENTRY * hash;
  

  
}
