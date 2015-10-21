for %%f in ("%PREFIX%\Examples\Aero\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)
