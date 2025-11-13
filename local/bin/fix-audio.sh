#!/bin/bash
# Auto-configure audio on CachyOS using PipeWire + WirePlumber

# Start PipeWire and WirePlumber if not already running
systemctl --user start wireplumber
systemctl --user start pipewire pipewire-pulse

# Detect first connected Bluetooth audio sink
BT_SINK=$(pactl list short sinks | grep bluez_output | awk '{print $1}' | head -n1)
if [ -z "$BT_SINK" ]; then
    echo "No Bluetooth sink detected, using current default."
    BT_SINK=$(pactl info | grep "Default Sink" | awk '{print $3}')
fi

# Detect Yeti microphone
MIC=$(pactl list short sources | grep 'Yeti' | awk '{print $1}' | head -n1)
if [ -z "$MIC" ]; then
    echo "No Yeti microphone detected, using current default."
    MIC=$(pactl info | grep "Default Source" | awk '{print $3}')
fi

# Set default sink and source
pactl set-default-sink "$BT_SINK"
pactl set-default-source "$MIC"

# Move all existing audio streams to the Bluetooth sink
pactl list short sink-inputs | awk '{print $1}' | xargs -I{} pactl move-sink-input {} "$BT_SINK"

echo "Audio auto-configured: Sink=$BT_SINK, Mic=$MIC"
