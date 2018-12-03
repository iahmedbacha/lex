/*** Definition section ***/

%{
#include <stdlib.h>
int k;
%}

/* This tells flex to read only one input file */
%option noyywrap

%%

a	{printf("0");}
b	{printf("01");}
c	{printf("11");}
.

%%
/*** C Code section ***/

int main(void)
{
   /* Call the lexer, then quit. */
   yylex();
   return 0;
}