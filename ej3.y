	//Autores: Sergio Iso NIP: 927178 ; Carla Cajal NIP: 875406 Practica: 3 - ej3.y
%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyerror(char* s);
%}
%token X Y Z EOL
%start entrada
%%

entrada : 
		| entrada S EOL
		;
S 	: C X S
	| /*EPSILON*/
	;
B	: X C Y Z Y
	| X C 
	;
C 	: X B X 
	| Z
	;


%%
int yyerror(char* s) {
   printf("%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

