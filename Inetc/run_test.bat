rem translate.nsi not valid

for %%f in ("%PREFIX%\Examples\Inetc\*.nsi") do (
	if not "%%~nxf" == "translate.nsi" (
		"%PREFIX%\makensis" %%f
		if errorlevel 1 exit 1
	)
)
