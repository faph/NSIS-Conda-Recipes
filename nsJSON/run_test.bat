for %%f in ("%PREFIX%\Examples\nsJSON\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)
