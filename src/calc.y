%code requires{
    #define YYSTYPE float
}

%{ 
   /* Definition section */
  #include <math.h>
  #include <stdio.h>
  #include "iostream"
  #include "../libs/functions.h"

  using namespace std;

  extern FILE * yyin;
  extern int yylex (void);
  void yyerror (char const *s);
%} 

%token INTEGER FLOAT
%token PLUS MINUS
%token MUL DIV MOD
%token POW
%token PRIME
%token LEFT_B RIGHT_B
%token NL

%start line
%% 

line:
   line result NL |
   result NL
   ;

result: 
   expr {cout << "Result: "<< $1 << endl;}
   ;

expr:   
    term1 |
    expr PLUS term1 { $$ = $1 + $3; }; |
    expr MINUS term1 { $$ = $1 - $3; };
    ;

term1:  
    term2 |
    term1 MUL term2 { $$ = $1 * $3; }; |
    term1 DIV term2 { $$ = $1 / $3; }; |
    term1 MOD term2 { $$ = (int)$1 % (int)$3; };
    ;
    
term2:  
    factor |
    term2 POW factor { $$ = pow($1, $3); };
    ;

factor:
    factor1 |
    LEFT_B expr RIGHT_B { $$ = $2; };
    ;

factor1:
    positive | 
    negative | 
    prime
    ;

prime: 
    PRIME LEFT_B INTEGER RIGHT_B { $$ = prime($3); };
    ;

positive:
    INTEGER { $$ = $1; }; |
    FLOAT { $$ = $1; };
    ;

negative:
    MINUS positive { $$ = -$2; };
    ;
%% 

//driver code 
void  yyerror(char const *s) {
  printf("\n%s\n", s);
  exit(100);
}

int main(int argc, char** argv)
  {
    ++argv, --argc;
    if(argc > 0){

      if( !(yyin = fopen(argv[0],"r")) ){
       exit(255);
     }
    }else{
    }

    yyparse();

    return 0;
  }
