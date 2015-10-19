for %%f in ("%PREFIX%\Examples\ExecDos\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)
