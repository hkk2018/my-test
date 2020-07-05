        Function Select-FolderDialog
        {
            param([string]$Description="Select Folder",[string]$RootFolder="Desktop")
        
            [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |Out-Null     
        
            $folderSelector=New-Object System.Windows.Forms.FolderBrowserDialog
            $folderSelector.Description="請選擇資料夾"
            $folderPath=""
            
            # https://www.reddit.com/r/PowerShell/comments/6k2vbj/folderbrowserdialog_not_on_top/
            $Topmost = New-Object System.Windows.Forms.Form
            $Topmost.TopMost = $True
            $Topmost.Name = "hehehehehe"
            $Topmost.BringToFront()
            $Topmost.Focus()
           
            $h= $Topmost.Handle
            Write-Host $h
              $c= [System.Windows.Forms.CommonDialog]$folderSelector
           $c.

             $classDef=@'
[DllImport("user32.dll")]
public static extern bool SetWindowPos(IntPtr hWnd, 
IntPtr hWndInsertAfter, 
int X, 
int Y, 
int cx, 
int cy, 
uint uFlags);
'@

        $type=Add-Type -MemberDefinition $classDef  -Name SetWindowPosition -Namespace SetWindowPos -PassThru
       $alwaysOnTop = New-Object -TypeName System.IntPtr -ArgumentList (-1)
        $type::SetWindowPos(   $h,$alwaysOnTop,0,0,0,0,0x0040)

     
            if($folderSelector.ShowDialog($Topmost) -eq "OK"){
                $folderPath+=$folderSelector.SelectedPath
            }
            return $folderPath
        }
        
        $folder = Select-FolderDialog 