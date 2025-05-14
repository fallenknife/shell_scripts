# shell_scripts
*Some of educational bash scripts for monitoring linux system*
## linux_status
The script runs without parameters.

Usage:
```sh
bash ./main 
```
The script output the following information:
```js
HOSTNAME = hostname
TIMEZONE = Asia/Novosibirsk UTC 7
USER = username
OS = Ubuntu 24.04.1 LTS
DATE = day month year HH:MM:SS
UPTIME = x days, y hours, z minutes
UPTIME_SEC = 239893
IP = ipv4 (eth0)
MASK = netmask (eth0)
GATEWAY = default_gateway
RAM_TOTAL = X GB
RAM_USED = Y GB
RAM_FREE = Z GB
SPACE_ROOT = X MB
SPACE_ROOT_USED = Y MB
SPACE_ROOT_FREE = Z MB
```

This output can be saved into a `timedate.txt` file 

## directory_info

The script is run with a single parameter.

The parameter is an absolute or relative path to a directory. The script returns the following information:
- Total number of folders, including subfolders;
- 5 folders with largest size in descending order (path and size);
- Total number of files;
- Number of configuration files , text files, executable files, log files , archives, symbolic links;
- 10 files with largest size in descending order (path, size and type);
- 10 executable files with largest size in descending order (path, size and hash);
-  Execution time of the script in seconds;

```sh
bash ./main /var/log/
```
