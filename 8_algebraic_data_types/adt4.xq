xquery version "1.0-ml";

(: structural data matching :)

import module namespace data="http://snelson.org.uk/functions/data" at "data.xqy";

(: define adt:)
declare variable $tree := data:declare(
<Tree>
  <Empty/>
  <Leaf><data:Sequence/></Leaf>
  <Node><Tree/><Tree/></Node>
</Tree>);

(: constructors :)
declare function local:empty() { $tree[1]() };
declare function local:leaf($v) { $tree[2]($v) };
declare function local:node($l,$r) { $tree[3]($l,$r) };

(: recursion and structural pattern matching :)
declare function local:depth($t)
{
  if(node-name(data:type($t)/..) ne xs:QName("Tree")) 
  then error() 
  else
    data:match($t,
        function() { 0 },
        function($v) { 1 },
        function($l, $r) { 1 + max((local:depth($l),local:depth($r))) })
};

(: programmatically buid up using constructors :)
let $t := local:node(
  local:node(
    local:empty(),
    local:leaf("my dog georgie")
  ),
  local:node(
    local:node(
      local:leaf("likes"),
      local:node(
        local:leaf("to eat biscuits"),
        local:empty()
      )
    ),
    local:empty()
  )
)

return (
  data:type($t), (: outputs data type definition:)
  data:describe($t), (: output instance :)
  local:depth($t) (: output maximum depth :)
)