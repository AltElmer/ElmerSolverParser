grammar ElmerSolver;

// options { language = Python3; }

// Parser Rules

statement: EndOfStatment;

statement_list: statement+;

// section: SectionName statement_list End;

section:
	'Header' statement_list End
	| 'Simulation' statement_list End
	| 'Constants' statement_list End
	| 'Body ' Integer statement_list End
	| 'Material ' Integer statement_list End
	| 'Body Force ' Integer statement_list End
	| 'Equation ' Integer statement_list End
	| 'Solver ' Integer statement_list End
	| 'Boundary Condition ' Integer statement_list End
	| 'Initial Condition ' Integer statement_list End
	| 'Component' Integer statement_list End;

sections: section+ EOF;

// Lexer Rules

fragment DIGIT: [0-9];
Integer: DIGIT+;

Float:
	[+-]? (DIGIT+ ([.]DIGIT*)? | [.]DIGIT+) ([Ee][+-]? DIGIT+)?;

End: 'End';

// statementEnd: ';' NewLine*;

NewLine: ('\r'? '\n' | '\n' | '\r') -> skip;

EndOfStatment: ';' | NewLine;

LineJoining:
	'\\' WhiteSpace? ('\r'? '\n' | '\r' | '\f') -> skip;

WhiteSpace: [ \t\r\n]+ -> skip;

LineComment: '#' ~( '\r' | '\n')* -> skip;

