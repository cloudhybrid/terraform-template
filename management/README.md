#Note
```sh
If client agree then you must have management part in a separate VPC atleast, if possible in a separate aws account altogether
```

# This is management module and this module will be having management related stuff like 
- sonar, jenkins, elk stack, nexus etc...

# If you feel like there needs to be further segregation as well like:
- db `if using any sort of dedicated database like for zabbix` then please go ahead and create db as well
