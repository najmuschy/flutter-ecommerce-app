$logFile = "D:\FLUTTER_PROJ\crafty_bay\proj_structure_log.txt"
$projectRoot = "D:\FLUTTER_PROJ\crafty_bay"
$targetFolders = @("assets", "lib")

# Optional: Clear the log file before appending fresh output
if (Test-Path $logFile) {
    Clear-Content $logFile
}

foreach ($folder in $targetFolders) {
    $fullPath = Join-Path -Path $projectRoot -ChildPath $folder
    if (Test-Path $fullPath) {
        $header = "`nTree for: $fullPath`n-------------------------------------"
        $header | Tee-Object -FilePath $logFile -Append

        $items = Get-ChildItem -Path $fullPath -Recurse | Sort-Object FullName

        if ($items.Count -eq 0) {
            "    (Empty folder)" | Tee-Object -FilePath $logFile -Append
        } else {
            foreach ($item in $items) {
                $depth = ($item.FullName.Split('\').Length - $fullPath.Split('\').Length)
                $indent = "    " * $depth
                "$indent+- $($item.Name)" | Tee-Object -FilePath $logFile -Append
            }
        }
    } else {
        "`nFolder not found: $fullPath" | Tee-Object -FilePath $logFile -Append
    }
}
