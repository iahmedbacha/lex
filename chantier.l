/*** Definition section ***/

%{
#include <stdlib.h>
char* mac;
char* ip;
int found;
%}

/* This tells flex to read only one input file */
%option noyywrap

H [0-9A-F]
m [a-zA-Z0-9\.]

%%

%({m}*)@({m}*)% {}
[0-9]{8,8}:[0-9]{2,2}h[0-9]{2,2}'[0-9]{2,2}\"[0-9]{2,2}% {}
({H}{H}:){5,5}{H}{H} {
	if (strcmp(yytext,mac)==0) {
		found=1;
	}

}
([0-9]{1,3}.){3,3}[0-9]{1,3} {
	if (found==1) {
		ip = yytext;
		printf("%s\n", ip);
	}
}
.

%%
/*** C Code section ***/

int main(int argc, char* argv[])
{
   /* Call the lexer, then quit. */
   mac = argv[1];
   found=0;
   FILE* input;
   input = fopen("DHCPLOG","r+");
   yyin = input;
   yylex();
   return 0;
}