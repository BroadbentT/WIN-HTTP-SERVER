#!/bin/bash
# coding:UTF-8

# -------------------------------------------------------------------------------------
#                                Windows HTTP Server 
#                BY TERENCE BROADBENT BSC CYBER SECURITY (FIRST CLASS)
# -------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Download key components...
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

echo "------------------------"
echo "Downloading key files..."
echo "------------------------"
apt-get install rlwrap
mkdir ALL
cd ALL
wget "https://download.sysinternals.com/files/Procdump.zip" -O Procdump.zip
unzip Procdump.zip
rm Procdump.zip
mv ./Procdump/procdump64.exe ./
mv ./Procdump/procdump32.exe ./
rm ./Procdump/Eula.txt
rm ./Procdump/procdump64a.exe
rmdir Procdump
wget "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx64.exe" -O winpeas64.exe
wget "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx86.exe" -O winpeas32.exe
wget "https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.exe" -O sharphound.exe
wget "https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.ps1" -O sharphound.ps1
git clone https://github.com/TsukiCTF/Lovely-Potato.git
mv ./Lovely-Potato/Invoke-LovelyPotato.ps1 ./lovelypotato.ps1
mv ./Lovely-Potato/JuicyPotato-Static.exe ./juicypotato.exe
mv ./Lovely-Potato/test_clsid.bat ./
rm ./Lovely-Potato/README.md
rmdir Lovely-Potato
rm Eula.tzt
wget "https://raw.githubusercontent.com/WhiteWinterWolf/wwwolf-php-webshell/master/webshell.php" -O webshell.php
wget "https://github.com/411Hall/JAWS/raw/master/jaws-enum.ps1" -O jawsenum.ps1
wget "https://github.com/besimorhino/powercat/raw/master/powercat.ps1"-O powercat.ps1
wget "https://github.com/HarmJ0y/PowerUp/raw/master/PowerUp.ps1" -O powerup.ps1
wget "https://github.com/S3cur3Th1sSh1t/WinPwn/raw/master/WinPwn.ps1" -O winpwn.ps1
wget "https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Out-Minidump.ps1" -O mimidump.ps1
wget "https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Invoke-Mimikatz.ps1" -O mimilatz.ps1
wget "https://github.com/PowerShellMafia/PowerSploit/raw/master/Recon/PowerView.ps1" -O powerview.ps1
wget "https://github.com/Kevin-Robertson/Powermad/raw/master/Powermad.ps1" -O powermad.ps1
wget "https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe" -O rubeus.exe
wget "https://nmap.org/dist/nmap-7.80-setup.exe" -O nmapsetup.exe
cp /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe ./mimikatz32.exe
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe ./mimikatz64.exe
cp /usr/share/windows-resources/binaries/nc.exe nc.exe
cp /usr/share/windows-resources/binaries/plink.exe plink.exe
cd ..

echo "-----------------------------------"
echo "All Done!! - Downloads completed..."
echo "-----------------------------------"

#Eof
