$pkgs = Get-ChildItem -exclude 'continuous-integration' | ?{ $_.PSIsContainer }
foreach ($pkg in $pkgs) {
   conda build $pkg --quiet
}
