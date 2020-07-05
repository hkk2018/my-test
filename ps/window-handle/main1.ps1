Function Select-FolderDialog {
    param([string]$Description = "Select Folder", [string]$RootFolder = "Desktop")
        
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null     
        
    $folderSelector = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderSelector.Description = "請選擇資料夾"
    $folderPath = ""
         
    $handle = Get-Process | Where-Object { ($_.MainWindowTitle.Contains( "RoboArm")) -and ($_.ProcessName -eq "nw") }  | Select-Object -ExpandProperty  MainWindowHandle  
           
    $Assemblies = (
        "System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    )

    $classDef = @"
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
     
    if ($folderSelector.ShowDialog($window) -eq "OK") {
        $folderPath += $folderSelector.SelectedPath
    }
    return $folderPath
}
        
$folder = Select-FolderDialog 