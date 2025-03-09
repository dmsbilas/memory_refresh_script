# memory_refresh_script

## Give execute permission to the script
```bash
chmod +x auto_refresh_memory.sh
```

## Run the script manually
```bash
sudo ./auto_refresh_memory.sh
```

## Automate It (Run Every 5 Minutes)
```bash
sudo crontab -e
``` 


## Add the script to crontab
```bash
*/5 * * * * /path/to/auto_refresh_memory.sh >> /var/log/memory_refresh.log 2>&1
```
This runs the script every 5 minutes and logs output to /var/log/memory_refresh.log.

## Verify the Script
```bash
sudo tail -f /var/log/memory_refresh.log
```

