@echo off
if exist "c:\scanner" (
	echo "Pasta scanner já existe"
)else (
	md c:\scanner
	echo "Pasta scanner criada no c:"
)



net user scanner scanner /add
net localgroup administradores  scanner  /add
control userpasswords2



net share scanner=c:\scanner /grant:todos,FULL


REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d "00000001"




