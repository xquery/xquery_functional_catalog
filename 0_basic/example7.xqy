xquery version "3.0";

(: https://gist.github.com/CliffordAnderson/0c45f973ef45228ab685 :)

(: applies a function to the each item in the sequence :)
(: akin to the simple map operator :)

let $seq := ("James", "John", "Mary", "Martha")
return for-each($seq, fn:upper-case#1)