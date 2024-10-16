#!/bin/bash

# Get id of mouse and the id of the field corresponding to natural scrolling
id=`xinput list | grep -i "mouse" | cut -d'=' -f2 | cut -d'[' -f1`

if [ ${id} ]; then
    natural_scrolling_id=`xinput list-props $id | \
        grep "Natural Scrolling Enabled (" \
        | cut -d'(' -f2 | cut -d')' -f1`

    # Set the property to true
    xinput --set-prop $id $natural_scrolling_id 1
else
    echo "No Mouse found"
fi
