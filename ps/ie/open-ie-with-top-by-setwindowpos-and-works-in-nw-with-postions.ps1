
$ie = New-Object -ComObject InternetExplorer.Application
$ie.Visible = $true
$ie.Navigate('https://www.google.com.tw/#spf=1593960633205', 2048)

$ie.HWND

$d=(Get-WmiObject -Class Win32_VideoController).VideoModeDescription;
$d=$d -replace ' '
$arr=$d.Split("x")
$screenW=[int]$arr[0]
$screenH=[int]$arr[1]
$d
$windowW=600
$windowH=300

$posiX=$screenW-$windowW
$posiY=$screenH-$windowH


$setPOS = @'
[DllImport("user32.dll")]
public static extern bool SetWindowPos(IntPtr hWnd, 
IntPtr hWndInsertAfter, 
int X, 
int Y, 
int cx, 
int cy, 
uint uFlags);
'@

$handle=Get-Process | Where-Object { ($_.MainWindowTitle) -and ($_.ProcessName -eq "iexplore") }  | Select-Object -ExpandProperty  MainWindowHandle 

$SetWindowPos = Add-Type -MemberDefinition $setPOS -name WinApiCall -passthru
$SetWindowPos::SetWindowPos($handle,-1,$posiX,0,$windowW,$windowH,0)