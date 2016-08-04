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

let $memoizeFunc := function ($func, $var) {
    let $key := concat("func", string($var))
    return
        if ( map:get($cache, $key) ) 
        then map:get($cache, $key)
        else
            let $result := $func($var)
            return (map:put($cache, $key, $result), 
                    $result)
}

let $factorial := local:factorial#1

let $a := $memoizeFunc($factorial, 20)
let $b := $memoizeFunc($factorial, 15)
let $c := $memoizeFunc($factorial, 12)
let $d := $memoizeFunc($factorial, 10)
let $e := $memoizeFunc($factorial, 5)
let $f := $memoizeFunc($factorial, 3)
let $g := $memoizeFunc($factorial, 1)

return $g, $cache