robocopy . "%PREFIX%" /S /XF bld.bat
if errorlevel 8 exit 1

exit 0
