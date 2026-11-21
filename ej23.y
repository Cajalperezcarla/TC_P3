	//Autores: Sergio Iso NIP: 927178 ; Carla Cajal NIP: 875406 Practica: 3 - ej23.y
%{
#define YYSTYPE double
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
extern int yyerror(char* s);
%}
%token NUMBER EOL CP OP POW OB CB
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
	| calclist exp EOL { printf("=%f\n", $2); }
	;
	
exp : 	factor 
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	;
	
factor : 	factor MUL pot { $$ = $1 * $3; }
		| factor DIV pot { $$ = $1 / $3; }
		| pot
		;
		
pot : factorsimple POW pot { $$ = pow($1, $3);}
	| factorsimple
	;
	
factorsimple : 	OP exp CP { $$ = $2; }
		|	OB exp CB	{$$ = fabs($2);}
		| NUMBER 
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

