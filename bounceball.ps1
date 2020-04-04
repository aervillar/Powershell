
$h=10
$bounce=0.66
$window=1.5

If ( ($h -gt 0) -and (($bounce -gt 0) -and ($bounce -lt 1)) -and ($window -lt $h))    {
    $x = 1
    If (($bounce * $h) -gt 1.5 ) { 
      while ($h -gt 1.5) {
        $x = $x + 2
        $h = $h * $b
       }
     }
   }  Else {
      $x = -1
   } 
   Write-Host($x) 
