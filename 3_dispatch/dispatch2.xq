xquery version "3.0";

declare namespace map="http://www.w3.org/2005/xpath-functions/map";

let $config := map { 
        "logfile" := "/tmp/log.txt",
        "verbosity" := "critical"
    }

let $processFunc := function($config,$dispatch){
    for $key in map:keys($config)
    let $value := map:get($config,$key)
    return map:get($dispatch,$key)($value)}

let $set_logfile := function($uri){"setting filename to " || $uri}

let $set_verbosity := function($level){"setting verbosity to " || $level}

let $dispatch := map{
    "logfile":= $set_logfile,
    "verbosity":= $set_verbosity}

return $processFunc($config,$dispatch)