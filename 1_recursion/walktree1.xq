xquery version "3.0"; 

(: walk with recursion :)

declare function local:walk(
    $tree
){
  let $children := $tree/*
  return
      if(empty($children)) 
      then ()
      else 
        for $c in $children
        return element {name($c)}{
                        $c/@*,
                        $c/text(),
                        local:walk($c)}
};

let $tree := document{
<a>level1
    <b>level2
        <c myattr="go1" another="go2">level3
            <d>level4</d>
        </c>
        <c>level3</c>
    </b>
</a>}

return local:walk($tree)