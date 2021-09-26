/* A Bison parser, made by GNU Bison 3.7.6.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_BISON_TAB_H_INCLUDED
# define YY_YY_BISON_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PROGRAM_RESW = 258,            /* PROGRAM_RESW  */
    STARTMAIN = 259,               /* STARTMAIN  */
    ENDMAIN = 260,                 /* ENDMAIN  */
    NAME_ID = 261,                 /* NAME_ID  */
    VARS = 262,                    /* VARS  */
    INTEGER = 263,                 /* INTEGER  */
    CHAR = 264,                    /* CHAR  */
    IF = 265,                      /* IF  */
    THEN = 266,                    /* THEN  */
    ELSE = 267,                    /* ELSE  */
    ELSEIF = 268,                  /* ELSEIF  */
    ENDIF = 269,                   /* ENDIF  */
    FUNCTION = 270,                /* FUNCTION  */
    END_FUNCTION = 271,            /* END_FUNCTION  */
    RETURN = 272,                  /* RETURN  */
    FOR = 273,                     /* FOR  */
    TO = 274,                      /* TO  */
    STEP = 275,                    /* STEP  */
    ENDFOR = 276,                  /* ENDFOR  */
    LESS_EQUAL = 277,              /* LESS_EQUAL  */
    GREATER_EQUAL = 278,           /* GREATER_EQUAL  */
    EQUAL = 279,                   /* EQUAL  */
    NOT_EQUAL = 280,               /* NOT_EQUAL  */
    PRINT = 281,                   /* PRINT  */
    BREAK = 282,                   /* BREAK  */
    SWITCH = 283,                  /* SWITCH  */
    CASE = 284,                    /* CASE  */
    ENDSWITCH = 285,               /* ENDSWITCH  */
    DEFAULT = 286,                 /* DEFAULT  */
    WHILE = 287,                   /* WHILE  */
    ENDWHILE = 288,                /* ENDWHILE  */
    INT_NUM = 289,                 /* INT_NUM  */
    CHARACTERS = 290,              /* CHARACTERS  */
    STRUCT = 291,                  /* STRUCT  */
    TYPEDEF = 292,                 /* TYPEDEF  */
    ENDSTRUCT = 293,               /* ENDSTRUCT  */
    AND = 294,                     /* AND  */
    OR = 295                       /* OR  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_BISON_TAB_H_INCLUDED  */
