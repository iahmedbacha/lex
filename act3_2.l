/*** Definition section ***/

%{
#include <stdlib.h>
int k;
%}

/* This tells flex to read only one input file */
%option noyywrap

L (0|01|11)

%%

0/L*	{printf("a");}
01/L*	{printf("b");}
11	{printf("c");}
.

%%
/*** C Code section ***/

int main(void)
{
   /* Call the lexer, then quit. */
   yylex();
   return 0;
}