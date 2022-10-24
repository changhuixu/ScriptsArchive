# delete local branches
git branch -D `git branch | grep -E '*PARCUST-*'`

# delete remote branches
git push origin --delete `git branch -r | awk -F/ '/\/PARCUST-/{print $2 "/" $3}'`
git push origin --delete `git branch -r | awk -F/ '/\/parcust-/{print $2 "/" $3}'`

git branch -r | awk -F/ '/\/feature/{print $2 "/" $3}'
git push origin --delete `git branch -r | awk -F/ '/\/feature/{print $2 "/" $3}'`

###################################################################

# Delete all local tags and get the list of remote tags:
git tag -l | xargs git tag -d
git fetch

# Remove all remote tags
git tag -l | xargs -n 1 git push --delete origin

# Clean up local tags
git tag -l | xargs git tag -d