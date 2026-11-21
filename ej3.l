	//Autores: Sergio Iso NIP: 927178 ; Carla Cajal NIP: 875406 Practica: 3 - ej3.l

%{
#include "y.tab.h"
%}
%%
"x"	{return(X);}
"y"	{return(Y);}
"z"	{return(Z);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
