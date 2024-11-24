# Define the URLs to open
$urls = @("https://www.example.com", "https://www.microsoft.com", "https://www.google.com")

# Path to Microsoft Edge executable
$edgePath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

# Open each URL in Edge
foreach ($url in $urls) {
    Start-Process -FilePath $edgePath -ArgumentList $url
}
