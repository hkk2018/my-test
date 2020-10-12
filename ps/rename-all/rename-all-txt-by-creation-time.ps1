Get-Item *.txt | Rename-Item -NewName { ($_.CreationTime -replace "/","" -replace " ","" -replace ":","" )+ $_.Extension }
#  把 2020/8/14 上午 09:15:52 中不可以當檔名的符號去掉
