/*
This file implements the functions necessary to prase, tokenize, and interpret a string representing
mathematical instructions given in reverse polish notation. I.e. 2 2 + is equivalent to 2 + 2 in our usual notation
The functions are as follows:
Lex: Takes a string and returns a list of strings, each of which is a token in the string
Tokenize: Takes a list of strings and returns a list of tokens, each of which is a number, operator, or command
Interpret: Takes a list of tokens and returns a list of numbers, each of which is the result of the operation
    specified by the tokens
*/



fun {Lex Input}
    {String.tokens Input & }
end

fun {Tokenize Lexeme}
    case Lexeme of Head|Tail then
        case Head of "+" then
            operator(type:plus)|{Tokenize Tail}
        [] "-" then
            operator(type:minus)|{Tokenize Tail}
        [] "*" then
            operator(type:multiply)|{Tokenize Tail}
        [] "/" then
            operator(type:divide)|{Tokenize Tail}
        [] "p" then
            command(print)|{Tokenize Tail}
        [] "d" then
            command(duplicatetop)|{Tokenize Tail}
        [] "i" then
            command(inverse)|{Tokenize Tail}
        [] "c" then
            command(clear)|{Tokenize Tail}
        else 
            number({String.toFloat Head})|{Tokenize Tail}
        end
    else
        nil
    end
end

fun {Interpret Tokens}
    fun {Interpret_ Stack Tokens}
        case Tokens of nil then
            {List.reverse Stack}
        [] number(N)|Tail then
            {Interpret_ number(N)|Stack Tail}
        [] operator(type:Op)|Tail then
            number(Num1)|number(Num2)|Rest = Stack in
            {Interpret_ {Calculate Op Num1 Num2}|Rest Tail}
        [] command(Cmd)|Tail then
            number(Top)|Rest = Stack in
            case Cmd of print then
                {System.show {List.reverse Stack}}
                {Interpret_ Stack Tail}
            [] duplicatetop then 
                {Interpret_ number(Top)|Stack Tail}
            [] inverse then
                {Interpret_ number(~Top)|Rest Tail}
            [] clear then %should clear the current values from the stack
                {Interpret_ nil Tail}
            end
        end
    end
in 
    {Interpret_ nil Tokens}
end

fun {Calculate Op Num1 Num2}
    case Op of plus then
        number(Num1 + Num2)
    [] minus then
        number(Num1 - Num2)
    [] multiply then
        number(Num1 * Num2)
    [] divide then
        number(Num1 / Num2)
    end
end