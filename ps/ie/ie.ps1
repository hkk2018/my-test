[void][System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")


#$ie = New-Object -ComObject InternetExplorer.Application
#$ie.Visible = $true
#$ie.Navigate('http://www.nu.nl')

#$ie.FullScreen=1
# then later:
# $ie.Quit()

$processId=Get-Process | Where-Object { ($_.MainWindowTitle) -and ($_.ProcessName -eq "iexplore") }  | Select-Object -ExpandProperty  Id   
# 不可用$pid因為是關鍵字會壞掉
if ($processId) {Stop-Process -Id $processId}
# $handle = Get-Process | Where-Object { ($_.MainWindowTitle.Contains( "RoboArm")) -and ($_.ProcessName -eq "nw") }