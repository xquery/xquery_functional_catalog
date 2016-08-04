xquery version "3.0"; 

(: walk with dispatch :)

declare namespace map="http://www.w3.org/2005/xpath-functions/map";

declare function local:walk(
    $tree,  
    $map
){
  let $elFunc := map:get($map,"elFunc")
  let $attrFunc := map:get($map,"attrFunc")
  let $textFunc := map:get($map,"textFunc")  
  let $children := $tree/*
  return
      if(empty($children)) 
      then ()
      else 
        for $c in $children
        return $elFunc($c,
                        (for $attr in $c/@* return $attrFunc($attr),
                         $textFunc($c/text()),
                         local:walk($c,$map)))
};

let $elFunc := function($el,$rest){element {name($el)}{
                                     attribute{"walked"}{true()},
                                     $rest}}

let $attrFunc := function($attr){attribute{"amend-" || name($attr)}{$attr}}

let $textFunc := function($text as text()){"amend-" || $text}

let $tree := document{
<a>level1
    <b>level2
        <c myattr="go1" another="go2">level3
            <d>level4</d>
        </c>
        <c>level3</c>
    </b>
</a>}

let $map := map { 
        "elFunc" := $elFunc,
        "attrFunc" := $attrFunc,
        "textFunc" := $textFunc
    }

return local:walk($tree,$map)