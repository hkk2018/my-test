
# 看起來大多數錯誤這邊都能抓得到，但是如果ps1檔路徑中有任何資料夾名稱有space就會直接關起來抓不到錯誤
try {
    $path = (Get-Item .).FullName
    $location = $path + '\simple   .exe'
    & $location @('chinese will be $%@%#@!%$') 
}
catch {
    "An error occurred."
}

Read-Host -Prompt "Press Enter to exit"