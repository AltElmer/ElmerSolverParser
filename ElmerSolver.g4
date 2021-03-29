grammar ElmerSolver;

// Options

// Parser Rules

statement:;

statement_list: statement | statement_list statement;

section: SectionName statement_list End;

// Lexer Rules

Integer: [0-9]+;

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

WhiteSpace: [ \t\r\n]+ -> skip;

LineComment: '#' ~( '\r' | '\n')* -> skip;