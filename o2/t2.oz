fun {ExpressionTree Tokens}
    {ExpressionTreeInternal Tokens nil}
end

fun {ExpressionTreeInternal Tokens ExpressionStack} 
    case Tokens of nil then 
        FinalExp|nil = ExpressionStack in
        FinalExp
    [] number(N)|Tail then 
        {ExpressionTreeInternal Tail N|ExpressionStack}
    [] operator(type:Op)|Tail then
        Num1|Num2|Rest = ExpressionStack in 
        {ExpressionTreeInternal Tail {Stringify Op Num1 Num2}|Rest}
    end
end

fun {Stringify Operation A B}
    case Operation of plus then 
        "plus(" # A # " " # B # ")" 
    [] minus then
        "minus(" # A # " " # B # ")"
    [] divide then
        "divide(" # A # " " # B # ")"
    [] multiply then 
        "multiply(" # A # " " # B # ")"
    end
end