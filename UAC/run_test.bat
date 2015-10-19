rem UAC_DualMode.nsi does some weird compiling, just skip

for %%f in ("%PREFIX%\Examples\UAC\*.nsi") do (
	if not "%%~nxf" == "UAC_DualMode.nsi" (
		"%PREFIX%\makensis" %%f
		if errorlevel 1 exit 1
	)
)
