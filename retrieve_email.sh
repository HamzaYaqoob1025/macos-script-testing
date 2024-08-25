#!/bin/bash

# Configuration (These values won't be used since we're mocking the data)
ADDIGY_API_KEY="YOUR_ADDIGY_API_KEY"
ADDIGY_API_SECRET="YOUR_ADDIGY_API_SECRET"

# Simulate Device ID retrieval
DEVICE_ID="mock-device-id"
echo "Simulated Device ID: $DEVICE_ID"

# Simulate User Email retrieval
USER_EMAIL="mockuser@example.com"
echo "Simulated User Email: $USER_EMAIL"

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

# Output to verify script execution
echo "Script executed successfully with the simulated environment."
