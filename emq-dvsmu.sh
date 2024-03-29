cat > /bin/menu-dvs <<- "EOF"
#!/bin/bash
while : ; do
choix=$(whiptail --title "Proyect EA1HG Menu DVSwitch Multi" --menu "Nota : Debe encender Dvswitch antes de editar para utilizar." 20 60 11 \
1 " Encender Dvswitch " \
2 " Apagar Dvswitch " \
3 " Editar Dvswitch Server " \
4 " Cambiar Puerto http de Dashboard " \
5 " Dashboard on  " \
6 " Dashboard off  " \
7 " DVSMU  " \
8 " Menu Principal " 3>&1 1>&2 2>&3)
exitstatus=$?
#on recupere ce choix
#exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $choix
else
    echo "You chose cancel."; break;
fi
# case : action en fonction du choix
case $choix in
1)
sudo systemctl restart quantar_bridge.service && sudo systemctl enable quantar_bridge.service && sudo systemctl restart p25parrot.service && sudo systemctl enable p25parrot.service && sudo systemctl restart ysfparrot.service && sudo systemctl enable ysfparrot.service && sudo systemctl restart nxdnparrot.service && sudo systemctl enable nxdnparrot.service && sudo systemctl restart ircddbgatewayd.service && sudo systemctl enable ircddbgatewayd.service && sudo systemctl restart analog_bridge.service && sudo systemctl restart mmdvm_bridge.service && sudo systemctl restart nxdngateway.service && sudo systemctl restart p25gateway.service && sudo systemctl restart ysfgateway.service && sudo systemctl enable analog_bridge.service && sudo systemctl enable mmdvm_bridge.service && sudo systemctl enable nxdngateway.service && sudo systemctl enable p25gateway.service && sudo systemctl enable ysfgateway.service ;;
2)
sudo systemctl stop quantar_bridge.service && sudo systemctl disable quantar_bridge.service && sudo systemctl stop p25parrot.service && sudo systemctl disable p25parrot.service && sudo systemctl stop ysfparrot.service && sudo systemctl disable ysfparrot.service && sudo systemctl stop nxdnparrot.service && sudo systemctl disable nxdnparrot.service && sudo systemctl stop ircddbgatewayd.service && sudo systemctl disable ircddbgatewayd.service && sudo systemctl stop analog_bridge.service && sudo systemctl stop mmdvm_bridge.service && sudo systemctl stop nxdngateway.service && sudo systemctl stop p25gateway.service && sudo systemctl stop ysfgateway.service && sudo systemctl disable analog_bridge.service && sudo systemctl disable mmdvm_bridge.service && sudo systemctl disable nxdngateway.service && sudo systemctl disable p25gateway.service && sudo systemctl disable ysfgateway.service && rm /var/log/mmdvm/*;;
3)
sudo /usr/local/dvs/dvs ;;
4)
nano /lib/systemd/system/http.server-dvs.service && sudo systemctl daemon-reload ;;
5)
sudo systemctl restart http.server-dvs.service && sudo systemctl enable http.server-dvs.service ;;
6)
sudo systemctl stop http.server-dvs.service && sudo systemctl disable http.server-dvs.service ;;
7)
dvsmu ;;
8)
break;
esac
done
exit 0
EOF
#
sudo wget https://github.com/hp3icc/dvsmu/raw/main/setup
sudo chmod +x setup
sudo ./setup
