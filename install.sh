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

echo "-----------------------"
echo "Downloading key file..."
echo "-----------------------"
wget https://download.sysinternals.com/files/Procdump.zip
unzip Procdump.zip
rm Procdump.zip
mkdir ProcDump
mv ./procdump.exe ./ProcDump/procdump32.exe
mv ./procdump64.exe ./ProcDump/procdump64.exe
rm Eula.txt
mkdir WinPeas
cd WinPeas
# wget https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASany.exe
wget https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx64.exe
wget https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx86.exe
mv ./winPEASx86.exe ./winPEAS32.exe
mv ./winPEASx64.exe ./winPEAS64.exe
cd ..
mkdir BloodHound
cd BloodHound
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.exe
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.ps1
mv ./SharpHound.exe ./sharphound.exe
mv ./SharpHound.ps1 ./sharphound.ps1
cd ..
git clone https://github.com/TsukiCTF/Lovely-Potato.git
cd Lovely-Potato
mv ./Invoke-LovelyPotato.ps1 ./lovelypotato.ps1
mv ./JuicyPotato-Static.exe ./juicypotato.exe
rm README.md
cd ..
mv Lovely-Potato LovelyPotato
mkdir MimiKatz
cd MimiKatz
cp /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe ./mimikatz32.exe
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe ./mimikatz64.exe
cd ..
mkdir PowerShell
cd PowerShell
wget https://github.com/411Hall/JAWS/raw/master/jaws-enum.ps1
wget https://github.com/besimorhino/powercat/raw/master/powercat.ps1
wget https://github.com/HarmJ0y/PowerUp/raw/master/PowerUp.ps1
wget https://github.com/S3cur3Th1sSh1t/WinPwn/raw/master/WinPwn.ps1
wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Out-Minidump.ps1
wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Invoke-Mimikatz.ps1
wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Recon/PowerView.ps1
wget https://github.com/Kevin-Robertson/Powermad/raw/master/Powermad.ps1
mv ./jaws-enum.ps1 ./jawsenu.ps1
mv ./PowerUp.ps1 ./powerup.ps1
mv ./WinPwn.ps1 ./winpwn.ps1
mv ./Out-Minidump.ps1 ./minidump.ps1
mv ./Invoke-Mimikatz.ps1 ./mimikatz.ps1
mv ./Powermad.ps1 ./powermad.ps1
mv ./PowerView.ps1 ./powerview.ps1
cd ..
apt-get install rlwrap
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe
mv Rubeus.exe ./MimiKatz/rubeus.exe
chmod +x ./ -R
echo "-----------------------------------"
echo "All Done!! - Downloads completed..."
echo "-----------------------------------"

#Eof
