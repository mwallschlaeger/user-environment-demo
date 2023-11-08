# user-environment-demo
This a demo showcase repository to describe how to share bashrc extensions, environment variables and secrets like ssh keys and config files between multiple workstation using git and sops. 


## GPG Key Generation
- https://github.com/getsops/sops/tree/0494bc41911bc6e050ddd8a5da2bbb071a79a5b7#up-and-running-in-60-seconds
- https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key


```
gpg --default-new-key-algo rsa4096 --gen-key
```

## Include Into Userspace

```
export BASHRC_ADDITIONS_INIT="/PATH_TO_GITREPO/user-environment-demo/bashrc_additions/init.sh"
load_bashrc_additions() {
	source "$BASHRC_ADDITIONS_INIT"
}
load_bashrc_additions()
```