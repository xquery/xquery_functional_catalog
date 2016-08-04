xquery version "3.0";

(: easier to read map access :)

declare namespace map="http://www.w3.org/2005/xpath-functions/map";

let $data := map{"type":="error","msg":="something went wrong"}
let $data2 := map{"type":="info","msg":"all is well"}
    
let $getValue := function($property,$objects){for $object in $objects return map:get($object,$property)}

let $getType := $getValue("type", ?)

return $getType(($data,$data2)) ! ("type=" || . || "
")