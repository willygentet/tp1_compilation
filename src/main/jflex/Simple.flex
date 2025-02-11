/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;
import java.util.LinkedList;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{
%}

/* definitions regulieres */
lpar = "("
rpar = ")"
number = -?[0-9]+
plus = "+"
minus = "-"
div = "/"
mult = "*"
mod = "mod"
sep = \n|\r|\r\n
end = ";"


%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */
{sep}           { /* pas d'action */ }
{number}        { return new Symbol(SimpleParserSym.NUMBER, yyline, yycolumn, Integer.valueOf(yytext())); }
{plus}          { return new Symbol(SimpleParserSym.PLUS, yyline, yycolumn); }
{minus}         { return new Symbol(SimpleParserSym.MINUS, yyline, yycolumn); }
{div}           { return new Symbol(SimpleParserSym.DIV, yyline, yycolumn); }
{mult}          { return new Symbol(SimpleParserSym.MULT, yyline, yycolumn); }
{mod}           { return new Symbol(SimpleParserSym.MOD, yyline, yycolumn); }
{lpar}          { return new Symbol(SimpleParserSym.LPAR, yyline, yycolumn); }
{rpar}          { return new Symbol(SimpleParserSym.RPAR, yyline, yycolumn); }
{end}           { return new Symbol(SimpleParserSym.END, yyline, yycolumn); }
.               { ; /* on ne fait rien */ }

