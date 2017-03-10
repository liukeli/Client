@echo off

cd ..\CSharpFile

set csFilePath=%cd%

echo cd ..\ProtoGen

cd ..\ProtoGen\protoFiles
for %%i in (*.proto) do echo protogen -i:%%~fi -o:%csFilePath%\%%~ni.cs ^
