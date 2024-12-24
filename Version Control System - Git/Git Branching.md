### Basic Branching and Merging
Basic Branching

- Say, you're going to work on issue #53 branch, you would type git checkout -b iss53
- Say, you have a work on a website to commit, and have HEAD in your currrent branch iss53

HEAD -> iss53 (branch) -> c2

master (branch) -> c2 

c2 -> c1 -> c0
```
vim some.html
git commit -a -m 'Create new footer [issue 53]'
```
HEAD iss53 (branch) -> c3

master (branch) -> c2 

c2 -> c1 -> c0

- Now, there is an issue with the website needed to be fixed immediately
```
# you want to checkout your previous commit c2 
git checkout master
```
- After the fix, you should create a hotfix branch
```
git checkout -b hotfix
$ vim index.html
$ git commit -a -m 'Fix broken email address'
```
HEAD -> hotfix (branch) -> c4 -> c3

iss53 (branch) -> c3

master (branch) -> c2 

c2 -> c1 -> c0

- After running some test, the hotfix is good to go and get back to the master branch
```
git checkout master
git merge hotfix

Updating f42c576..3a0874c   
Fast-forward                # when no divergent work (e.g. two branches pointing at c2) to merge together, you get fast-forward message
 index.html | 2 ++
 1 file changed, 2 insertions(+)
```
### Switching Branches
```
git checkout testing

# now you make another commit
vim test.rb
git commit -a -m 'Make a change' #[87ab2]
```
- the chekout command allow the HEAD pointer to point at checkout, making the branch to be the most updated one; in this case, master would be pointing at the one commit older version change

Testing (branch) -> [87ab2] (commit pointer)

[87ab2] (commit pointer) -> [f30ab]

HEAD -> Master (branch) -> [f30ab] (commit pointer)

[f30ab](commit pointer)  -> [34ac2](commit pointer)

[34ac2](commit pointer) -> [98ca9](commit pointer)

[98ca9](commit pointer) 

```
git checkout master

# another commit is made
im test.rb
git commit -a -m 'Make a change' # [c2b9e]

# check your divergent hisotry of commits along with branch pointer
git log --oneline --decorate --graph --all


* c2b9e (HEAD, master) Make other changes
| * 87ab2 (testing) Make a change
|/
* f30ab some message 3
* 34ac2 some message 2
* 98ca9 some message 1
```

HEAD -> Master (branch) -> [c2b9e] (commit pointer)
Testing (branch) -> [87ab2] (commit pointer)

[87ab2] (commit pointer) -> [f30ab]

[c2b9e] (commit pointer) -> [f30ab]

[f30ab](commit pointer)  -> [34ac2](commit pointer)

[34ac2](commit pointer) -> [98ca9](commit pointer)

[98ca9](commit pointer) 

- Branches in Git are simple files cotains the 40 character SHA-1 checksum (41 byte) of the commit it points, so it's cheap to create and destroy
- To create and checkout new branch for a current commit in one line: git  checkout  -b
<newbranchname>
- In Git 2.23 version, git switch can be used instead of git checkout
    - switch to existing branch: git switch testing-branch
    - create a new branch and switch to it: git switch -c new-branch (note -c deontes create)
    - return to your previously checked out branch: git switch -

### Creating a New Branch
```
git branch testing
```
- Git knows what branch you're on by having a HEAD pionter to the particular branch you work on
- You can see what branch you are on by having git log with decorate option
```
 git log --oneline --decorate
```
HEAD -> Master (branch) -> [f30ab] (commit pointer)

        Testing (branch) -> [f30ab] (commit pointer)

[f30ab](commit pointer) -> snapshot c,  -> [34ac2](commit pointer)

[34ac2](commit pointer) -> snapshot b, -> [98ca9](commit pointer)

[98ca9](commit pointer) -> snapshot a
### Branching in a Nutshell
- Git stores each snapshot of changes as subdirectory (tree) of a root direectory
    - To visualize it: in a commit of three file change, you have five objects: three blobs (representing the contents of one of the three file), one tree that lists the contents of the directory (root), and a pointer to the root tree (the snapshot) and to the commit pointer

Master (branch) -> [f30ab] (commit pointer)

[f30ab](commit pointer) -> snapshot c,  -> [34ac2](commit pointer)

[34ac2](commit pointer) -> snapshot b, -> [98ca9](commit pointer)

[98ca9](commit pointer) -> snapshot a


- A branch in Git is simply a lightweight movable pointer to one of the commits