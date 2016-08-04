xquery version "3.0"; 

(: walk with functional style :)

declare function local:walk(
    $tree,  
    $elFunc as function(*),
    $attrFunc as function(*),
    $textFunc as function(*)
){
  let $children := $tree/*
  return
      if(empty($children)) 
      then ()
      else 
        for $c in $children
        return $elFunc($c,
                        (for $attr in $c/@* return $attrFunc($attr),
                         $textFunc($c/text()),
                         local:walk($c,$elFunc,$attrFunc,$textFunc)))
};

let $accum := function($a,$acum){$a+$acum}

let $elFunc := function($el,$rest){
    "encountered elemant name:" || name($el) || "
    ",$rest
}

let $attrFunc := function($attr){()}

let $textFunc := function($text){()}

let $tree := document{
<a>level1
    <b>level2
        <c myattr="go1" another="go2">level3
            <d>level4</d>
        </c>
        <c>level3</c>
    </b>
</a>}

return local:walk($tree,$elFunc,$attrFunc,$textFunc)