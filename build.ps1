Function OnAnaconda {
	param ([string]$pkg, [string]$channel)

	$url = "$channel/win-64/$pkg"
	$result = $true  # Assume on anaconda.org unless we get a 404 response.
	try
	{
		$request = [System.Net.WebRequest]::Create($url)
		$request.Method = 'HEAD'
		$response = $request.GetResponse()
		$response.Close()
	}
	catch [System.Net.WebException] {
		$code = [int]$_.Exception.Response.StatusCode
		$result = ($code -ne 404)
	}
	return $result
}

$channel = "https://conda.anaconda.org/nsis"
conda config --add channels $channel

$pkgs = Get-ChildItem -exclude 'continuous-integration' | ?{ $_.PSIsContainer }
foreach ($pkg in $pkgs) {
	$pkg_name = (conda build $pkg --output | Get-ChildItem).Name
	if (-not (OnAnaconda $pkg_name $channel)) {
		Write-Host "Building package $pkg_name..."
		conda build $pkg --quiet
	} else {
		Write-Host "Package $pkg_name already on anaconda.org. Skip building."
	}
}
