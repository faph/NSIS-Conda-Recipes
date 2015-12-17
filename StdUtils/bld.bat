robocopy Contrib "%PREFIX%\Contrib" /S
if errorlevel 8 exit 1

robocopy Docs "%PREFIX%\Docs" /S
if errorlevel 8 exit 1

robocopy Examples "%PREFIX%\Examples" /S
if errorlevel 8 exit 1

robocopy Include "%PREFIX%\Include" /S
if errorlevel 8 exit 1

robocopy Plugins\Release_Unicode "%PREFIX%\Plugins\x86-unicode" /S
if errorlevel 8 exit 1
robocopy Plugins\Release_ANSI "%PREFIX%\Plugins\x86-ansi" /S
if errorlevel 8 exit 1

exit 0
