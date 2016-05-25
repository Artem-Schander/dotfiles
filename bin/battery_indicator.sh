#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

SYMBOL_FULL='|'
SYMBOL_EMPTY='|'

SECTIONS=10 # max 1000

if [[ `uname` == 'Linux' ]]; then
  current_charge=$(cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}')
  total_charge=$(cat /proc/acpi/battery/BAT1/info | grep 'last full capacity' | awk '{print $4}')
else
  battery_info=`ioreg -rc AppleSmartBattery`
  current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
  total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
fi

charged_slots=$(echo "($current_charge/$total_charge*$SECTIONS)+0.5" | bc -l | cut -d '.' -f 1)
if [[ $charged_slots -gt $SECTIONS ]]; then
  charged_slots=$SECTIONS
fi

echo -n '#[fg=colour196] '
for i in `seq 1 $charged_slots`; do echo -n "$SYMBOL_FULL"; done

if [[ $charged_slots -lt $SECTIONS ]]; then
  echo -n '#[fg=colour251]'
  for i in `seq 1 $(echo "$SECTIONS-$charged_slots" | bc)`; do echo -n "$SYMBOL_EMPTY"; done
fi
