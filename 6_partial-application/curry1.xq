xquery version "3.0";

import module namespace func = "http://snelson.org.uk/functions/functional" 
    at "functionalxq/functional.xq";

let $f := func:curry(concat#5)

let $myConcat := $f("my ")
let $myConcat := $myConcat("dog ")
let $myConcat := $myConcat("geo ")
let $myConcat := $myConcat("is ")
let $myConcat := $myConcat("cute ")

return $myConcat