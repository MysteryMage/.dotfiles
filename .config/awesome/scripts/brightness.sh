if [[ $1 = "increase" ]] then
    brightnessctl -q s +$2%
elif [[ $1 = "decrease" ]] then 
    brightnessctl -q s $2%-
fi

brightnessctl -m | awk -F ',' '{print $4}' | cut -d "%" -f 1
