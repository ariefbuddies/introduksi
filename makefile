GITREPO = git@github.com:ariefbuddies/introduksi.git
build:
	rm -rf public
	mkdir public
	git worktree prune
	rm -rf .git/worktrees/public/
	rm -rf public/*
	hugo

publish: build
	cd public && \
	git add --all && \
	git commit -m "Publish on `date`" && \
	git push -u origin master

serve:
	hugo serve --watch

init:
	touch README.md
	git init
	git add README.md 
	git commit -m "first commit"
	git remote add origin ${GITREPO}
	git push -u origin master
	git rm README.md
	git add ./*
	echo "public" > .gitignore
	git add .gitignore
	git commit -m "Add hugo files"
	git push -u origin master