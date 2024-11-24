while ($true) {
    Start-Job { while ($true) {} } | Out-Null
}
