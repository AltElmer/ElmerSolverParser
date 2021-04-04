grammar ElmerSolver;

options {
	language = Python3;
}

// Parser Rules

// eostmt: ';' | CR;

statement:;

// statement_list: statement | statement_list statement;

// section: SectionName statement_list End;

// Lexer Rules

fragment Integer: [0-9]+;

Float:
	Integer
	| [+-]? ([0-9]+ ([.][0-9]*)? | [.][0-9]+) (
		[Ee][+-]? Integer
	)?;

SectionName:
	'Header'
	| 'Simulation'
	| 'Constants'
	| 'Body ' Integer
	| 'Material ' Integer
	| 'Body Force ' Integer
	| 'Equation ' Integer
	| 'Solver ' Integer
	| 'Boundary Condition ' Integer
	| 'Initial Condition ' Integer
	| 'Component' Integer;

End: 'End';

StatementEnd: ';' NewLine* | NewLine+;

fragment NewLine: '\r' '\n' | '\n' | '\r';

LineJoining:
	'\\' WhiteSpace? ('\r'? '\n' | '\r' | '\f') -> skip;

WhiteSpace: [ \t\r\n]+ -> skip;

LineComment: '#' ~( '\r' | '\n')* -> skip;