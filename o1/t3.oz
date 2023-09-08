functor
import
    Application(exit:Exit)
    System
define
    local X Y Z in
        {System.showInfo "A)"}
        Y = 300
        Z = 30
        X = Y*Z
        {System.showInfo X}
    end
    local X in
        {System.showInfo "B)"}
        X = "This is a string"
        thread {System.showInfo Y} end
        Y = X
    end
{Exit 0} end
