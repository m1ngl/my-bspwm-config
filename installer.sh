export Modules_List="xfce4-volumed-pulse xce4-power-manager sxhkd polybar fcitx5 picom feh dunst /usr/lib/gpaste/gpaste-daemon"
export UnAccess_Module=
export Access_Module=

for j in xfce4-volumed-pulse xfce4-power-manager sxhkd polybar fcitx5 picom feh dunst /usr/lib/gpaste/gpaste-daemon
do
    case $j in
    xfce4-volumed-pulse)
        export pulse="xfce4-volumed-pulse &";;
    xfce4-power-manager)
        export power="xfce4-power-manager &";;
    sxhkd)
        export sxhkd="sxhkd &";;
    polybar)
        export polybar="~/.config/polybar/launch.sh";;
    fcitx5)
        export fcitx5="fcitx5 &";;
    picom)
        export picom="picom --experimental-backends --config ~/.config/picom/picom.conf &";;
    feh)
        export feh="feh --bg-scale ~/day.png &";;
    dunst)
        export dunst="dunst &";;
    /usr/lib/gpaste/gpaste-daemon)
        export paste="/usr/lib/gpaste/gpaste-daemon &";;
    esac
done

for i in xfce4-volumed-pulse xfce4-power-manager sxhkd polybar fcitx5 picom feh dunst /usr/lib/gpaste/gpaste-daemon
do
    if ! command -v $i &>/dev/null; then
        export UnAccess_Module+=" $i"
        case $i in
        xfce4-volumed-pulse)
            export pulse="";;
        xfce4-power-manager)
            export power="";;
        sxhkd)
            export sxhkd="";;
        polybar)
            export polybar="";;
        fcitx5)
            export fcitx5="";;
        picom)
            export picom="";;
        feh)
            export feh="";;
        dunst)
            export dunst="";;
        /usr/lib/gpaste/gpaste-daemon)
            export paste="";;
        esac
    fi
done

[ -z "$UnAccess_Module" ] || echo "警告:缺失 $UnAccess_Module 组件"

for folders in alacritty bspwm dunst neofetch picom neofetch polybar ranger rofi sxhkd conkyrc
do
    cp -rv $folders ~/.config/
done

echo $power > ~/.config/bspwm/bspwmrc
echo $pulse >> ~/.config/bspwm/bspwmrc
echo $sxhkd >> ~/.config/bspwm/bspwmrc
echo $polybar >> ~/.config/bspwm/bspwmrc
echo $fcitx5 >> ~/.config/bspwm/bspwmrc
echo $picom >> ~/.config/bspwm/bspwmrc
echo $feh >> ~/.config/bspwm/bspwmrc
echo $dunst >> ~/.config/bspwm/bspwmrc
echo $paste >> ~/.config/bspwm/bspwmrc

cat <<BSPWM >> ~/.config/bspwm/bspwmrc
#工作区
bspc monitor -d 一 二 三 四 五 六 七 八 九 十

#窗口边框设置
bspc config border_width         3

#窗口间隔
bspc config window_gap           7

bspc config split_ratio          0.52
#单窗口模式设置
bspc config borderless_monocle   true
bspc config gapless_monocle      true

#边框颜色
bspc config focused_border_color "#B22222"
bspc config normal_border_color "#7FFF00"
#只有一个窗口时开启单窗口模式
bspc config single_monocle false
#bspc config focus_follows_pointer true
bspc rule -a Thunar state=floating

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a Gedit state=floating

BSPWM
