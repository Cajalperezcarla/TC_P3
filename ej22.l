	//Autores: Sergio Iso NIP: 927178 ; Carla Cajal NIP: 875406 Practica: 3 - ej22.l

%{
#define YYSTYPE double
#include <stdlib.h>
#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"**"	{return(POW);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+\.[0-9]*|\.[0-9]+|[0-9]+ { yylval = atof(yytext); return(NUMBER); }
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
