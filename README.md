# ElmerSolverParser
A new parser for ElmerSolver .sif input files


## Compiling:

- `export CLASSPATH=".:/usr/local/Cellar/antlr/<version>/antlr-<version>-complete.jar:$CLASSPATH"`

    - `export CLASSPATH=".:/usr/local/Cellar/antlr/4.9.2/antlr-4.9.2-complete.jar:$CLASSPATH"`

- `antlr ElmerSolver.g4`
- `javac ElmerSolver*.java`
- `grun ElmerSolver tokens -tokens  < examples/ex001.sif`