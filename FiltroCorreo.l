%{
#include <stdio.h>
%}

%%
[a-zA-Z._%+-][a-zA-Z0-9._%+-]*@(gmail\.com|hotmail\.com|[a-zA-Z0-9._%+-]+(\.mx|\.com)) { 
    if (strstr(yytext, ".mx") && strstr(yytext, ".com")) {
        printf("Error: No se aceptan ambos dominios .mx y .com juntos: %s\n", yytext);
    } else {
        printf("Correo electronico valido: %s\n", yytext);
    }
}
[-a-zA-Z0-9_]+
.                        { printf("Caracter no reconocido: %s\n", yytext); }
\n                       
%%

int main() {
    yylex();
    return 0;
}
