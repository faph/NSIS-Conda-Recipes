robocopy Desktop\Include "%PREFIX%\Include" /S
if errorlevel 8 exit 1

robocopy Desktop "%PREFIX%\Docs\Registry" /S Readme.txt
if errorlevel 8 exit 1

robocopy Desktop\Example "%PREFIX%\Examples\Registry" /S
if errorlevel 8 exit 1

robocopy Desktop\Plugin "%PREFIX%\Plugins\x86-ansi" /S
if errorlevel 8 exit 1

robocopy Desktop\Plugin "%PREFIX%\Plugins\x86-unicode" /S
if errorlevel 8 exit 1

exit 0
