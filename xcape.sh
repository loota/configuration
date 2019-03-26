xcape -e "Control_L=Control_R|Super_L|Left"
xcape -e "Control_R=Control_R|Super_L|Right"
xcape -e "Shift_R=Shift_R|Alt_L|Tab"     
xcape -e "Shift_L=Alt_L|Tab"

spare_modifier="Hyper_L"

xmodmap -e "keycode 66 = $spare_modifier"
xmodmap -e "remove mod4 = $spare_modifier"
xmodmap -e "add Control = $spare_modifier"

xmodmap -e "keycode any = 9"

xcape -e "$spare_modifier=Escape"


