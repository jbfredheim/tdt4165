functor
import
    Application(exit:Exit)
    System
define
    fun {Max X Y}
        if X < Y then
            Y
        else
            X
        end
    end

    proc {PrintGreater X Y}
        {System.showInfo {Max X Y}}
    end


{PrintGreater 10 20}


{Exit 0} end


