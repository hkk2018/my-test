#--- Optional Params
$folderName = "cheerleaderImgs" #留空則會詢問
$autoClose = 10; 


#--- Basics
$backupPrefix = Read-Host -Prompt '請輸入備份前綴(如日期、功能等)'


if ($folderName -eq "") {
    $folderName = Read-Host -Prompt '請輸入備份名稱'
}
$backupFullName = "[$backupPrefix]$folderName"
$folderLocation = ""
# $folderPath = $folderLocation + $folderName;

#--- Winrar
$rarProgramPath = "C:\Program Files\WinRAR\Rar.exe"
$desitination = $backupFullName + '.rar'; # 產生於working directory
$source = $folderName
Get-Item -LiteralPath $desitination | Remove-Item # 有就會刪除，壓縮前最好先移除現有的同名壓縮檔, 因為目標中多的檔案不會被移除
$argumentStr = "a $desitination $source" # cmd中是 -a destination source ，但ps則不加減號


Start-Process -FilePath $rarProgramPath -ArgumentList $argumentStr -Wait

"壓縮成功～！"
"$autoClose 秒後程序將自動關閉"
Start-Sleep $autoClose
Exit