%{
#include <string.h>
#include <stdlib.h>
#include "y.tab.h"
void extern yyerror(char*);
void InvalidToken();

static int eof_reached = 0;
%}


%option yylineno
%option case-sensitive

digit   	[0-9]
int		[0-9]+
float		[0-9]+\.[0-9]+
alpha		[a-zA-Z]
word		{alpha}+
variable	({word}|"_")+({word}|"_"|{int})*
whitespace      	[ \t\r\v\f]



%%
"def"		{ return (DEF); }
"int"  		{ return (INT); }
"float" 	{ return (FLOAT); }
"char"  	{ return (CHAR); }
"if"		{ return (IF); }
"elif"		{ return (ELIF); }
"else"		{ return (ELSE); }
"for"		{ return (FOR); }
"in"		{ return (IN); }
"range"		{ return (RANGE); }
"class"		{ return (CLASS); }
"print"         {return (PRINT); }
"lambda"         {return(LAMBDA);}
{int} 		{ yylval.intVal=atoi(yytext); return (INTNUM); }
{float}		{ yylval.floatVal=atof(yytext); return (FLOATNUM); }

{variable}	{ yylval.strVal=strdup(yytext); return (VAR); }
"#"		{ return (HASHTAG); }
","		{ return ','; }
"+"		{ return '+'; }
"-"        	{ return '-'; }
"*"		{ return '*'; }
"/"		{ return '/'; }
"="		{ return '='; }
"!"		{ return '!'; }
"<"		{ return '<'; }
">"		{ return '>'; }
"("		{ return '('; }
")"		{ return ')'; }
":"		{ return ':'; }
 {whitespace}	;
\n		{yylineno++;}
\"(.)*\" {yylval.strVal=strdup(yytext); return STRING;}

.      		{InvalidToken();}


%%
int yywrap(){
return 1;
}

void yyerror(char *s) {
    fprintf(stderr, "\nERROR ON LINE %d : \n %s\n", yylineno
,s);
    exit(0);
}

void InvalidToken(){
    printf("ERROR ON LINE %d : \n Invalid Token %s\n", yylineno,yytext);
    exit(0);
}