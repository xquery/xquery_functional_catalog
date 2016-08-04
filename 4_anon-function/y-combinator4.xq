xquery version "3.0";

(: make an anonymous function recursive with Y-combinator :)

import module namespace f = "http://snelson.org.uk/functions/functional" 
    at "functionalxq/functional.xq";

let $countdown := f:Y(
    function($f, $c) { if($c eq 0) then () else ($c, $f($c - 1)) }
)

return $countdown(20)