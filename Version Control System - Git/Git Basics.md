### Git Aliases
- git config --global alias.unstage 'reset HEAD --'; notice how unstage is defined with reset HEAD -- command
- git unstage fileA $\equiv$ git reset HEAD -- file A

### Tagging (purpose: to denote importance)
Listing Your Tags
- git tag with option: -l or --list 'tag_name' for more specific case
Annotated Tags
- git tag -a <tag_name> -m 'my version tag_name'
- to view the commit along with the tag, type git show tag_name

Lightweight Tags
- git tag tag_name-lw

Tagging Later
- git tag -a tag_name commit_checksum, where you will only need partial of the checksum. You can get the checksum from git log --pretty=oneline
Sharing Tags
- By default, git does not tranfer tags to the remote server; one must explicity state it
```
git push <remote server name> <tag_name>

git push <remote server name> --tags # purpose: tranfer of multiple tags
```
Deleting Tags
- git tag -d <tag_name>, but this only works locally
- git push <remote server name>:refs/tags/tag_name will update the remote tag as well
    - a more intuitive approach: git push <remote server name>--delete <tag_name>

Checking out Tags
- git checkout tag_name allows you to make some expeirmental changes without impacting the file
- to create a new branch that retain the commit in your check out, type git switch -c <new-branch-name>; the undo of this operation is git switch -
### Working with Remotes
Showing Your Remotes
- use git remote to show the remote repository
- use git remote -v to show the url that have been used

Adding Remote Repositories
- git remote add <shortname> < url>
    - the shortname will be an alias for the url

Fetching and Pulling from Your Remotes
- git fetch <remote> pulls down all the data from the remote project
- git pull <remote> allow a remote branch tracking local branch to merge with local repo
    - the tracking itself is done automatically when you git clone the repository

Pushing to Your Remotes
- git push <remote> <branch> allows you to push your <branch> under a <remote> server
```
git push origin master
```
Inspecting a Remote
- git remote show <remote server>

Renaming and Removing Remotes
- git remote rename <shortname> <shortname1>

### Undoing Things
```
git commmit --amend # redo commit, making two commit into one; added after (add-commit)-add
```

Unstaging a Staged File
- First, view your git status to see what you modified, renamed, and etc
- Use git reset HEAD <filename> to get the file back to modified status from staging status

Unmodifying a Modified File
- git checkout --<file>... to discard changes in working directory

Undoing things with git restore (a new command in 2.23.0)
- git restore --staged <file> to get unstage
- git restore <file> to discard changes in working directory
    - quite a dangerous command



note: it's always a good habit to go back in git status to check what you did
### Viewing the Commit History
```
git log
```

options: 
1. -p or --patch (each patching output in the commit) along with -<n> (the last n entries you want to display)
2. --stat (abbriviated of patch info)
3. --pretty = format: <specifiers> (a better formatting of the patch info), = oneline along with --graph (which provides an ASCII graph showing the branch and merge history)
4. --since, --until (to speicify time limit)
5. -S somestring (shows the commit that somestring has changed)
6. -- path/to/file (filters the log info from the file in the path)

An example run 
```
$ git log --pretty="%h - %s" --author='Junio C Hamano' --since="2008-10-01" \
   --before="2008-11-01" --no-merges -- t/
5610e3b - Fix testcase failure when extended attributes are in use
acd3b9e - Enhance hold_lock_file_for_{update,append}() API
f563754 - demonstrate breakage of detached checkout with symbolic link HEAD
d1a43f2 - reset --hard/read-tree --reset -u: remove unmerged new paths
51a94af - Fix "checkout --track -b newbranch" on detached HEAD
b0ad11e - pull: allow "git pull origin $something:$current_branch" into an unborn
branch
```

note: git pathes are text files that contain code and git commit metadata
### Moving Files
- Git does not explicity track file movement, so a rename of a file is not alwaysed stored in meta data. You need to use git mv to rename a file
```
git mv files_from file_to
```

### Removing Files
- use rm git keyword to remove files from staging area and file system (dangerous)

```
git rm --cached file0 # remove certain file that you don't want to git track (just the staging area)

git rm log/ \*.log #remove under log dir with all .log extension

git rm \*~ # rmove under curr dir with all ~ extension

```

### Skipping the Staging Area
```
git status
git commit -a -m 'your message' 
```
instead of
1. git add file0
2. git status
3. git commit -m 'your message'

### Commiting Your Changes
git commit -m 'your message'

### Viewing Your Staged and Unstaged Changes
git diff
- a command that provide more detail than git status
- you will see what has changed but yet not staged and what has been staged but not commit

options: --staged, --cached



### Ignoring Files
- Somee files that you don't want to git can be treated through .gitignore file

```
cat .gitignore
*.abc
*.xyz
```
- in the gitignore file, we see that any files ending with abc or xyz should be ignored for the change

General Rule for .gitignore file
- Blank lines or lines starting with # are ignored.
- Standard  glob  patterns  work,  and  will  be  applied  recursively  throughout  the  entire  working
tree.
- You can start patterns with a forward slash (/) to avoid recursivity.
- You can end patterns with a forward slash (/) to specify a directory.
- You can negate a pattern by starting it with an exclamation point (!)

Glob Pattern:
- Def: simpliied regular expression that shells use
- *, which matches zero or more character
- [abc], which mathces any character inside the bracket
- ?, which matches a singla character
-[0-9], which matches any character in beween
- a/**/z, which matches nested directories

A more sophiscated example of a git.ignore file
```
# ignore all .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in any directory named build
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory and any of its subdirectories
doc/**/*.pdf
```
### Short Status
- A command option that gives less wordy status message

```
git status -s

M somefile # somefile has been modified
MM somefile1 #somefiles1 has been modified,staged and modified again
A somefile2 # somefiles2 has been staged
?? somefile3 # somefile3 is untracked

```
### Staging Modified Files
- Say, you have a tracked file of which you just modified named CONTRIBUTING.md
```
git status
# message regard to your branch and stage + tracking status#
# new file: README #

# message regard to your modified files' stage + tracking status#
# modified: README #
```

```
git add CONTRIBUTING.md
# message regard to your branch and stage + tracking status#
# new file: README #
# modified: README #
```
- now, both files are staged and ready to commit
### Tracking New Files
```
git add README

git status
# message regard to your branch and stage + tracking status#
# new file: README #

```
- note: to unstage a file, do git restore --staged <file>... 


### Recording Changes to the Repository
Checking the Status of Your Files
```
git status
```
- The command should tell you which branch you're on

Say, you have a new README file written, using git status should allow you to see its untrack (unadded/staged and uncommited) status
```
echo 'Your Text' > README
git status
# message regard to your branch and tracking status#
#   README   #
```
### Cloning Existing Repository
```
git clone <githublink/newdirectory> # clone from github inside a newly created dir

git clone <githublink existing_directory> # clone from github inside an existing directory
```

github link can come as
- http://
- git://
- user@:path/to/repo.git, which uses SSH transfer protocol


### Initializing a Repository in an Existing Directory
linux
```
cd /home/user/my_project # change directory -> cd

git init 
```

### Getting a Git Repository
Two ways to obtain a Git Repo
1. Take a local directory that is not under a version control and conver it to one
2. Clone an existing git repository from somewhere else



