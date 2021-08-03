# Copy a file from one location to another

$fileName = "test.csv"
$src = "localtion\A"
$backup = "location\B"
$dest = "location\C"

$emailFrom = "test@example.com"
$emailTo = "test@example.com"
$subject = "Error Occurred When Copying Files from A to C"
$smtp = ""

function Get-StampedFileName {
    param( [string] $fileName)

    if (-not(Test-Path $fileName)) {
        Throw "File [$fileName] Not Found"
    }

    $fileObj = get-item $fileName

    $timeStamp = Get-Date -Format "yyyy-MM-dd-HH-mm"

    $extOnly = $fileObj.extension

    if ($extOnly.length -eq 0) {
       $nameOnly = $fileObj.Name
       return "$nameOnly-$timeStamp"
    }
    else {
       $nameOnly = $fileObj.Name.Replace( $fileObj.Extension,'')
       return "$nameOnly-$timeStamp$extOnly"
    }
}

try {

    $srcFile = Join-Path -Path $src -ChildPath $fileName
    $backupFile = Join-Path -Path $backup -ChildPath (Get-StampedFileName -fileName $srcFile)
    $destFile = Join-Path -Path $dest -ChildPath $fileName

    Copy-Item -Path $srcFile -Destination $backupFile
    Copy-Item -Path $srcFile -Destination $destFile
    Remove-Item -Path $srcFile
}
catch {
    Send-MailMessage -Body $_ -to $emailTo -from $emailFrom -Subject $subject -smtp $smtp -Priority High
}



  