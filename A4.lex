import java_cup.runtime.*;
%%

%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%class A4Scanner
%eofval{ return null;
%eofval}
%state Comment

IDENTIFIER = [a-zA-Z][a-zA-Z0-9]*
NUMBER = [0-9]+
Float = [0-9]+(\.[0-9]+)?
QSTRING = \"[^\"]*\"

%%
<YYINITIAL>"/**" {yybegin(Comment);}
<Comment>"**/" {yybegin(YYINITIAL);}
<YYINITIAL>"+" { return new Symbol(A4Symbol.PLUS); }
<YYINITIAL>"-" { return new Symbol(A4Symbol.MINUS); }
<YYINITIAL>"*" { return new Symbol(A4Symbol.TIMES); }
<YYINITIAL>"/" { return new Symbol(A4Symbol.DIVIDE); }
<YYINITIAL>"==" { return new Symbol(A4Symbol.EQUAL); }
<YYINITIAL>"(" { return new Symbol(A4Symbol.LPAREN);}
<YYINITIAL>")" { return new Symbol(A4Symbol.RPAREN);}
<YYINITIAL>"WRITE" { return new Symbol(A4Symbol.WRITE); }
<YYINITIAL>"READ" { return new Symbol(A4Symbol.READ); }
<YYINITIAL>"IF" { return new Symbol(A4Symbol.IF); }
<YYINITIAL>"ELSE" { return new Symbol(A4Symbol.ELSE); }
<YYINITIAL>"RETURN" { return new Symbol(A4Symbol.RETURN); }
<YYINITIAL>"BEGIN" { return new Symbol(A4Symbol.BEGIN); }
<YYINITIAL>"END" { return new Symbol(A4Symbol.END); }
<YYINITIAL>"MAIN" { return new Symbol(A4Symbol.MAIN); }
<YYINITIAL>"STRING" { return new Symbol(A4Symbol.STRING); }
<YYINITIAL>"INT" { return new Symbol(A4Symbol.INT); }
<YYINITIAL>"REAL" { return new Symbol(A4Symbol.REAL); }
<YYINITIAL>"," { return new Symbol(A4Symbol.COMMA);}
<YYINITIAL>":=" { return new Symbol(A4Symbol.ASSIGN);}
<YYINITIAL>";" { return new Symbol(A4Symbol.SEMICOLON);}
<YYINITIAL>"!=" { return new Symbol(A4Symbol.NOTEQUAL);}
<YYINITIAL>{NUMBER} { return new Symbol(A4Symbol.Integer, yytext());} 
<YYINITIAL>{IDENTIFIER} {return new Symbol(A4Symbol.ID, yytext());}
<YYINITIAL>{QSTRING} {return new Symbol(A4Symbol.QSTRING, yytext());}
<YYINITIAL>{Float} {return new Symbol(A4Symbol.Float, yytext());}
<YYINITIAL>" "|\n|\r|\t {}
<YYINITIAL>. {return new Symbol(A4Symbol.error);}
\r|\n|. {}
