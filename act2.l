/*** Definition section ***/

%{
#include <stdlib.h>
int k;
%}

/* This tells flex to read only one input file */
%option noyywrap

lettre ([a-z]|[A-Z])
L0 (lettre^[aie])
La (lettre^[ei])
Li (lettre^[ae])
Le (lettre^[ai])

%%

{L0}*a{La}*	{printf("reconnu dans final S_a\n");}
({L0}*a{La}*i{Li}*)|({L0}*i{Li}*)	{printf("reconnu dans final S_i\n");}
({L0}*e{Le}*)|({L0}*a{La}*e{Le}*)|({L0}*a{La}*i{Li}*e{Le}*)	{printf("reconnu dans final S_e\n");}
.

%%
/*** C Code section ***/

int main(void)
{
   /* Call the lexer, then quit. */
   yylex();
   return 0;
}
