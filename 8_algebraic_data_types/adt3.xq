xquery version "1.0-ml";

import module namespace data="http://snelson.org.uk/functions/data" at "data.xqy";

declare variable $person := data:declare(
<Person>
  <name><data:Sequence/></name>
</Person>);

declare variable $address := data:declare(
<Address>
  <street><data:Sequence/></street>
  <city><data:Sequence/></city>
  <postcode><data:Sequence/></postcode>
</Address>);

declare variable $createPerson := function($name){
    if($name instance of xs:string) then $person[1]($name) else error()};

declare variable $createAddress := function($street,$city,$postcode){
    $address[1]($street),
    $address[2]($city),
    $address[3]($postcode)};

(: create new record from existing data definitions :)
declare variable $record := data:declare($person,$address);

declare variable $createRecord := function($name,$street,$city,$postcode){
    (
        if(fn:matches($name,"^.*[A-Z]{2}"))
            then $createPerson($name)
            else $createPerson(
                   concat(upper-case(substring($name,1,1)),
                   substring($name,2))
                 ),
        $createAddress($street,$city,$postcode))
};

let $bobby := $createRecord("bobby","54 palace gates","London","N169PR")

return (
  xdmp:describe($bobby),
  data:type($bobby),
  data:describe($bobby))