# LICENSE This code is not under the same license as the rest of the project as it's "stolen". It's cloned from https://github.com/richoH/dotfiles/blob/master/bin/battery and just some modifications are done so it works for my laptop. Check that URL for more recent versions.

HEART_FULL="🁢"

run_segment() {
    if battery_info=$(/usr/bin/pmset -g ps | awk '{ if (NR == 2) print $3 " " $4 }' | sed -e "s/;//g" -e "s/%//") ; then
        battery_quantity=$(echo $battery_info | awk '{print $1}')
        if [[ ! $battery_info =~ "discharging" ]]; then
            battery="⚡︎ $battery_quantity%"
            if (( $battery_quantity == 100 )); then
                echo -n "#[fg=colour214]"
            else
                echo -n "#[fg=colour19]"
            fi
        else
            battery="${HEART_FULL} $battery_quantity%"
            if (( $battery_quantity < 16 )); then
                echo -n "#[fg=red]"
            fi
        fi
        echo $battery
    fi
}
