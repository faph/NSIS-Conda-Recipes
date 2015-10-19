for %%f in ("%PREFIX%\Examples\Registry\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)
