#!/bin/bash

# Configuration
ADDIGY_API_KEY="YOUR_ADDIGY_API_KEY"
ADDIGY_API_SECRET="YOUR_ADDIGY_API_SECRET"

# Check if jq is installed; if not, install it
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Installing jq directly from the official GitHub page..."
    echo "For more details, visit: https://github.com/jqlang/jq"
    curl -Lo /usr/local/bin/jq "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-osx-amd64"
    chmod +x /usr/local/bin/jq
    if ! command -v jq &> /dev/null; then
        echo "Error: Failed to install jq."
        exit 1
    fi
fi

# Retrieve the current device's Addigy device ID
DEVICE_ID=$(curl -s -X GET "https://api.addigy.com/api/v2/devices/current" -H "Authorization: Bearer $ADDIGY_API_KEY" | jq -r '.id')

if [ -z "$DEVICE_ID" ]; then
    echo "Error: Unable to retrieve device ID."
    exit 1
fi

# Retrieve the user's email address from Addigy API
USER_EMAIL=$(curl -s -X GET "https://api.addigy.com/api/v2/devices/$DEVICE_ID" -H "Authorization: Bearer $ADDIGY_API_KEY" | jq -r '.attributes.IdentityEmail')

if [ -z "$USER_EMAIL" ]; then
    echo "Error: Unable to retrieve user email from Addigy for the current user."
    exit 1
else
    echo "User email retrieved: $USER_EMAIL"
fi
