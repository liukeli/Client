@echo off

echo ɾ��ԭ���Ľ�������
rd /s /q CSharpFile
md CSharpFile

echo �������ɽ�������
echo.

cd gen
call genbat.bat

echo.
echo ���ɽ����������

echo ɾ��ԭ����Dll�ļ�
cd ..
rd /s /q DllFile
md DllFile

echo.
echo ������Ŀ�����ļ�
copy AssemblyInfo.cs CSharpFile

echo �������ݽṹdll
cd CSharpFile
C:\Windows\Microsoft.NET\Framework\v2.0.50727\Csc.exe /noconfig /warn:0 /optimize /nologo /reference:../ProtogGen/protobuf-net.dll /out:../DllFile/PBMessage.dll /target:library *.cs 

echo �������ݽṹDll���

echo ɾ�����Ƶ���Ŀ�����ļ�
del ..\CSharpFile\AssemblyInfo.cs

echo.
echo ׼���������л�dll
echo ��������dll
cd ..\ProtoPen
copy protobuf-net.dll ..\DllFile

echo Ԥ����
cd ..\Precompile
precompile ..\DllFile\PBMessage.dll -o:PBMessageSerializer.dll -t:PBMessageSerializer 

echo �������л�dll���
echo �ƶ����л�dll���ļ���
move PBMessageSerializer.dll ..\DllFile

echo ɾ������dll
del ..\DllFile\protobuf-net.dll

echo.
echo ����ȫ��dll�ɹ�

echo.
echo ��dll�Ƶ��ͻ�����Ŀ��
echo f|xcopy ..\DllFile\PBMessage.dll ..\..\MyFrame\Assets\Test\Protobuf\\PBMessage.dll /d /y
echo f|xcopy ..\DllFile\PBMessageSerializer.dll ..\..\MyFrame\Assets\Test\Protobuf\PBMessageSerializer.dll /d /y


echo.

pause
exit