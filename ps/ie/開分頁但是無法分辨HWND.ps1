$openedIe=(New-Object -ComObject "Shell.Application").Windows() | Where-Object { $_.Name -eq "Internet Explorer" }
 $openedIe
$ie=$null
if($openedIe){
    if($openedIe -is [array]){
 
        $ie=$openedIe[1]
    }
    else {
        $ie=$openedIe
    }
    $ie.Navigate('https://www.google.com.tw/#spf=159asd33205', 2048)

} 
else{
    $ie = New-Object -ComObject InternetExplorer.Application
    $ie.Visible = $true
    $ie.Navigate('https://www.google.com.tw/#spf=1593960633205')
}

