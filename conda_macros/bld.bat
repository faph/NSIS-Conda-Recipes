robocopy . "%PREFIX%\Include" conda.nsh
if errorlevel 8 exit 1

robocopy examples "%PREFIX%\Examples\CondaMacros"
if errorlevel 8 exit 1

exit 0
