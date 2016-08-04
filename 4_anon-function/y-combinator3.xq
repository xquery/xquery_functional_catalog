
xquery version "3.0";

(:~
 : Anonymous function recursion in XQuery
 : 
 : @author Adam Retter <adam.retter@googlemail.com>
 :)

let $factorialHelper := function($f, $x) {
    if($x eq 0) then
        1
    else
        $x * $f($f, $x - 1)
}

let $factorial := function($x) {
    $factorialHelper($factorialHelper, $x)
}

return

    (: Calculate the factorial of 5 :)
    $factorial(5)