If (Test-Path "$env:CONDA_BLD_PATH\win-64") {
	$pkgs = Get-ChildItem -path $env:CONDA_BLD_PATH\win-64\* -include *-nsis_*.tar.bz2

	"Uploading to anaconda.org..."
	binstar -t "$env:binstar_token" upload --no-progress $pkgs
} Else {
	"Nothing to upload to anaconda.org"
}
