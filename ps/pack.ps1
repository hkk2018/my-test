#--- Optional Params
$folderName = "cheerleaderImgs" #留空則會詢問
$autoCloseDelay = 15; 


#--- Basics
Write-Host "將備份資料夾: $folderName"
""
$backupPrefix = Read-Host -Prompt '請輸入備份前綴(如日期、功能等)'


if ($folderName -eq "") {
    $folderName = Read-Host -Prompt '請輸入備份資料夾名稱'
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

# 壓縮
Start-Process -FilePath $rarProgramPath -ArgumentList $argumentStr -Wait

# 計算檔案大小(MB)
$rarFile=Get-Item -LiteralPath $desitination
$fileSize=$rarFile.Length/1MB
$formattedSize='{0:n3}' -f $fileSize # https://www.pstips.net/formatting-numbers-easily.html


""
"壓縮成功～！"
""
"檔名為 $desitination ，大小為 $formattedSize MB"
""
"$autoCloseDelay 秒後程序將自動關閉"
Start-Sleep $autoCloseDelay
Exit