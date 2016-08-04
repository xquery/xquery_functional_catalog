xquery version "3.0";

import module namespace f = "http://snelson.org.uk/functions/functional" 
    at "functionalxq/functional.xq";

let $source := (1,2,3,4.7)
let $c := f:compose( (number#1, round#1 ))
return fold-left($source,(),$c)