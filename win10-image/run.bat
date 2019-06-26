:: we need a directory with sufficient access privileges, so %USERPROFILE%\dock is just an example
mkdir %USERPROFILE%\dock 
docker run -it -v %USERPROFILE%\dock:c:\dock win10
