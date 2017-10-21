#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>


void usage (char *prog);
int maccess (int argc, char **argv);
void verboseArg(int verb);

int vflag, rflag, wflag, xflag;

int main (int argc, char **argv) {
   int ch;
  
   vflag = 0;
   rflag = 0;
   wflag = 0;
   xflag = 0;
   while ((ch = getopt(argc, argv, "vrwx")) != -1) {
     
      switch (ch) {

      case 'r':
         rflag = 1;
         break;
      case 'w':
         wflag = 1;
         break;
      case 'x':
         xflag = 1;
         break;
      case 'v':
         vflag = 1;
        
         break;
	 
      default:
         usage(argv[0]);
      }
   }
   
  
   
   argc -= optind;
   argv += optind;
   return maccess(argc,argv);
}
/*a usage function for helping user */
void usage (char *prog) {
   printf("usage : %s [rvwx] file", prog);
}

int maccess (int argc, char **argv) {
   int i;
   int mode = 0;
   int retour;
   if (rflag == 1){
	mode = mode | R_OK;
   }
   else if (wflag == 1){
	mode = mode | W_OK;
	}
   else if (xflag == 1){
	mode = mode | X_OK;
	}
   else {
		printf("Aucune option de vérification n'a été renseignée.\n");
		exit(EXIT_FAILURE);
	}

   retour = access(argv[0],mode);
   /*printf("%d\n",retour);*/
   if(retour ==-1){
	   verboseArg(vflag); /*on passe l'option verbose en param*/
   }
   printf("accès accepé\n");
   printf("OPTIONS verbose:%i, read:%i, write:%i, exec:%i\n",vflag,rflag,wflag,xflag);
   printf("REMAINING %i ARGS:\n",argc);
   for (i = 0; i < argc; i++) {
      printf("\t%s\n",argv[i]);
   }
   return EXIT_SUCCESS;
}

/*
this is the 
verbose option The function displays the error message corresponding 
to the error encountered when entering the option by the user
*/
void verboseArg(int verb){
	if (verb) {
			switch (errno) {
				case EACCES:
					printf("Accès refusé.\n");
					break;
				/*case ELOOP:
					printf("Trop de liens symboliques ont été rencontrés.\n");
					break;*/
				case ENAMETOOLONG:
					printf("Nom de fichier trop long.\n");
					break;
				case ENOENT:
					printf("Un élément du chemin d'accès (path) n'existe pas ou est un pointeur pointant nulle part.\n");
					break;
				case ENOTDIR:
					printf("Un élément du chemin d'accès (path) n'est pas un repertoire.\n");
					break;
				case EROFS:
					printf("Il n'est pas permis de demander une écriture sur un système de fichiers en lecture seule.\n");
					break;
				case ESRCH:
					printf("No such process");
					break;
				
				default:
					perror("");
			}
	}
	exit(EXIT_FAILURE);
}

