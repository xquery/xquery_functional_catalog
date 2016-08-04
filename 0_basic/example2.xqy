xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

declare namespace math = "http://www.w3.org/2005/xpath-functions/math";

(: assigns a built-in math function to a variable (see http://docs.basex.org/wiki/XQuery_3.0); :)
(: the number after the pound symbol indicates its arity (i.e., the number of arguments it accepts :)
let $pow := math:pow#2

(: partial function application; returns a function as its value :) 
let $pow2 := $pow(?, 2)
return $pow2(2)