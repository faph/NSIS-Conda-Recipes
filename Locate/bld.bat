robocopy . "%PREFIX%\Docs\Locate" Readme.txt
if errorlevel 8 exit 1

robocopy Example "%PREFIX%\Examples\Locate" /S
if errorlevel 8 exit 1

robocopy Source "%PREFIX%\Contrib\Locate" /S
if errorlevel 8 exit 1

robocopy Include "%PREFIX%\Include" /S
if errorlevel 8 exit 1

robocopy Plugin "%PREFIX%\Plugins\x86-ansi" /S
if errorlevel 8 exit 1

robocopy Plugin "%PREFIX%\Plugins\x86-unicode" /S
if errorlevel 8 exit 1

exit 0
