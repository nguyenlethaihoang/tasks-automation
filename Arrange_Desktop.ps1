write-Host "TASKS AUTOMATION" -ForegroundColor Yellow
write-Host "|" -ForegroundColor Cyan
write-Host "---1.Arrange desktop icons" -ForegroundColor Cyan

# Set location to Desktop
Set-Location -Path “C:\Users\hello\OneDrive\Desktop"  #Set-Location -Path “C:\Users\$ENV:UserName\" 

# Make folders
## Create Documents folder 
New-Item "./Documents" -ItemType Directory
### Copy files to Documents folder
Get-ChildItem -Path "C:\Users\hello\OneDrive\Desktop\*" -Include *.pdf,*.docx,*.txt -Recurse | Copy-Item -Destination "C:\Users\hello\OneDrive\Desktop\Documents" 
## Create Images folder
New-Item "./Images" -ItemType Directory
### Copy files to Images foler
Get-ChildItem -Path "C:\Users\hello\OneDrive\Desktop\*" -Include *.jpg,*.png -Recurse | Copy-Item -Destination "C:\Users\hello\OneDrive\Desktop\Images" 
## Create Shortcuts folder 
New-Item "./Shortcuts" -ItemType Directory
Get-ChildItem -Path "C:\Users\hello\OneDrive\Desktop\*" -Include *.lnk -Recurse | Copy-Item -Destination "C:\Users\hello\OneDrive\Desktop\Shortcuts" 
## Delete files
Get-ChildItem -Path C:\Users\hello\OneDrive\Desktop -File | Remove-Item -Verbose



#Get-ChildItem -LiteralPath "C:\Users\hello\OneDrive\Desktop" -Filter '*.lnk' -File

ls
write-Host "Arrange desktop successfully" -ForegroundColor Yellow

Sleep 100