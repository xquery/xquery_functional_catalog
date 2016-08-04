xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

declare namespace math = "http://www.w3.org/2005/xpath-functions/math";

(: a higher-order function that returns a function as its value :)
declare function local:pow($i as xs:integer) as function(*)
{
  function($a as xs:integer) {math:pow($a, $i)}
};

let $pow2 := local:pow(3)
return $pow2(5)