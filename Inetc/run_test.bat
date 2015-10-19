for %%f in ("%PREFIX%\Examples\Inetc\*.nsi") do "%PREFIX%\makensis" %%f & if errorlevel 1 exit 1
