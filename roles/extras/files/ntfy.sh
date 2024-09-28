#!/bin/bash

# Default topic file
TOPIC_FILE="$HOME/.config/ntfy/default-topic.txt"

# Function to display usage instructions
function usage() {
    echo "Usage:"
    echo "  $0 [-t topic] pub 'your message here'   # publish to a topic"
    echo "  $0 [-t topic] sub                       # subscribe to a topic"
    exit 1
}

# Initialize variables
TOPIC=""

# Parse options
while getopts ":t:" opt; do
  case $opt in
    t)
      TOPIC="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      usage
      ;;
  esac
done

shift $((OPTIND -1))

# If TOPIC is not set via -t, read from the default topic file
if [ -z "$TOPIC" ]; then
    if [ -f "$TOPIC_FILE" ]; then
        TOPIC=$(cat "$TOPIC_FILE")
    fi
fi

# Check if TOPIC is still empty
if [ -z "$TOPIC" ]; then
    echo "Error: Topic is not defined."
    echo "Please set a default topic in '$TOPIC_FILE' or use the '-t' option."
    exit 1
fi

# If no arguments provided, prompt the user
if [ "$#" -lt 1 ]; then
    echo "No command provided."
    echo "Choose an option:"
    echo "1) Publish a message"
    echo "2) Subscribe to messages"
    read -p "Enter choice [1 or 2]: " choice

    case "$choice" in
        1)
            COMMAND="pub"
            ;;
        2)
            COMMAND="sub"
            ;;
        *)
            echo "Invalid choice."
            exit 1
            ;;
    esac
else
    # Get the command (pub or sub)
    COMMAND="$1"
    shift
fi

case "$COMMAND" in
    pub)
        # If message is provided as argument, use it; else prompt for message
        if [ "$#" -gt 0 ]; then
            MESSAGE="$*"
        else
            read -p "Enter your message: " MESSAGE
        fi
        if [ -z "$MESSAGE" ]; then
            echo "Error: No message provided."
            exit 1
        fi
        # Publish the message
        curl -d "$MESSAGE" ntfy.sh/$TOPIC
        ;;
    sub)
        # Subscribe to messages
        echo "Listening for messages on topic '$TOPIC'..."
        curl -s ntfy.sh/$TOPIC/raw
        ;;
    *)
        # Invalid command
        echo "Error: Unknown command '$COMMAND'."
        usage
        ;;
esac
