#!/bin/bash
 
# Display Menu Options
function show_menu() {
        echo "-------------------------"
        echo "     Main Menu"
        echo "-------------------------"
                echo "1. IP Address"
                echo "2. CPU"
                echo "3. Memory"
                echo "4. Disk Space"
                echo "5. MAC Adress"
                echo "6. exit"
 
}


# Function IP
function ip_address() {
        echo "System IP Address"
        ifconfig | grep 'inet.*broadcast' |cut -d ':' -f 2|awk 'NR==1{print$2}'
        echo ""
}
 
 
# Function CPU Load
function cpu_load() {
        echo "System CPU Load"
        top -l 1 | grep 'CPU usage:'
        echo ""
}
 
# Function System available memory
function mem() {
        echo "System available memory"
        top -l 1 |grep 'PhysMem:' 
        echo ""
}
 
# Function Disk Space
function disk_space() {
        echo "Available disk space"
        df -h | awk '$NF=="/"{printf "%s\t\t", $4}'
        echo ""
}
 
# Function MAC Address
function mac_address() {
        echo "System MAC Address"
        ifconfig |grep 'ether' | tr -d ' ' |tr -d '\t' |cut -c 6-42 |awk 'NR==2{print$1}'
        echo ""
}
 
# Collect input from user
while :
do
        show_menu
        read -p "Enter your selection [ 1 - 6 ] " c
                options=("check")
 
                case $c in
                        1) ip_address ;;
                        2) cpu_load ;;
                        3) mem ;;
                        4) disk_space ;;
                        5) mac_address ;;
                        6) echo "Adios"; exit 0 ;;
                        *)
                        echo "Select from 1 to 6 only." ;;
                esac
done
