// to checkout a local branch that you want to work on
git checktout branchname 
// view the branch you have locally
git branch

// set up tracking for existing branch (local -> remote)
git branch --set-upstream-to=<remote>/<remote branch> <local checkout branch>

// set up a remote branch in your local machine by creating a new branch (remote -> local)
git checkout -b <new_local_branch> <remote>/<remote_branch>

