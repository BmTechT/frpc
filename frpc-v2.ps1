# Set client name
$clientName = Read-Host "Enter the client name"

# Define paths and URLs
$folderPath = "C:\frpc"
$frpcServiceName = "frpc"
$frpcFolderUrl = "https://bit.ly/bmvie-frpc"
$zipFilePathOutput = "C:\frpc.zip"
$destinationFolder = "C:\"
$clientHostName = "http://$clientName.bmvie.net:8080"

# Create folder and add to antivirus exclusion list
mkdir $folderPath
Add-MpPreference -ExclusionPath $folderPath

# Download and extract ZIP file
Invoke-WebRequest -Uri $frpcFolderUrl -OutFile $zipFilePathOutput
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePathOutput, $destinationFolder)

# Replace "ClientNameHere" with $clientName in all frpc.ini files
Get-ChildItem -Path $folderPath -Filter "frpc.ini" -File | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace "ClientNameHere", $clientName
    Set-Content -Path $_.FullName -Value $newContent
    Write-Host "Text replaced in $($_.FullName)"
}

# Install and start the service
Start-Process -FilePath "$folderPath\frpc_service.exe" -ArgumentList "install" -NoNewWindow -Wait
Start-Service -Name $frpcServiceName
Write-Host "the url is ready to use $clientHostName"
#Start-Process -FilePath $clientHostName