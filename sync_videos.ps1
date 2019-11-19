Start-Sleep -s 30
while($true)
{
$i++
$remoto = "Z:"
$local =  "C:\Users\soporte\Videos"
$new_video = Get-Childitem $remoto -Filter "*.mp4"
$last_video = Get-ChildItem $local -Filter "*.mp4"

if ((Get-ChildItem $remoto).Count -eq 1){
    if ($new_video -like $last_video) {

        date
        echo "iguales"
    }else {
        Copy-Item –Path $new_video.FullName –Destination $local
        Start-Sleep -s 60
        Stop-Process -Name vlc
        Start-Sleep -s 5
        Remove-Item -Path $last_video.FullName
        start vlc -ArgumentList $local'\'$new_video, --fullscreen, --no-video-title-show, --repeat
    }
}else {
    echo "existen mas de 1 archivo en citv_play"
}
Start-sleep -s 120
}
