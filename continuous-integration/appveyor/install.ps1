# Sample script to install Miniconda under Windows
# Authors: Olivier Grisel, Jonathan Helmus and Kyle Kastner, Robert McGibbon
# License: CC0 1.0 Universal: http://creativecommons.org/publicdomain/zero/1.0/

$MINICONDA_URL = "http://repo.continuum.io/miniconda/"


function DownloadMiniconda ($python_version, $platform_suffix) {
    $webclient = New-Object System.Net.WebClient

    $filename = Miniconda3-latest-Windows-x86_64.exe
    $url = $MINICONDA_URL + $filename

    $basedir = $pwd.Path + "\"
    $filepath = $basedir + $filename
    if (Test-Path $filename) {
        Write-Host "Reusing" $filepath
        return $filepath
    }

    # Download and retry up to 3 times in case of network transient errors.
    Write-Host "Downloading" $filename "from" $url
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
   if (Test-Path $filepath) {
       Write-Host "File saved at" $filepath
   } else {
       # Retry once to get the error message if any at the last try
       $webclient.DownloadFile($url, $filepath)
   }
   return $filepath
}


function InstallMiniconda {
    Write-Host "Installing Conda"

    $filepath = DownloadMiniconda "3.4" "64"
    $args = "/S /D=$env:PYTHON"
    Start-Process -FilePath $filepath -ArgumentList $args -Wait -Passthru
    if (Test-Path $env:PYTHON) {
        Write-Host "Python installation complete"
    } else {
        Write-Host "Failed to install Python in $env:PYTHON"
        Exit 1
    }
}


function InstallCondaPackages ($python_home, $spec) {
    $conda_path = $python_home + "\Scripts\conda.exe"
    $args = "install --yes " + $spec
    Write-Host ("conda " + $args)
    Start-Process -FilePath "$conda_path" -ArgumentList $args -Wait -Passthru
}

function UpdateConda ($python_home) {
    $conda_path = $python_home + "\Scripts\conda.exe"
    Write-Host "Updating conda..."
    $args = "update --yes conda"
    Write-Host $conda_path $args
    Start-Process -FilePath "$conda_path" -ArgumentList $args -Wait -Passthru
}


function main () {
    InstallMiniconda
    #UpdateConda $env:PYTHON
    InstallCondaPackages $env:PYTHON "conda-build jinja2 anaconda-client"
}

main
