# Hashicorp Vault

## Exports

```
VAULT_TOKEN=s.23e4dskwerl2233
VAULT_ADDR=http://127.0.0.1:8200
VAULT_CAPATH="tls/ca/crt"
```

## Run Vault

### With Docker

```
docker exec -it $(docker run -d -v /keybase/private/nicolasg7/src/hvault:/vault --cap-add=IPC_LOCK vault server) /bin/sh
```

### Native OS

```
export VAULT_ADDR='http://127.0.0.1:8200'
vault server -config ~/hvault/config.hcl
vault init
vault operator unseal "Unseal Token 1,2,3"
vault auth <Initial Root Token>
```

## Using Vault

### write / read secrets

```
vault write secret/mysql_database_credentials username=user1 password=userpasssword888
vault read secret/mysql_database_credentials
vault read -format=json secret/mysql_database_credentials
```

### MacOS daemon ?

```
bash -c "nohup sh -c 'while true; do date; sleep 1; done' &"
```

## Other

To configure the local CLI tool, create a configuration file for the Vault CLI at ~/.vault:

```
# ~/.vault
token_helper = "/full/path/to/token-helper.rb"
```

## Ansible example

```
  post_tasks:
    - name: retrieve secret
      debug:
        msg: "{{ lookup('hashi_vault', 'secret=secret/hello')}}" #token=c975b780-d1be-8016-866b-01d0f9b688a5 url=http://myvault:8200')}}"
      tags: that
```
