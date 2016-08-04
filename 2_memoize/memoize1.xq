xquery version "1.0-ml";

(: memoize :)

declare variable $cache := map:map();

declare function local:factorial($n as xs:integer) as xs:integer {
    if ($n < 0)
    then 0
    else
        if ($n = 0)
        then 1
        else $n * local:factorial($n - 1)
};


let $a := local:factorial(1)
let $b := local:factorial(3)
let $c := local:factorial(5)
let $d := local:factorial(10)
let $e := local:factorial(12)
let $f := local:factorial(15)
let $g := local:factorial(20)

return $g