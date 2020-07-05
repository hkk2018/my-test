(New-Object -ComObject "Shell.Application").Windows() | Where-Object { $_.Name -eq "Internet Explorer" }

$ie=(New-Object -ComObject "Shell.Application").Windows() | Where-Object { $_.Name -eq "Internet Explorer" }

$procOpenedIe= $ie | Where-Object -FilterScript { $_.Width -eq 600 } 
$procOpenedIe
if($procOpenedIe){$procOpenedIe.Quit()}
   #   -is [array] 
 # {$_.Width -eq 600} 


    #  $ie.Navigate("http://www.google.com/", 2048)