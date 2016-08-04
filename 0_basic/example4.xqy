xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

(: a higher-order function; accepts a function as an argument :)
let $fun := function($oper as function(xs:decimal*) as xs:decimal, $a as xs:decimal, $b as xs:decimal) as xs:decimal  {$oper(($a, $b))}
 
(: lambda expression or anonymous function declaration :)
let $add := function($a as xs:decimal*) as xs:decimal {$a[1] + $a[2]}
let $sub := function($a as xs:decimal*) as xs:decimal {$a[1] - $a[2]}
 
(: partial functional application; returns a function as its value :)
let $fun-add := $fun($add, ?, ?)
let $fun-sub := $fun($sub, ?, ?)
 
return ($fun-add(1,5), $fun-sub(1,5))