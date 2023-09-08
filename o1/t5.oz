functor
import
    Application(exit:Exit)
    System
define
    local 
        A C D 
        Pi = 355.0/113.0
    in
            proc {Circle R} 
                A = Pi * R * R
                D = 2.0 * R
                C = Pi * D
                {System.showInfo "Circumference "#C}
                {System.showInfo "Area "#A}
                {System.showInfo "Diameter "#D}
            end
    end
    {System.showInfo "Task 5, calculate sizes for circle with R=5"}
    {Circle 5.0}
{Exit 0} end
