rem LockedListTest.nsi not working

for %%f in ("%PREFIX%\Examples\LockedList\*.nsi") do (
	if not "%%~nxf" == "LockedListTest.nsi" (
		"%PREFIX%\makensis" %%f
		if errorlevel 1 exit 1
	)
)
