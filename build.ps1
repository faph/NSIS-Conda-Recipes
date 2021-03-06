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

# Exclude folders starting with `_`
$recipes = Get-ChildItem -exclude _* | ?{ $_.PSIsContainer }

foreach ($recipe in $recipes) {
	$pkg_name = conda build $recipe --output | Split-Path -Leaf
	$pkg_basename = $pkg_name.TrimEnd('.tar.bz2')
	if (-not (OnAnaconda $pkg_name $channel)) {
		"Building package $pkg_basename..."
		conda build $recipe --quiet
		If ($lastexitcode -eq 0) {
			Add-AppveyorMessage -Message "Built package $pkg_basename" -Category Information
		} Else {
			Add-AppveyorMessage -Message "Failed building package $pkg_basename" -Category Error
		}
	} else {
		"Package $pkg_basename already on anaconda.org. Skip building."
	}
}
