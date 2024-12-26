
### Rule of hog:
- Each player has a goal of reaching its score to 100
- Each player can roll less than 10 number of dices
- There are risks in rolling many dices
    - **Sow Sad**: if any one of the dice rolled in a roll is 1, then the player turn score will be 1, regardless of what other dices' numbers are
    - **Boar Brawl**: A players who has rolled zero dice will score three times of the absolute difference between the 10th digit of the oppoent's score (it could be zero) and the player's own first digit score or 1, if the score is less than 1
    - **Sus Fuss**: if the player reaches to a number with 3 or 4 factors (including 1), then the player's score jumps to the next prime number

### Starter Files:
`hog.py`: A starter implementation of Hog

`dice.py`: Functions for making and rolling dice

`hog_gui.py`: A graphical user interface (GUI) for Hog (updated)

`ucb.py`: Utility functions for CS 61A

`hog_ui.py`: A text-based user interface (UI) for Hog

`ok`: CS 61A autograder

`tests`: A directory of tests used by `ok`

`gui_files`: A directory of various things used by the web GUI 

### File(s) to Turn In: hog.py