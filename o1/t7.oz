functor
import
    Application(exit:Exit)
    System
define
    fun {Length List} N in
        if List.2 == nil then 
            N = 1
        else
            N = 1 + {Length List.2}
        end
        N
    end
    fun {Take List Count} 
        % Prints debug info
        %{System.printInfo "In take, List="}
        %{Print List}
        %{System.showInfo "Count= "#Count}
        
        if Count >= {Length List} then
            List 
        else
            if Count == 1 then
                [List.1]
            else
                {Append [List.1] {Take List.2 Count-1}}
            end
        end
    end
    fun {Drop List Count}
        if Count >= {Length List} then
            nil
        else
            if Count == 0 then
                List
            else
                {Drop List.2 Count-1}
            end
        end
    end
    fun {Append List1 List2}
        if {Length List1} == 0 then
            List2
        else
            case List1 of Head|Tail then
                Head|{Append Tail List2}
            else
                nil
            end
        end
    end
    proc {Print List} 
        if List == nil then
            {System.showInfo "nil"}
        else
            if List.2 == nil then
                {System.showInfo List.1}
            else
                {System.printInfo List.1#" "}
                {Print List.2}
            end
        end
    end
{System.showInfo "A) Length of list [1 2 3 4 5] is "#{Length [1 2 3 4 5]}}
{System.printInfo "B) Take 6 elementents of list is "}{Print {Take [1 2 3 4 5] 6}}
{System.printInfo "B) Take 3 elementents of list is "}{Print {Take [1 2 3 4 5] 3}}
{System.printInfo "C) Drop 4 first elements of list [1 2 3 4 5] = "}{Print {Drop [1 2 3 4 5] 4}}
{System.printInfo "C) Drop 2 first elements of list [1 2 3 4 5] = "}{Print {Drop [1 2 3 4 5] 2}}
{System.printInfo "C) Drop 6 first elements of list [1 2 3 4 5] = "}{Print {Drop [1 2 3 4 5] 6}}
%{System.printInfo "D) Append list [1 2] to list [3 4] "}{System.show {Append [3 4] [1 2]}}

{Exit 0} end
