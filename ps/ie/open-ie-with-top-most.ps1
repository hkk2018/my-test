$ie = New-Object -ComObject InternetExplorer.Application
$ie.Visible = $true
$ie.Navigate('http://www.nu.nl')


[Microsoft.VisualBasic.Interaction]::AppActivate($pid)
[void][System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")

$processId=Get-Process | Where-Object { ($_.MainWindowTitle) -and ($_.ProcessName -eq "iexplore") }  | Select-Object -ExpandProperty  Id 


[Microsoft.VisualBasic.Interaction]::AppActivate($processId)

# topmost https://stackoverflow.com/questions/35679178/appactivate-working-inconsistently-in-powershell

