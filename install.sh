#!/data/data/com.termux/files/usr/bin/env bash

clear

#this script will configure a graphical user interface
#(xfce4) in termux
#creator: @Yisus7u7v
#modifier: @qqdasb
cd $HOME
echo "Welcome to termux-desktop-xfce-fork!"
sleep 3
clear

echo -e "Install packages"
apt update && apt upgrade -y
echo "deb [trusted=yes] https://Yisus7u7.github.io/termux-desktop-xfce/packages desktop-xfce extras" > $PREFIX/etc/apt/sources.list.d/termux-desktop-xfce.list
apt update
apt install -y x11-repo
apt install -y xfce4 tigervnc xfce4-goodies termux-desktop-xfce breeze-cursor-theme kvantum ttf-microsoft-cascadia audacious leafpad pavucontrol-qt hexchat geany synaptic firefox termux-x11-nightly

echo "Backup data"
rm -rf $HOME/.backup
mkdir $HOME/.backup
mv $HOME/.config $HOME/.backup
cd $HOME

echo "Install themes"
wget https://github.com/Yisus7u7/termux-desktop-lxqt/releases/download/data/termux_desktop_lxqt_data.tar.xz
tar -xvf termux_desktop_lxqt_data.tar.xz
rm termux_desktop_lxqt_data.tar.xz
wget https://github.com/Yisus7u7/termux-desktop-xfce/releases/download/desktop-5.0.3/data.tar.xz
tar -xvf data.tar.xz
rm data.tar.xz
mv $PREFIX/share/kvantum/* $PREFIX/share/Kvantum

echo "Setup folders"
mkdir $HOME/Desktop
mkdir $HOME/Downloads
mkdir $HOME/Templates
mkdir $HOME/Public
mkdir $HOME/Documents
mkdir $HOME/Pictures
mkdir $HOME/Videos
termux-setup-storage
ln -s $HOME/storage/music Music

echo "Setup start scripts"
echo "dbus-launch --exit-with-session startxfce4" > $PREFIX/bin/startdesktop-xfce
echo "LD_PRELOAD=$PREFIX/lib/gl4es/libGL.so.1 dbus-launch --exit-with-session startxfce4" > $PREFIX/bin/startdesktop-xfce-gl4es
chmod a+x $PREFIX/bin/startdesktop-xfce*

cd $HOME

echo -e """\e[1;32menjoy!!
startdesktop-xfce: Start desktop
If you want to use xfce's compositor, you need to install gl4es and add the built lib to LD_PRELOAD.There is a prebuilt deb for all arches:https://github.com/qqdasb/termux-mesa-packages/actions/runs/12315957085. Then use startdesktop-xfce-gl4es to start desktop.\e[1m"""

exit
