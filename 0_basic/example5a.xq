xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

(: takes a list of names and returns the total of all their lengths :)

let $seq := ("James", "John", "Mary", "Martha")
let $fun := function($accumulator, $name ) as xs:string {$name || " " || $accumulator}
return fold-right($seq, (), $fun)