# delete local branches
git branch -D `git branch | grep -E '*PARCUST-*'`

# delete remote branches
git push origin --delete `git branch -r | awk -F/ '/\/PARCUST-/{print $2 "/" $3}'`
git push origin --delete `git branch -r | awk -F/ '/\/parcust-/{print $2 "/" $3}'`

git branch -r | awk -F/ '/\/feature/{print $2 "/" $3}'
git push origin --delete `git branch -r | awk -F/ '/\/feature/{print $2 "/" $3}'`