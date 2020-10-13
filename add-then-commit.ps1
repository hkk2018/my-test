$autoCloseDelay = 5
$commitMsg = Read-Host -Prompt 'commit msg'
git add .;
git commit -m $commitMsg;

""
"Committed."
""
"will close in $autoCloseDelay s..." 
# "$autoCloseDelay 秒後程序將自動關閉..." 
# "$autoCloseDelay 秒後程序將自動關閉" #超神奇只是字串的差異但這句會壞掉
Start-Sleep $autoCloseDelay
Exit
