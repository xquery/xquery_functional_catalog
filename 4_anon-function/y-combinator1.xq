xquery version "3.0";

import module namespace f = "http://snelson.org.uk/functions/functional" 
    at "functionalxq/functional.xq";

declare namespace map="http://www.w3.org/2005/xpath-functions/map";

declare function local:countdown($c){
    if($c eq 0) 
    then () 
    else ($c, local:countdown($c - 1))
};

local:countdown(20)






























(: let $myCountDown := function($c){if($c eq 0) then () else ($c, $myCountDown($c - 1)) } 
return
:)
