#!/bin/bash
# Get current UTC time in RFC 3339 format for point-in-time recovery

# Get and display the current UTC time in RFC 3339 format
echo "Current UTC time in RFC 3339 format (for point-in-time recovery):"
date --rfc-3339=seconds

echo "\nIMPORTANT: Save this timestamp! You will need it for the point-in-time recovery."
echo "Wait a few moments before making changes to ensure your changes occur after this timestamp."
echo "\nThis timestamp represents the moment before your changes that you want to recover to."
