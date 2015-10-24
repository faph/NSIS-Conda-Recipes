# Sample script to install Miniconda under Windows
# Authors: Olivier Grisel, Jonathan Helmus and Kyle Kastner, Robert McGibbon
# License: CC0 1.0 Universal: http://creativecommons.org/publicdomain/zero/1.0/

$MINICONDA_URL = "http://repo.continuum.io/miniconda"


function DownloadMiniconda {
    $webclient = New-Object System.Net.WebClient

    $filename = "Miniconda3-latest-Windows-x86_64.exe"
    $url = "$MINICONDA_URL/$filename"

    $filepath = "$env:temp\$filename"
    if (Test-Path $filename) {
        Write-Host "Reusing $filepath..."
        return $filepath
    }

    # Download and retry up to 3 times in case of network transient errors.
    Write-Host "Downloading $url..."
    $retry_attempts = 2
    for($i=0; $i -lt $retry_attempts; $i++){
        try {
            $webclient.DownloadFile($url, $filepath)
            break
        }
        Catch [Exception]{
            Start-Sleep 1
        }
   }
   if (-not (Test-Path $filepath)) {
       # Retry once to get the error message if any at the last try
       $webclient.DownloadFile($url, $filepath)
   }
   return $filepath
}


function InstallMiniconda {
    Write-Host "Installing Python..."

    $installer = DownloadMiniconda
    $args = "/S", "/D=$env:PYTHON"
    Start-Process -FilePath $installer -ArgumentList $args -Wait -Passthru
    if (Test-Path $env:PYTHON) {
        Write-Host "Python installation complete"
    } else {
        Write-Host "Failed to install Python in $env:PYTHON"
        Exit 1
    }
}

InstallMiniconda
