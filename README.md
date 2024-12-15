# termux-desktop-xfce-fork

# Installation

```bash
curl -sLf https://raw.githubusercontent.com/qqdasb/termux-desktop-xfce/main/install.sh | bash
```

# Start desktop

```bash
termux-x11 {Your Display} &
export DISPLAY={Your display}
startdesktop-xfce4
```

And then open termux-x11 app, you will see the desktop start.

# Using compositor

```bash
termux-x11 {Your Display} &
export DISPLAY={Your display}
startdesktop-xfce4-gl4es
```
