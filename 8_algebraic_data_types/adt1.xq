xquery version "1.0-ml";

(: the closed world :)

import module namespace data="http://snelson.org.uk/functions/data" at "data.xqy";

(: define adt :)
declare variable $person := data:declare(
<Person>
  <firstname><data:Sequence/></firstname>
  <lastname><data:Sequence/></lastname>
</Person>);

(: constructor :)
declare variable $createPerson := function($firstname,$lastname){
    if($firstname instance of xs:string) 
    then ($person[1]($firstname),
          $person[2]($lastname)) 
    else error()};

let $gabi := $createPerson("Gabriela","Fuller")

return (
  data:type($gabi),
  data:describe($gabi))
