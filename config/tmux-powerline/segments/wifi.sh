
airport_path="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

run_segment() {
    # Check if airport is available
    if [[ ! -x $airport_path ]]; then
        echo "$airport_path: not found" 1>&2
        exit 1
    fi

    if air_info=($(eval "$airport_path" -I | grep -E "^ *(agrCtlRSSI|state|SSID|lastTxRate):" | awk '{print $2}')) ; then
      rssi=${air_info[0]}
      state=${air_info[1]}
      rate=${air_info[2]}
      ssid=${air_info[3]}

      case "$state" in
        "running" )
          signals=(▁ ▂ ▄ ▆ █)
          signal=""
          rssi_=$(expr 5 - ${rssi} / -20)
          for ((i=0; i < 5; i++ )); do
            if [ $i -lt $rssi_ ]; then
                signal="${signal}${signals[$i]}"
            else
                signal="${signal} "
            fi
          done
          airport_=" ${ssid} |${signal}| ${rate}Mbs"
        ;;
        "init"    ) airport_="#[fg=yellow] ... " ;;
        *         ) airport_="#[fg=red] ✘  " ;;
      esac  
      echo "${airport_} "
      fi
}
