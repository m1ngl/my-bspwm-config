# my-bspwm-config
随便存放一点我的bspwm的手搓配置文件

以后可能会用到

## 合成器配置
- 合成器picom我用的是[yaocccc](https://github.com/yaocccc/picom)的复刻，它具有更丰富的动画，并且修复了很多[bug](https://www.bilibili.com/video/BV19T411G7Eq)，但是要自己编译

## 组件
```bash
# pacman -S bspwm sxhkd polybar rofi ranger alacritty neofetch xfce4-notifyd
```
- 额外组件：xfce4-power-manager feh xfce4-volumed-pulse\[[AUR](https://aur.archlinux.org/packages/xfce4-volumed-pulse-git)\]，另外，新增一个st（simple terminal）脚本，st取自[storm1614](https://github.com/storm-1614/dotfiles/tree/main/st)的配置
## 安装
- 以普通用户身份运行
```bash
$ ./installer.sh
```
