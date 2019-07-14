
lpass login <login name>
lpass ls
printf "Username: XXXXXX\nPassword: YYYYYYY" | lpass add dotfiles/SECRET_NAME --non-interactive
lpass show  dotfiles/SECRET_NAME
