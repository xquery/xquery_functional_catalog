xquery version "3.0";

declare function local:countdown($c){
    if($c eq 0) 
    then () 
    else ($c, local:countdown($c - 1))
};

local:countdown(20)