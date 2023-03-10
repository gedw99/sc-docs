
### GIT

COMMIT_MESSAGE='added more ...'

git-all: git-pull git-commit git-push
	# here is how you add your commit message...
	# e.g  make git-all COMMIT_MESSAGE='custom message'


## git-commit
git-commit:
	# here is how you add your commit message...
	# e.g   make git-commit COMMIT_MESSAGE='custom message'
	@echo ""
	@echo "-- git commiting --"
	@echo "COMMIT_MESSAGE:    $(COMMIT_MESSAGE)"
	

	git add --all
	git commit -am "$(COMMIT_MESSAGE)"

git-config-set:
	# just do this :)
	#git config user.name "Your Name"
    #git config  user.email you@example.com
git-config-fork-set:
	# the commands to modify git config for remote
	#  TODO: See the https://github.com/gedw99/sc-make proejct that does all this


## git-pull
git-pull:
	@echo ""
	@echo "-- git pulling --"
	git pull 

## git-push
git-push:
	@echo ""
	@echo "-- git pushing --"
	git push 
	open $(GIT_UPSTREAM_REPO_URL)


### MOD

mod-upgrade:
	go install github.com/oligot/go-mod-upgrade@latest
	go-mod-upgrade
	$(MAKE) mod-tidy
mod-tidy:
	go mod tidy