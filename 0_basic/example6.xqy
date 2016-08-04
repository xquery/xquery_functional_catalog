xquery version "3.0";
 
(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

(: takes a list of integers and returns the sum using fold-right :)
 
let $seq := (1,2,3,4)
let $fun := function($x as xs:integer, $accumulator as xs:integer) as xs:integer {($x * $x) + $accumulator}
return fold-right($seq, 0, $fun)

