# Set up system variables.
# snap set system pi-config.display-rotate=1

# Install required third-party snaps.
snap install network-manager
echo "check if candidate channel is still required for mir-kiosk"
snap install --candidate mir-kiosk

sudo hostnamectl set-hostname 'glancr'
snap install avahi

echo "install the modified chromium snap"
echo "then connect chromium-mir-kiosk:browser-sandbox to core:browser-support"
# snap install --beta chromium-mir-kiosk

# Configure network.
network-manager.nmcli d set wlan0 autoconnect yes

# Configure chromium-mir-kiosk
snap set chromium-mir-kiosk resettime=720 hidecursor=true url="http://localhost/display"
snap connect chromium-mir-kiosk:browser-sandbox :browser-support

# Connect required interfaces.
snap connect mirros-one:network-manager network-manager:service
snap connect mirros-one:network-control :network-control

echo "configure rotation with `sudo editor /var/snap/mir-kiosk/current/miral-kiosk.display`, then restart mir-kiosk and chromium-mir-kiosk"

# Set a local login password to allow login without our SSH key.
# echo -e "glancr\!2018\nglancr\!2018" | sudo passwd glancr

# Enable an additional GB of swap
cp /etc/default/swapfile .
sed -i.bak -e "s/^SIZE=0$/SIZE=1024/" swapfile
sudo cp swapfile /etc/default/
rm swapfile swapfile.bak
sudo systemctl enable --now swapfile.service