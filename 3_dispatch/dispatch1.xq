xquery version "3.0";

declare namespace map="http://www.w3.org/2005/xpath-functions/map";

let $config := map { 
        "logfile" := "/tmp/log.txt",
        "verbosity" := "critical"
    }

return 
   for $key in map:keys($config)
   let $value := map:get($config,$key)
   return 
       if($key eq "logfile")
       then "setting filename to " || $value

       else if ($key eq "verbosity")
       then "setting verbosity to level " || $value

(:
       else if (…)
       then …
:) 
       else ()