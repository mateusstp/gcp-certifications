#!/bin/bash
# Get current UTC time in 24 hour format

# Get and display the current UTC time
echo "Current UTC time in 24 hour format:"
date +"%R"

echo "\nIMPORTANT: You need to specify a backup start time that is EARLIER than the time displayed above."
echo "For example, if the current time is 14:25, you could use 13:25 or 12:00."
echo "Make sure it's a valid time in 24 hour format (HH:MM)."
