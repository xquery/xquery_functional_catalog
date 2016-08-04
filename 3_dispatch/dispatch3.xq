xquery version "3.0";

declare namespace map="http://www.w3.org/2005/xpath-functions/map";

let $process := function($calcs,$dispatch){
  map:get($dispatch,$calcs[1])($calcs[2],$calcs[3]) 
}

let $plus := function($a,$b){$a + $b}
let $minus := function($a,$b){$a - $b}
let $divide := function($a,$b){$a / $b}
let $multiply := function($a,$b){$a * $b}
let $number := function($a){$a}

let $dispatch := map{
                "plus":= $plus,
                "minus":= $minus,
                "multiply":= $multiply,
                "divide":= $divide}

let $calcs := ("plus",2 ,3)

return $process($calcs,$dispatch)