#!/bin/bash

KeySwitchManager=~/Bin/KeySwitchManager/KeySwitchManager.CLI.sh
DatabaseFile=KeySwitches.db

if [ ! -e ${KeySwitchManager} ]; then
    echo "KeySwitchManager.sh is not found"
    echo "  Variable \`\$KeySwitchManager\` is ${KeySwitchManager}"
    echo "## Open export.sh and modify"
    exit 1
fi

$KeySwitchManager cubase        -f $DatabaseFile -q -d "*" -o ./_out/Cubase
$KeySwitchManager studio-one    -f $DatabaseFile -q -d "*" -o ./_out/StudioOne
$KeySwitchManager cakewalk      -f $DatabaseFile -q -d "*" -o ./_out/Cakewalk
