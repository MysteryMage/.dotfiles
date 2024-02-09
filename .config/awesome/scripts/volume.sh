if [[ $1 = "increase" ]] then
    pactl set-sink-volume @DEFAULT_SINK@ +$2%
elif [[ $1 = "decrease" ]] then 
    pactl set-sink-volume @DEFAULT_SINK@ -$2%
fi

pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1
