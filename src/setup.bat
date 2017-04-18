mkdir C:\gmetritmp
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/2.7.13/python-2.7.13.amd64.msi', 'C:\gmetritmp\python-2.7.13.amd64.msi')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('http://mirror.cs.umn.edu/blender.org/release/Blender2.78/blender-2.78c-windows64.msi', 'C:\gmetritmp\blender-2.78c-windows64.msi')"
::
msiexec /qb /i C:\gmetritmp\python-2.7.13.amd64.msi
msiexec /qb /i C:\gmetritmp\blender-2.78c-windows64.msi
::
echo %PATH% > user_path.bak
echo "Adding python and blender to PATH"
set NEWPATH=C:\Python27\Scripts;C:\Python27;C:\Program Files\Blender Foundation\Blender
set PATH=%PATH%%NEWPATH%
setx PATH "%PATH%"
::set pathkey="HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
::for /f "skip=2 tokens=3*" %a in ('reg query %pathkey% /v PATH') do @if [%b]==[] ( @setx PATH "%~a;%NEWPATH%" ) else ( @setx PATH "%~a %~b;%NEWPATH%" )
::
pip install cube2sphere
pip install sphere2cube
::http://mirror.cs.umn.edu/blender.org/release/Blender2.78/blender-2.78c-windows64.msi