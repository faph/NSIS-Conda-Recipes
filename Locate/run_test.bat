rem LockedListTest.nsi not working

for %%f in ("%PREFIX%\Examples\Locate\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)
