xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

let $seq := 1 to 10
let $fun := function($a as xs:integer) as xs:boolean {$a gt 4} 
return filter($seq, $fun)