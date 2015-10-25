If (Test-Path "$env:CONDA_BLD_PATH\win-64") {
	$pkgs = Get-ChildItem -path $env:CONDA_BLD_PATH\win-64\* -include *-nsis_*.tar.bz2

	"Uploading to anaconda.org..."
	binstar -t "$env:binstar_token" upload --no-progress $pkgs
	If ($lastexitcode -eq 0) {
		Add-AppveyorMessage -Message "Uploaded packages $pkgs" -Category Information
	} Else {
		Add-AppveyorMessage -Message "Failed uploading packages $pkgs" -Category Error
	}
} Else {
	"Nothing to upload to anaconda.org"
}
