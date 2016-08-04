xquery version "3.0";

import module namespace f = "http://snelson.org.uk/functions/functional" 
    at "functionalxq/functional.xq";

let $add := function ($a,$b){$a+$b}
let $c1 := f:compose(round#1, $add)

return $c1(5.7,4)
