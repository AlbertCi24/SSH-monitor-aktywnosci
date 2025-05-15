#!/bin/bash


podejrzane=("Faild password" "Invalid user" "Disconnected from" "Maximum authentication attempts")

raport="raport.txt"
echo "======RAPORT=======" >> "$raport"





while read -r linia; do
	for fraza in "${podejrzane[@]}"; do
		if [[ "$linia" == *"$fraza"* ]]; then
			echo "[ALERT] $(date '+%F %T') $linia" >> raport.txt
		fi
	done
done < <(journalctl -u ssh -f)
