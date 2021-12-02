/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTNUM = 258,
    FLOATNUM = 259,
    VAR = 260,
    WORD = 261,
    MY_END_OF_FILE = 262,
    DEF = 263,
    INT = 264,
    IF = 265,
    ELIF = 266,
    ELSE = 267,
    FOR = 268,
    IN = 269,
    RANGE = 270,
    CLASS = 271,
    FLOAT = 272,
    CHAR = 273,
    SPACE = 274,
    HASHTAG = 275,
    STRING = 276,
    PRINT = 277,
    LAMBDA = 278,
    PAR = 279
  };
#endif
/* Tokens.  */
#define INTNUM 258
#define FLOATNUM 259
#define VAR 260
#define WORD 261
#define MY_END_OF_FILE 262
#define DEF 263
#define INT 264
#define IF 265
#define ELIF 266
#define ELSE 267
#define FOR 268
#define IN 269
#define RANGE 270
#define CLASS 271
#define FLOAT 272
#define CHAR 273
#define SPACE 274
#define HASHTAG 275
#define STRING 276
#define PRINT 277
#define LAMBDA 278
#define PAR 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 45 "mybison.y" /* yacc.c:1909  */

	int intVal;
	float floatVal;
	char* strVal;
        

#line 109 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
