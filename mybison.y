
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


extern int line_no;
extern int yylineno;
extern FILE *yyin;								
extern FILE *yyout;								
%}

%start list
%token <intVal> INTNUM 
%token FLOATNUM 
%token VAR
%token WORD 
%token <intVal> MY_END_OF_FILE
%token DEF
%token INT
%token IF 
%token ELIF
%token ELSE
%token FOR
%token IN
%token RANGE
%token CLASS
%token FLOAT
%token CHAR
%token SPACE
%token HASHTAG
%token STRING
%token PRINT
%token LAMBDA



%left '+' '-' ')'  ':' '_'
%left '*' '/'
%right '=' ',' '(' '>' '<' '!' '^' 
%token PAR


%union{
	int intVal;
	float floatVal;
	char* strVal;
        
}

%%
list:
        /* Nothing */
        | list program
       ;


program: 	ekf 			 
		| assignment
		| parameters
		| function
                | ifstatement
                | forstatement
		| callfunction
		| createclass
                | comment
                | print
                | lambda
                | metablhtes
                |  protasi
		;

	
assignment:	VAR '=' ekf 
		|VAR
                |VAR '<' ekf
                |VAR '>' ekf
                |VAR '!' '=' ekf
                |VAR '>' '=' ekf
                |VAR '<' '=' ekf
		;
			    
ekf:  	INTNUM         
        | FLOATNUM
        | VAR     
	| ekf '+' ekf       
	| ekf '-' ekf          
	| ekf '*' ekf         
	| ekf '/' ekf       
        | '(' ekf ')'  {;}          
	;


parameters:	',' VAR parameters 
                 |  
		;

function:	DEF VAR '(' ')' ':'
		| DEF VAR'(' VAR parameters ')' ':'
                ;

callfunction:	VAR '(' ')'
		| VAR '(' VAR parameters ')'
		;

ifstatement:	IF assignment ':'
		| ELIF assignment ':'
		| ELSE ':'
		;

forstatement:	FOR VAR IN RANGE '(' ekf ')' ':'
		;

createclass:	CLASS VAR ':'
		| VAR'=' VAR '(' VAR parameters ')'
                | VAR '=' VAR '(' ')'
		;

comment:         HASHTAG  {YYACCEPT;}
                 ;

print:          PRINT '('protasi')'
		;

lambda:          LAMBDA VAR':' ekf 
		;

metablhtes:   	INT assignment 
               	|FLOAT assignment 
              	;
protasi: VAR protasi
               |
               ;

								    
%%								    
    	 

int main () 
  {	
	yyin = fopen("file.py", "r");
  	do{
	if(yyparse()) {
             printf("\nFail\n");
             exit(0);
          }
   	}while (!feof(yyin));   
	printf("No Errors Occurred!!!\n");

  	return 0;
  }   
										