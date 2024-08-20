## Settings
1. Remove delay on caps lock: (quick way not persistent `hidutil property --set '{"CapsLockDelayOverride":0}'`)
   1. `mkdir -p ~/Library/LaunchAgents`
   2. `vim ~/Library/LaunchAgents/com.user.hidutil.plist`
   3. add xml to .plist
  ```xml
     <?xml version="1.0" encoding="UTF-8"?>
     <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
     <plist version="1.0">
     <dict>
       <key>Label</key>
       <string>com.user.hidutil</string>

      <key>ProgramArguments</key>
      <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>{"CapsLockDelayOverride":0}</string>
      </array>

      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
  ```
   4. launch agent: `launchctl load ~/Library/LaunchAgents/com.user.hidutil.plist`
   5. check that agent is running: `launchctl list | grep com.user.hidutil`
4. Improve repeat behavior: KeyRepeatRate=Fast; DelayUntilRepeat=Short-1

todo: make these (4.) configs doable through commands only
