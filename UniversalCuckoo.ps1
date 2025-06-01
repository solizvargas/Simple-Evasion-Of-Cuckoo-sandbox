function Exit-On-Detection {
    Write-Output "Detection occurred. Exiting process."
    shutdown.exe /s /t 0
    Stop-Process -Id $PID
    exit
}

# DLL detection
$dllName = "cuckoomon.dll"
$results = Get-ChildItem -Path C:\ -Filter $dllName -Recurse -ErrorAction SilentlyContinue -Force
if ($results) {
    Write-Output "DLL Detected"
    foreach ($file in $results) {
        Write-Output $file.FullName
    }
    Exit-On-Detection
}

# Hash detection
$hashesToFind = @(
    "",
    ""
)
$allFiles = Get-ChildItem -Path C:\ -File -Recurse -ErrorAction SilentlyContinue -Force
foreach ($file in $allFiles) {
    try {
        $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256
        if ($hashesToFind -contains $hash.Hash) {
            Write-Output "Hash Detected: $($file.FullName)"
            Exit-On-Detection
        }
    } catch {
        # Ignore files that can't be read
    }
}

# Directory detection
$dirsToCheck = @(
    "storage\analyses",
    "storage\binaries",
    "storage\monitor",
    "storage\volatility",
    "storage\network"
)
foreach ($dir in $dirsToCheck) {
    $foundDirs = Get-ChildItem -Path C:\ -Directory -Recurse -ErrorAction SilentlyContinue -Force | Where-Object { $_.FullName -like "*$dir" }
    if ($foundDirs) {
        foreach ($found in $foundDirs) {
            Write-Output "Suspicious directory found: $($found.FullName)"
        }
        Exit-On-Detection
    }
}

Write-Output "No detection. decode stage2"