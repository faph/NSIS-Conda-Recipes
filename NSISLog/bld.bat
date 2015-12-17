robocopy plugin "%PREFIX%\Plugins\x86-ansi" /S
if errorlevel 8 exit 1
robocopy plugin "%PREFIX%\Plugins\x86-unicode" /S
if errorlevel 8 exit 1

exit 0
