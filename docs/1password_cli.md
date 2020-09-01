# 1password CLI tool

https://support.1password.com/command-line-reference/
https://support.1password.com/command-line-getting-started/

```
# signin to get a token and run some "read" commands
eval $(op signin magnetic.1password.com nicolas@magnetic.com)
op list items --vault Engineering
op get --vault Engineering item devpi --fields username

# create a "login" type item in the Engineering vault
op create item login --vault Engineering title="Ansible Vault Password" password="CHANGEME" tags=ansible,vault,ansible-vault notes="Password for Ansible Vault files"
op get --vault Engineering item "Ansible Vault Password" --fields password

op create item login --vault Engineering title=WebLogin username=webuser password=changeme
op get --vault Engineering item WebLogin --fields username,password

# create a "password" type item in the Engineering vault
# WARNING: 'op create item **password**' had issues with the Ansible onepassword lookup plugin.. I had to use 'op create item **login**'
op create item Password --vault Engineering title="MyPassword" password="CHANGEME" tags=mypass notes="My secret password"
op get --vault Engineering item "MyPassword" --fields password
```
