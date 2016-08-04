xquery version "3.0";
 
let $y := function($le) {
   function($f) { 
		 $f($f) 
	}()
}
 
let $myConcat := $y(concat#2)

return $myConcat("test")