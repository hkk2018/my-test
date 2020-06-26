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



        $type=Add-Type -MemberDefinition $classDef -Name SetWindowPosition -Namespace SetWindowPos -PassThru

        $alwaysOnTop = New-Object -TypeName System.IntPtr -ArgumentList (-1)
        $type::SetWindowPos(123,-1, 0, 0, 0, 0, 0x0003)