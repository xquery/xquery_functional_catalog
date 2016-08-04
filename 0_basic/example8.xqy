xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

(: applies a function to pairs of items in sequences :)

let $seq1 := ("James", "John", "Mary", "Martha")
let $seq2 := ("tall", "short", "tall", "short")

let $fun := function($a as xs:string, $b as xs:string) {fn:concat($a, " is ", $b, "
")}
return for-each-pair($seq1, $seq2, $fun)