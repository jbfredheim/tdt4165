functor
import
    Application(exit:Exit)
    System
define
    fun {Factorial N}
        if N == 0 then
            1
        else
            N*{Factorial N-1}
        end
    end
{System.showInfo "The factorial of 6 is "#{Factorial 6}}
{Exit 0} end

