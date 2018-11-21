/*** Definition section ***/

%{
#include <stdlib.h>
int k;
%}

/* This tells flex to read only one input file */
%option noyywrap

%%

'[^\']*'	{printf("done\n");}
.

%%
/*** C Code section ***/

int main(void)
{
   /* Call the lexer, then quit. */
   yylex();
   return 0;
}