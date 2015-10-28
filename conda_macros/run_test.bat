for %%f in ("%PREFIX%\Examples\CondaMacros\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)

for %%f in ("%SRC_DIR%\tests\*.nsi") do (
	"%PREFIX%\makensis" %%f
	if errorlevel 1 exit 1
)
