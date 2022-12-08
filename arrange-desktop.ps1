write-Host "TASKS AUTOMATION" -ForegroundColor Yellow
write-Host "|" -ForegroundColor Cyan
write-Host "---1.Arrange desktop icons" -ForegroundColor Cyan

# Declare location of desktop
$Location_Desktop =  [Environment]::GetFolderPath("Desktop")
# Set location to Desktop
Set-Location -Path "$Location_Desktop"

# Make folders

## Create Documents folder 
New-Item "./Documents" -ItemType Directory

## Copy files to Documents folder
Get-ChildItem -Path "$Location_Desktop\*" -Include *.pdf,*.docx,*.txt, *.pptx -Recurse | Copy-Item -Destination "$Location_Desktop\Documents" | Out-Null
## Create Images folder
New-Item "./Images" -ItemType Directory

### Copy files to Images foler
Get-ChildItem -Path "$Location_Desktop\*" -Include *.jpg,*.png -Recurse | Copy-Item -Destination "$Location_Desktop\Images" | Out-Null

## Create Shortcuts folder 
New-Item "./Shortcuts" -ItemType Directory

Get-ChildItem -Path "$Location_Desktop\*" -Include *.lnk -Recurse | Copy-Item -Destination "$Location_Desktop\Shortcuts" | Out-Null

## Create Media folder 
New-Item "./Media" -ItemType Directory

Get-ChildItem -Path "$Location_Desktop\*" -Include *.mp4, *.mov, *.mp3, *.wav -Recurse | Copy-Item -Destination "$Location_Desktop\Media" | Out-Null

## Delete files
Get-ChildItem -Path $Location_Desktop -File | Remove-Item -Verbose | Out-Null



#Get-ChildItem -LiteralPath "$Location_Desktop" -Filter '*.lnk' -File

write-Host "Arrange desktop successfully" -ForegroundColor Yellow;