#!/bin/bash

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

# Simulate an API response
MOCK_RESPONSE='{
  "id": "mock-device-id",
  "attributes": {
    "IdentityEmail": "mockuser@example.com"
  }
}'

# Retrieve the current device's Addigy device ID using jq
DEVICE_ID=$(echo $MOCK_RESPONSE | jq -r '.id')
if [ -z "$DEVICE_ID" ]; then
    echo "Error: Unable to retrieve device ID."
    exit 1
fi
echo "Simulated Device ID: $DEVICE_ID"

# Retrieve the user's email address from the mocked response using jq
USER_EMAIL=$(echo $MOCK_RESPONSE | jq -r '.attributes.IdentityEmail')
if [ -z "$USER_EMAIL" ]; then
    echo "Error: Unable to retrieve user email from the simulated response."
    exit 1
else
    echo "Simulated User Email: $USER_EMAIL"
fi

# Output to verify script execution
echo "Script executed successfully with the simulated environment."
