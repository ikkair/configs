#!/bin/bash
deviceDir="/dev/mapper/"
mountDir="/media/Local Disk"
deviceDir+=$(ldmtool create all | grep -o '"[^"]*"' | sed 's/"//g')
mount "$deviceDir" "$mountDir" 
