robocopy . "%PREFIX%\Include" *.nsh
if errorlevel 8 exit 1

robocopy . "%PREFIX%\Examples\UAC" *.nsi
if errorlevel 8 exit 1

robocopy Plugins "%PREFIX%\Plugins" /S
if errorlevel 8 exit 1

exit 0
