

# $handle=gps | ? { ($_.MainWindowTitle.Contains( "RoboArm")) -and ($_.ProcessName -eq "nw") }  | Select-Object -Property MainWindowHandle   
$handle=gps | ? { ($_.MainWindowTitle.Contains( "RoboArm")) -and ($_.ProcessName -eq "nw") }  | Select -ExpandProperty  MainWindowHandle  
Write-Host $handle
#gps | ? { ($_.MainWindowTitle.Contains( "RoboArm")) -and ($_.ProcessName -eq "nw") }  | Format-list -Property *

$Assemblies = (
    "System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"

)


$classDef=@"

using System;
public class WindowWrapper : System.Windows.Forms.IWin32Window
{
    public WindowWrapper(IntPtr handle)
    {
        _hwnd = handle;
    }

    public IntPtr Handle
    {
        get { return _hwnd; }
    }

    private IntPtr _hwnd;
}
"@

Add-Type -TypeDefinition $classDef -ReferencedAssemblies $Assemblies


$window = [WindowWrapper]::new($handle)


$window 