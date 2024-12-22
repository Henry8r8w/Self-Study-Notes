
### Installing Git
Linux
- sudo dnf install git-all (fedora or RPM-based)
- sudo apt install git-all (debian-based)

macOS
- git --version
    - if you do not have git alreayd, this command will stil make the prompt for you to do so

Window
- https://git-scm.com/downloads/win


View your setting by using:
- git config --list --show-origin
- note: nothing would display if you did not have identiy set
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```
- to set the default branch, do
```
git config --global init.defaultBranch main
```
- to help with configuration
```
git help config
```

### What is Git
- What differ Git from other VCS is that
    - git stores snapshot of files with some edited and some not
    - other vcs stores files on the notion of base version change of indivisual file, which makes it less flexible
- Its local repository does not need a server to host it, which makes it more flexible than some other CVS

- Git's integrey, maintained by a checksumming called SHA_1 hash (40-character string composed of hexdeicmal characters), ensures corruption detection

- It's not very easy to lose git commited data

**The Three States**
1. Modified: file change has been made, but not commited to the database
2. Staged: the file changed has been marked as the current version in the commit snapshot
3. Commited: the file is safely stored at the local repository

Based on the three sates, there then will be three section in a Git project:
- A working directory/tree: where file modification occurs
- A staging area: where commit snapshot marking occurs
- A .git directory: where working diectory can checkout previous version of project

### Dsitributed Version Control Systems (which is what git is)
- Client mirror the repository; indivisual have their own copy of the repository

Computer A (File <-- [V1 -- V2 -- V3]) $\leftrightarrow$ 
- Computer B (File <-- [V1 -- V2 -- V3])
- Server Computer ([V1 -- V2 -- V3])

Computer B (File <-- [V1 -- V2 -- V3]) $\leftrightarrow$ 
- Computer A (File <-- [V1 -- V2 -- V3])
- Server Computer ([V1 -- V2 -- V3])

Server Computer (File <-- [V1 -- V2 -- V3]) $\leftrightarrow$ 
- Computer B (File <-- [V1 -- V2 -- V3])
- Computer A (File <-- [V1 -- V2 -- V3])
### Centralized Version Control Systems (CVCS)
- A single server that contains all the versioned files
- Advantage (over local VCS): adminstraot have fine-grained control over who have access
- Disadvatange: prone to single point failure when server go down -> everything go bye bye

shared repository $\leftrightarrow$ 
- developer_i

...

- developer_n

### Local Version Control Systems
- Contrary to the one commonly do with copy and paste, local VCS tend to be less error prone in writing and easily accessible as its own enetity of simple database 

(File --- [V1 -- V2 -- V3])

(): Local computer

--,---: relationship

[]: version database

- [RCS](https://www.gnu.org/software/rcs/) is one of the most common VCS; it works by keeping the difference between files in a its own special format on the disk, then recreate whay file looked like by the point of adding up the difference

### About Version Control System (VCS)
- A system that records changes to a files or set of files over time such that one can visit each version they desire of in future
