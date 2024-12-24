### Switching Branches
```
git checkout testing

# now you make anoterh commit
vim test.rb
git commit -a -m 'Make a change'
```
- the chekout command allow the HEAD pointer to point at checkout, making the branch to be the most updated one; in this case, master would be pointing at the one commit older version change

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