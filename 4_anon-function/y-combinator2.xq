xquery version "3.0";
 
let $makeFactorialFunc := function($givenFactFunc) {
    let $fact := function($n) {
        if( $n lt 2 )
        then 1
        else $n * $givenFactFunc($n - 1)}
    return $fact
}
 
let $y := function($le) {
   function($f) { 
		 $f($f) 
	}( 

function($f) {
		  $le(
			function($x) {  ($f($f))($x) })}

)
}
 
let $factorial := $y($makeFactorialFunc)

return $factorial(5)