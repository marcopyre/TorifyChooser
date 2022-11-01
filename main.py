from termcolor import colored
import os
import subprocess
from subprocess import check_output


os.system('cls' if os.name == 'nt' else 'clear')


user = os.getenv("SUDO_USER")
if user is None:
    print(colored('Run this program as root', 'red'))
    exit()

f = os.popen('ls /usr/share/ | grep torify')
torify = f.read()
torify = torify.replace('\n','')
path = "/usr/share/" + torify+ "/data/torrc"


print(colored(
 " _______         _  __        _____ _\n"                             
 "|__   __|       (_)/ _|      / ____| |\n"                              
 "   | | ___  _ __ _| |_ _   _| |    | |__   ___   ___  ___  ___ _ __\n"
 "   | |/ _ \| '__| |  _| | | | |    | '_ \ / _ \ / _ \/ __|/ _ \ '__|\n"
 "   | | (_) | |  | | | | |_| | |____| | | | (_) | (_) \__ \  __/ |\n"   
 "   |_|\___/|_|  |_|_|  \__, |\_____|_| |_|\___/ \___/|___/\___|_|\n"   
 "                        __/ |\n"                                       
 "                       |___/",
    "magenta", attrs=["bold"]))
print("\nThis program is using Tor, sending sensible data is absolutely not recommended, use it as your own risks, developped for educational purpose only\n\nyour inputs are not filtered so be carrefull when you type (not idiot proof)\n----------------------------------------------------------------------------")

exitnode = input("choose what you want to do:\n[0] disconnect your proxy\n[1] connect proxy to a specific country\n\n")

if exitnode == "0":
    os.system('cls' if os.name == 'nt' else 'clear')
    subprocess.call([torify, "-c"], stdout=open(os.devnull, "w"), stderr=subprocess.STDOUT)
    print("----------------------------------------------------------------------------\nDisconnected\n----------------------------------------------------------------------------")

elif exitnode == "1":
    subprocess.call([torify, "-c"], stdout=open(os.devnull, "w"), stderr=subprocess.STDOUT)
    os.system('cls' if os.name == 'nt' else 'clear')
    exitnode = input("----------------------------------------------------------------------------\nchoose the country you want the proxy in (web extension format ex: fr): ")
    file = open(path, "r")
    replaced_content = ""
    exists = False
    for line in file:

        line = line.strip()
        if "ExitNodes" in line:
            new_line = "ExitNodes {" + exitnode + "} StrictNodes 1"
            exists = True
        elif line == "VirtualAddrNetworkIPv4 10.192.0.0/10":
            new_line = "VirtualAddrNetworkIPv4 10.192.0.0/10"
        elif line == "AutomapHostsOnResolve 1":
            new_line = "AutomapHostsOnResolve 0"
        else:
            new_line = line
        replaced_content = replaced_content + new_line + "\n"
    if exists == False:
        replaced_content = replaced_content + "ExitNodes {" + exitnode + "} StrictNodes 1" + "\n"

    file.close()
    write_file = open(path, "w")
    write_file.write(replaced_content)
    write_file.close()

    connection = str(check_output([torify, "-t"]))


    if "Transparent Proxy activated, your system is under Tor" in connection:
        print("Connected\n----------------------------------------------------------------------------")
    else:
        print("Error: \n" + connection + "\n----------------------------------------------------------------------------")