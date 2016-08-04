xquery version "3.0";

import module namespace f = "http://snelson.org.uk/functions/functional" 
    at "functionalxq/functional.xq";

declare namespace map="http://www.w3.org/2005/xpath-functions/map";

let $add := function ($a,$b){$a+$b}
let $subtract := function($a,$b){$a - $b}

let $c1 := f:compose($subtract(?,5), round#1, $add)

return $c1(5.7,4)
