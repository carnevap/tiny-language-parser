java JLex.Main A4.lex
java java_cup.Main -parser A4Parser -symbols A4Symbol A4.cup
javac A4.lex.java
javac A4Parser.java A4Symbol.java A4ParserUser.java
java A4ParserUser