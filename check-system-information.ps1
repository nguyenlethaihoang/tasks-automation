# Declare variables
$TotalRam = $((systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()) -replace "," -replace "MB"
$AvailableRam = $((systeminfo | Select-String 'Available Physical Memory:').ToString().Split(':')[1].Trim()) -replace "," -replace "MB"
$UsageRam = [int]$TotalRam - [int]$AvailableRam
$cpuPhysicalCount, $cpuLogicalCount = $cpuInfo.NumberOfCores, $cpuInfo.NumberOfLogicalProcessors
$AverageCPU =[int]$($(wmic cpu get loadpercentage)[2])
$FreeDisk = (Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Measure-Object -Property 'FreeSpace (GB)' -Sum).Sum
$TotalDisk = (Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'Size (GB)'; Expression= { [int]($_.Size / 1GB) }} | Measure-Object -Property 'Size (GB)' -Sum).Sum
$UsageDisk = $TotalDisk - $FreeDisk

# Print RAM stats
Write-Host "RAM:" -ForegroundColor Yellow
Write-Host "- Total:" -ForegroundColor Green
Write-Host "$($TotalRam)MB → $([math]::Round([double]$TotalRam/1024,3)) GB" 
Write-Host "- Usage:" -ForegroundColor Green
Write-Host "$($UsageRam) MB → $([math]::Round([double]$UsageRam/1024,3)) GB" 
Write-Host "- Free:" -ForegroundColor Green
Write-Host "$($AvailableRam)MB → $([math]::Round([double]$AvailableRam/1024,3)) GB" 
# Print CPU stats
Write-Host "CPU:" -ForegroundColor Yellow
Write-Host "- Number Of Cores:" -ForegroundColor Green
Write-Host $cpuPhysicalCount
Write-Host "- Number Of Logical Processors:" -ForegroundColor Green
Write-Host $cpuLogicalCount
Write-Host "- CPU Utilisation:" -ForegroundColor Green
Write-Host $AverageCPU"%"
# Print DISK stats
Write-Host "DISK:" -ForegroundColor Yellow
Write-Host "- Total:" -ForegroundColor Green
Write-Host $TotalDisk" GB"
Write-Host "- Usage:" -ForegroundColor Green
Write-Host $UsageDisk" GB"
Write-Host "- Free:" -ForegroundColor Green
Write-Host $FreeDisk" GB"