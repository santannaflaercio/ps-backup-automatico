$7zPath = "C:\Program Files\7-Zip\7z.exe"
$origem = "C:\workspace"
$destino = "C:\Backup"
$datahora = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$arquivo = "backup_$datahora.7z"

# Remove existing backup files in the destination directory
Get-ChildItem -Path $destino -Filter "*.7z" | Remove-Item -Force

# Compress and copy files with additional options
& $7zPath a -t7z -mx=9 "$destino\$arquivo" $origem

# Display success message with file size
$backupFileSize = (Get-Item "$destino\$arquivo").Length / 1MB
Write-Host "Backup completed successfully! File size: $backupFileSize MB"
