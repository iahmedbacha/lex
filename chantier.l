/*** Definition section ***/

%{
#include <stdlib.h>
#include <string.h>
#define TRUE 1
#define FALSE 0
char* mac;
char* ip;
int found;
%}

/* This tells flex to read only one input file */
%option noyywrap

H [0-9A-F]
M [a-zA-Z0-9\.]

%%

%({M}*)@({M}*)%
[0-9]{8,8}:[0-9]{2,2}h[0-9]{2,2}'[0-9]{2,2}\"[0-9]{2,2}%
({H}{H}:){5,5}{H}{H} {
	if (strcmp(yytext,mac)==0) {
		found=TRUE;
	}
}
([0-9]{1,3}.){3,3}[0-9]{1,3} {
	if (found) {
		ip = yytext;
		printf("%s", ip);
		found=FALSE;
	}
}
.

%%
/*** C Code section ***/

int main(int argc, char* argv[]) {
   /* Call the lexer, then quit. */
   mac = argv[1];
   found=FALSE;
   yyin = fopen("DHCPLOG.txt","r+");
   yylex();
   printf("\n");
   fclose(yyin);
   return 0;
}