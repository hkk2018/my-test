#--- 變數
# 資料夾
$tempLocation = 'C:\Users\hongk\Desktop\test-prod\asd'; #匯集要打包的檔案的位置
$tlServer = $tempLocation + '\server'
$tlUI = $tempLocation + '\ui'

# 編譯外常備檔案資料夾
$prodEssentialsFolder='.\production-essentials'

# 後端
$backEndScripts = ".\server\build\*" 
$backEndNodeM=".\server\node_modules"
$backEndEssentials = $prodEssentialsFolder+"\server\*"
# 前端
$frontEndEssentials = $prodEssentialsFolder+"\ui\*"
$frontEndDistFolderForArchive = '.\vue\dist'
$nwFileName = 'package.nw'
# 一般
$rootEssentials = $prodEssentialsFolder+"\root\*"
$devLog='.\dev-log.txt'


#--- 刪掉舊資料夾並新創空資料夾
Get-ChildItem -Path $tempLocation -Recurse | Remove-Item -Force -Recurse | Out-Null
Remove-Item $tempLocation -Force 
New-Item -ItemType "directory" -Path $tempLocation
New-Item -ItemType "directory" -Path $tlServer
New-Item -ItemType "directory" -Path $tlUI

#--- 編譯
$vueFolder = 'vue';
pushd $vueFolder;
#npm run build
popd
pushd 'server'
Start-Process 'build.cmd' -Wait
popd

#--- 複製
# 後端
Copy-Item -Path $backEndScripts -Destination $tlServer -Recurse
Copy-Item -Path $backEndEssentials -Destination $tlServer -Recurse
Copy-Item -Path $backEndNodeM -Destination $tempLocation -Recurse

# 前端
Start-Process 'C:\Program Files\WinRAR\Rar.exe' -ArgumentList @('a', $nwFileName, $frontEndDistFolderForArchive) -NoNewWindow -Wait
Move-Item -Path $nwFileName -Destination $tlUI
Copy-Item -Path $frontEndEssentials -Destination $tlUI -Recurse

# 一般
Copy-Item -Path $rootEssentials -Destination $tempLocation -Recurse
Copy-Item -Path $devLog -Destination $tempLocation