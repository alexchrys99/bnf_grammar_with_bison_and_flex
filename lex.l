%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bison.tab.h"

int count=1;	
void handle_comments();
%}
%option noyywrap 

%%
[ \t]		{ }
[\n]		{count++; }


"STARTMAIN" 	{ return STARTMAIN; }
"ENDMAIN" 	{ return ENDMAIN; }
"RETURN"	{ return RETURN; }
"FUNCTION" 	{ return FUNCTION; }
"END_FUNCTION" { return END_FUNCTION; }


"PROGRAM" 	{ return PROGRAM_RESW; }


"TO"		{ return TO; }
"FOR"		{ return FOR; }
"ENDFOR"	{ return ENDFOR; }
"STEP"		{ return STEP; }

"INTEGER"	{ return INTEGER; }
"VARS"		{ return VARS; }
"CHAR"		{ return CHAR; }

"IF"		{return IF;}
"THEN"		{ return THEN; }
"ELSEIF"	{return ELSEIF; }
"ELSE"		{return ELSE; }
"ENDIF"		{return ENDIF;}

"WHILE"	{ return WHILE; }
"ENDWHILE"	{ return ENDWHILE; }

"OR"		{ return OR; }
"AND"		{ return AND; }


"CASE"		{return CASE; }
"SWITCH"	{return SWITCH; }
"ENDSWITCH"	{return ENDSWITCH; }
"DEFAULT"	{return DEFAULT; }

"TYPEDEF"	{return TYPEDEF;}
"STRUCT"	{return STRUCT;}
"ENDSTRUCT"	{return ENDSTRUCT;}

"PRINT"		{return PRINT;}
"BREAK"		{return BREAK;}


"=="		{return EQUAL;}
"!="		{return NOT_EQUAL;}
"<="		{return GREATER_EQUAL;}
">="		{return LESS_EQUAL;}

"!"		{return '!';}
"]"		{ return ']';}
"["		{ return '[';}
"("		{ return '(';}
")"		{ return ')';}
","		{return ',';}
"%"		{return '%';}
"+"		{return '+';}
"-"		{return '-';}
">"		{return '>';}
"<"		{return '<';}
"="		{return '=';}
"*"		{ return '*';}
"^"		{return '^';}
"/"		{return '/';}
";"		{ return ';';}


\"[^\n]*\"	{return CHARACTERS;}
[0-9]+		{return INT_NUM;}

([a-zA-Z_])([a-zA-Z_]|[0-9])* {return NAME_ID;}


"/*"           { handle_comments(); }
%%

void handle_comments()
{
   char a;
   
   for (;;)
   {   
	  while((a=input())!='*' && a!=EOF)
	  {
			if (a=='\n') 
				count++;
	  }	 
	   
       a=input();	
     
       if (a=='/' || a==EOF) 
			break;

    }  

}

