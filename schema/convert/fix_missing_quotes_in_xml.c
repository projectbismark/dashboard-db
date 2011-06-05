/* Repair malformed XML in bismark data */
/* This reads in the malformed xml, which lacks " characters,
   Adds them, and then rewrites the file with the corrected version.
   It does no error checking, the variable names are short, & it will
   fail on files larger than available virtual memory.
   */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <memory.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

main(int argc, char **argv) {
  int fd;
  struct stat s;
  int i,f;
  int oi;
  char * fp;
  char * op;
  char outname[1024];

  for(f=1; f<argc; f++) {  
    //    fprintf(stderr,"Processing %s\n",argv[f]);
    fd = open(argv[f],O_RDONLY);
    fstat(fd,&s);
    if(s.st_size == 0) { close(fd); continue; }
    fp = (char *) mmap(NULL,s.st_size,PROT_READ,MAP_PRIVATE,fd,0);
    op = (char *) malloc(s.st_size*2);
    oi = 0;

    for(i = 0; i<=s.st_size; i++) {
      if(fp[i] == '=') {
	if(fp[i+1] != '"') {
	  op[oi++]= fp[i++]; 
	  op[oi++] = '"';
	  for (; !(isblank(fp[i]) | fp[i]=='>'); ++i) {
	    op[oi++]=fp[i];
	  }
	  op[oi++] = '"';
	  op[oi++] = fp[i];
	} else {
	  op[oi++] = fp[i];
	}
      } else {
	op[oi++] = fp[i];
      }
    }
    munmap(fp,s.st_size);
    close(fd);
    if(oi > i) {
      fprintf(stderr,"Rewriting %s\n",argv[f]);
      fd = open(argv[f],O_RDWR);
      write(fd,op,oi);
      close(fd);
    }
    free(op);
    }
}
