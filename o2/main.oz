functor
import
    Application(exit:Exit)
    System
define
    \insert t1.oz
    \insert t2.oz
    
    {System.showInfo "1a: Split string into elements: 1 2 + 3 * "}{System.show {Lex "1 2 + 3 *"}} 
    {System.showInfo "\n1b: Tokenize elements from previous task :1 2 + 3 * as tokens:"}{System.show {Tokenize {Lex "1 2 + 3 *"}}}
    {System.showInfo "\n1c Tokenize and interpret : 1 2 3 +"}{System.show {Interpret {Tokenize {Lex "1 2 3 +"}}}}
    {System.showInfo "\n1d Process '1 2 p 3 +', should print 1 2 whilst processing"}{System.show {Interpret {Tokenize {Lex "1 2 p 3 +"}}}} 
    {System.showInfo "\n1e Process '1 2 3 + d', should duplicate element at top of stack"}{System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}}
    {System.showInfo "\n1f Process '3 2 * i', should multiply end result by -1"}{System.show {Interpret {Tokenize {Lex "3 2 * i"}}}}
    {System.showInfo "\n1g Process '1 2 p c 2 4 +', should clear the number 1 & 2, before calculating 2 + 4 and outputting 6"}{System.show {Interpret {Tokenize {Lex "1 2 p c 2 4 +"}}}}

    {System.showInfo "2: Convert the RPN string '3 10 9 * - 7 +' to infix like notation"}{System.showInfo {ExpressionTree {Tokenize {Lex "3 10 9 * - 7 +"}}}}

    %Theory questions:
    %3A: 
    % The grammar in the reverse polish notation is as follows:
        % A valid expression is either a number or an expression followed by an expression followed by an operator.
        % <expr> ::= <num> | <expr> <expr> <op> 
        % An operator is either +, -, * or /
        % <op> ::= + | - | * | /
        % A number is either 0, 1, 2, 3, 4, 5, 6, 7, 8 or 9
        % <num> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
    %3B:
    % The grammar returned by the ExpressionTree in (E)BNF:
        % <expr> ::= num | op(expr, expr)
        % <op> ::= + | - | * | /
        % <num> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
    %3C:
    % The grammar in 3A is defined by a number of legal expressions consisting of numbers, operators or other expressions.
    % The definition of expressions allows for recursion, though care must be taken to ensure the bottom level expressions are pure numbers.
    
    % The grammar in 3B is also defined by a number of legal terminal numbers or operators, from which we can generate expressions.
    % These expressions also allow for recursion, again with the constraint that the bottom level requires two numeric expressions as "input"

    {Exit 0} 
end


