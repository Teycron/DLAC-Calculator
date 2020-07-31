%option noyywrap
%{
#include <stdio.h>
#include "calc.tab.h"
#include "iostream"
#include "string"
#include "../libs/functions.h"
extern int yyerror (char const *s);
%}

DIGIT       [0-9]
NONZERO     [1-9]
ZERO        [0]
SEPARATOR   [.,]
INTEGER     {ZERO}|({NONZERO}{DIGIT}*)
FLOAT       {INTEGER}{SEPARATOR}{DIGIT}+

%%

{INTEGER}                   {
                                yylval=atoi(yytext); return INTEGER;                         
                            }
{FLOAT}                     {
                                yylval=stringToFloat(yytext); return FLOAT;                          
                            }
{ZERO}{2,}                  {
                                yyerror("More than one zero\n");
                            }    
"+"                         {
                                return PLUS;
                            }
"-"                         {
                                return MINUS;
                            }                            
"*"                         {
                                return MUL;
                            }
"/"                         {
                                return DIV;
                            }
"%"                         {
                                return MOD;
                            }
"^"                         {
                                return POW;
                            }
"prime"                         {
                                return PRIME;
                            }
"("                         {
                                return LEFT_B;
                            }
")"                         {
                                return RIGHT_B;
                            }

[ \t]+	                    { 
                                /* Do nothing at whitespace - eat it! */
                            }
[\n]			     {
				 return NL;
			     }
"E"|"e"                         {
                                printf("Exiting the calculator.\n"); 
                                return 0;    
                            }                               
.                           {
                                yyerror("Unrecognized token\n");   /* Is there anything else? Fail on it! */
                            }       
%%
