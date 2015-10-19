makensis "%PREFIX%\Examples\nsArray\nsArray.nsi"
if errorlevel 1 exit 1

makensis "%PREFIX%\Examples\nsArray\nsArrayHeader.nsi"
if errorlevel 1 exit 1
