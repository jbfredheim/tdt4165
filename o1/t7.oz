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
{System.showInfo "Length of list [1 2 3 4 5] is "#{Length [1 2 3 4 5]}}
{Exit 0} end
