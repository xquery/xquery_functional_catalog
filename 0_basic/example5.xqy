xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

(: takes a list of names and returns the total of all their lengths :)

let $seq := ("James", "John", "Mary", "Martha")
let $fun := function($accumulator as xs:integer, $name as xs:string) as xs:integer {fn:string-length($name) + $accumulator}
return fold-left($seq, 0, $fun)