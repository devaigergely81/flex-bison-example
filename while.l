%option c++ noyywrap yylineno

%{
#include <iostream>
#include <cstdlib>
#include <list>
#include "implementation.hh"
#include "while.tab.hh"

using namespace yy;
%}

%%

program                     return parser::token::PRG;
begin                       return parser::token::BEG;
end                         return parser::token::END;
boolean                     return parser::token::BOO;
natural                     return parser::token::NAT;
read                        return parser::token::REA;
write                       return parser::token::WRI;
if                          return parser::token::IF;
then                        return parser::token::THE;
else                        return parser::token::ELS;
endif                       return parser::token::EIF;
while                       return parser::token::WHI;
do                          return parser::token::DO;
done                        return parser::token::DON;
true                        return parser::token::TRU;
false                       return parser::token::FAL;
":="                        return parser::token::ASN;
"+"                         return parser::token::ADD;
"-"                         return parser::token::SUB;
"*"                         return parser::token::MUL;
"/"                         return parser::token::DIV;
"%"                         return parser::token::MOD;
"<"                         return parser::token::LS;
">"                         return parser::token::GR;
"<="                        return parser::token::LSE;
">="                        return parser::token::GRE;
"="                         return parser::token::EQ;
and                         return parser::token::AND;
or                          return parser::token::OR;
not                         return parser::token::NOT;
"("                         return parser::token::OP;
")"                         return parser::token::CL;
[a-zA-Z_][a-zA-Z0-9_]*      return parser::token::ID;
[0-9]+                      return parser::token::NUM;
[ \t\n]+                    // Whitespaces skipped.
#.*                         // Commens skipped.
.                           { std::cerr << "Line " << lineno() << ": Unexpected character: '" << YYText() << "'." << std::endl; exit(1); }
