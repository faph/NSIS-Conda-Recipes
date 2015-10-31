robocopy Contrib "%PREFIX%\Contrib" /S
if errorlevel 8 exit 1

robocopy Docs "%PREFIX%\Docs" /S
if errorlevel 8 exit 1

robocopy Plugins "%PREFIX%\Plugins\x86-ansi"
if errorlevel 8 exit 1

robocopy Unicode\Plugins "%PREFIX%\Plugins\x86-unicode"
if errorlevel 8 exit 1

exit 0
