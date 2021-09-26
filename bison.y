%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern char* yytext();
extern int yylex();

int flag=0;

void yyerror(const char *s);
extern int count;
extern FILE *yyin;

%}

%token PROGRAM_RESW STARTMAIN ENDMAIN 

%token NAME_ID 

%token VARS INTEGER CHAR

%token IF THEN ELSE ELSEIF ENDIF

%token FUNCTION END_FUNCTION RETURN

%token FOR TO STEP ENDFOR

%token LESS_EQUAL GREATER_EQUAL EQUAL NOT_EQUAL

%token PRINT BREAK

%token SWITCH CASE ENDSWITCH DEFAULT

%token WHILE ENDWHILE 

%token INT_NUM CHARACTERS

%token STRUCT TYPEDEF ENDSTRUCT

%token AND OR


%%
program_p: 		PROGRAM_RESW NAME_ID declare_program main_program ;

declare_program:		| declare_functions 
			| declare_struct 
			| struct_set declare_functions  ;

declare_functions: 	function_set | 
			declare_functions function_set;

function_set: 		FUNCTION function_id declare_vars entoli_kanonwn return_rule END_FUNCTION;

return_rule: 		RETURN expression;

function_id:		NAME_ID '(' ')' 
			| NAME_ID '(' multi_ids ')' ;

multi_ids: 	id_names_arr | multi_ids ',' id_names_arr ;
id_names_arr:		NAME_ID | NAME_ID '[' INT_NUM ']';
							
declare_vars: 	| VARS vars ;
vars: 			var_m |vars var_m;
var_m: 	 		data_type multi_ids ';' ;

declare_struct:		struct_set 
			| declare_struct struct_set;

struct_set: 		STRUCT NAME_ID declare_vars ENDSTRUCT ';' |
			TYPEDEF STRUCT NAME_ID declare_vars ENDSTRUCT ';' ;

data_type:	INTEGER | CHAR  ;
 
main_program: 		STARTMAIN declare_vars entoli_kanonwn ENDMAIN ;

entoli_kanonwn:		commands | entoli_kanonwn commands;

commands:		register
			| if 
			| switch
			| while
			| for
			| print  
			| BREAK;


register: 		NAME_ID '=' expression ';' ;


if: 			if_main ENDIF |	if_main one_many_else ENDIF;

one_many_else:		one_many_elseif else | else;

if_main: 		IF '(' condition_check ')'  THEN entoli_kanonwn;

one_many_elseif: 		ELSEIF '(' condition_check ')' entoli_kanonwn 
			| ELSEIF '(' condition_check ')' entoli_kanonwn one_many_elseif;
			
else:				ELSE entoli_kanonwn; 


switch: 		SWITCH '(' expression ')' multi_case default ENDSWITCH ;
multi_case:		entoli_case | multi_case entoli_case; 	
default:		| DEFAULT entoli_kanonwn;
entoli_case:		CASE '(' expression ')' entoli_kanonwn;


while: 		WHILE '(' condition_check ')' entoli_kanonwn ENDWHILE;

for: 			FOR NAME_ID ':' '=' INT_NUM TO INT_NUM STEP INT_NUM entoli_kanonwn ENDFOR;

		
print: 		PRINT '(' CHARACTERS ',' expression2 ')'';' | PRINT '(' CHARACTERS ')'';';
		

condition_check: 		expression operator_for_conditions expression 
			| condition_check AND condition_check 
			| condition_check OR condition_check ;

operator_for_conditions:	'>' | '<' |  EQUAL | NOT_EQUAL| GREATER_EQUAL |LESS_EQUAL;

expression: 			metavlites_gia_expression | expression num_oper expression | '(' expression ')' ;
metavlites_gia_expression: 	consts_vars  | NAME_ID '(' expression2 ')';

num_oper: 		'+'|'-'|'/'|'*';

consts_vars: 		multi_ids | INT_NUM | CHARACTERS ;
expression2:		| expression | consts_vars ',' expression;


%%

void yyerror(const char *s)
{
       flag=1;
       printf("Program has an error in line: %d \n", count );
       
       exit(1);
      		
}


int main(int argc, char *argv[]){
	FILE *file;
	
	file=fopen(argv[1],"r");
	
	
	yyin = file; 
	
	yyparse();
	
	fclose(file);
	
	if(flag==0)
	{
		printf("\n\nProgram is syntactic correct \n");
	}
	return 0;
}


