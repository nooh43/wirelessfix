 
#!/bin/bash
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| CentOS8 Initialization - Wireless fix
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| This script fixes issues associated with wireless
#| drivers not being identified by the system.
#| The effected drivers are the Broadcom 802.11 Linux 
#| STA Driver for WiFi, a Linux device driver for use
#| with Broadcom's BCM4311-, BCM4312-, BCM4313-, 
#| BCM4321-, BCM4322-, BCM43142-, BCM43224-, BCM43225-,
#| BCM43227-, BCM43228-, BCM4331-, BCM4360 and -BCM4352
#| - based hardware.
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Version : V 0.0.1
#| Author  : Nasser Alhumood
#| .-.    . . .-.-.
#| |.|.-.-|-.-|-`-..-,.-.. .
#| `-``-`-'-' ' `-'`'-'   `
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Preparation stage
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Desciption   : In this stage we will update the
#| system then proceed by installing LAMP packages and
#| mod_ssl. 
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Environment  : update, install, config-manager
#| Packages     : epel, rpmfusion
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
    # Clearing the terminal
    clear
echo -ne "Preparation stage           [\e[1;30;1;1;47min progress\e[0m]\r"
{
    # System update
    sudo dnf update -y
    # RPM Fusion repository install
    sudo dnf -y install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
    sudo dnf -y install --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
    sudo dnf config-manager --enable PowerTools
    # System update after adding the repository
    sudo dnf update -y
} &> /dev/null
echo -ne "Preparation stage           [\e[1;37;1;1;42m   +done   \e[0m]"
echo
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Action stage
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Desciption   : In this step we will attempt to fix
#| the issue by installing broadcom-wl package
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Environment  : install
#| Packages     : wordpress(curl)
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
echo -ne "Action stage                [\e[1;30;1;1;47min progress\e[0m]\r"
{
    # Installing broadcom-wl package
    sudo dnf -y install broadcom-wl
    # Make sure the system is update
    sudo dnf -y update
} &> /dev/null
echo -ne "Action stage                [\e[1;37;1;1;42m   +done   \e[0m]"
echo
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Finishing Stage
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Desciption   : In this stage we will instruct the
#| user on what to do next.
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#| Environment  : (NONE)
#| Packages     : (NONE)
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
    echo
    echo -e "\e[31;1m  The problem is most likley fixed now, please reboot your system.  \e[0m"
#|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#