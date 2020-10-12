# https://stackoverflow.com/questions/8343767/how-to-get-the-current-directory-of-the-cmdlet-being-executed
$path=(Get-Item .).FullName
$location=$path+ '\simple-modal-to-show-first-param.exe'
& $location @('chinese will be $%@%#@!%$')