robocopy Contrib "%PREFIX%\Contrib" /S
if errorlevel 8 exit 1
robocopy Docs "%PREFIX%\Docs" /S
if errorlevel 8 exit 1
robocopy Examples "%PREFIX%\Examples" /S
if errorlevel 8 exit 1
robocopy Plugins "%PREFIX%\Plugins" /S
if errorlevel 8 exit 1
exit 0
