source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
# Start ssh-agent if it's not already running
if not pgrep -u $USER ssh-ageint > /dev/null
    eval (ssh-agent -c)
    # Add any other private keys you want to start here
    ssh-add ~/.ssh/github
end
