for %%f in ("%PREFIX%\Examples\nsArray\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)
