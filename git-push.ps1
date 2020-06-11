$commitText=Read-Host "Please enter content to commit"
git add .
git commit -m $commitText
git push