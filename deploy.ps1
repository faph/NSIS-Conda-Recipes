If (Test-Path $env:CONDA_BLD_PATH) {
	# Get all the packages in the build folder
	$pkgs = Get-ChildItem -path $env:CONDA_BLD_PATH\win-64\* -include *.tar.bz2

	# Upload to anaconda.org
	binstar -t "$env:binstar_token" upload --no-progress $pkgs
}
