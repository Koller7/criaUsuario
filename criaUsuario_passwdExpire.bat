@echo off

net user scanner scanner /add
net localgroup administradores  scanner  /add

control userpasswords2

WMIC USERACCOUNT WHERE Name='scanner' SET PasswordExpires=FALSE
 
echo "-----------------------------"
echo "Expiracao de senha desativada"
echo "-----------------------------"

echo "-----------------------------"
if exist "c:\scanner" (
	echo "Pasta Scanner ja existe"
)else (
	md c:\scanner
	echo "Pasta scanner criada no c:"
)
echo "-----------------------------"

net share scanner=c:\scanner /grant:todos,FULL

REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d "00000001"

pause



