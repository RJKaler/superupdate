#!/bin/bash

set -euo pipefail



if ! [[ -d "$HOME/logs" ]]; then
    mkdir -vp "$HOME/logs"
fi

shortname="$(basename "$0")"

logfile="$HOME/logs/$shortname.log"

proc() {
    {
        echo "updated via superupdate"
        date
        echo "========================="

    } >> "$logfile"

}

{

    sudo apt-get update &&
    sudo apt-get upgrade -y
    proc
    echo "finished!"

} 2>&1  | tee -a "$logfile"
