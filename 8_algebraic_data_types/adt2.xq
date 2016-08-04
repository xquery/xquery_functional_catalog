xquery version "1.0-ml";

import module namespace data="http://snelson.org.uk/functions/data" at "data.xqy";

declare variable $address := data:declare(
<Address>
  <street><data:Sequence/></street>
  <city><data:Sequence/></city>
  <postcode><data:Sequence/></postcode>
</Address>);

declare variable $createAddress := function($street,$city,$postcode){
    $address[1]($street),
    $address[2]($city),
    $address[3]($postcode)};

let $myaddr := $createAddress("54 palace gates","London","N169PR")

return (
  data:type($myaddr),
  data:describe($myaddr))
