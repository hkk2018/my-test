$ie = New-Object -ComObject InternetExplorer.Application
$ie.Visible = $true
$ie.Navigate('http://www.nu.nl')

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
$SetWindowPos::SetWindowPos($handle,-1,0,0,0,0,1)