# /home/kesavan/.vim/vimrc

![Screenshot](./screenshot.png "Screenshot of this .vimrc in action")

This Vim configuration is meant to make Vim feel more like an IDE than a simple console-based text editor.
I love this configuration at my work & home

## Installation

### Clone with GIT

Run these commands to get this Vim configuration working on your OS X or Linux machine.
You can run `git pull` inside of `~/.vim` if you'd ever like to grab the latest version.

```bash
cd ~
mkdir my-old-vim-stuff ; mv ~/.vim* my-old-vim-stuff # backing up your old vim
git clone git://github.com/kesavanm/VIM-my-PHP-IDE.git .vim
ln -s ~/.vim/vimrc ~/.vimrc # Optional, needed for some VIM installations
```

### One Time Download

This method might be more sane. Simply downlaod the latest version, extract to `~/.vim`, and configure to your liking.

```bash
wget https://github.com/kesavanm/VIM-my-PHP-IDE/archive/master.zip
```

## Features

* Edit many files at the same time
* File Browser on left side of screen
* Move between files in center screen
* View status of the current GIT repo, if applicable
* Additional features when running under MacVIM
* Quickly navigate to files using a fuzzy finder

### Leader Key

As of `v0.2.0`, the Leader key is now bound to `Space` (used to be `Comma`)

### Switching between files (Buffers)

* Use `<Leader>q` to close the current file (a different file will appear in its place)
* Use `Ctrl h` `Ctrl l` to move between open files
* `Ctrl Left` `Ctrl Right` also works for switching between files
* While in MacVIM, you can swipe left and right to switch between open files
* Use `Cmd Shift N` (or `Alt n` in Linux GVim) to open a new empty buffer

### Viewports (Windows/Splits)

* Use `<Leader>h` `<Leader>j` `<Leader>k` `<Leader>l` to navigate between viewports
* Use `<Leader>Q` to close the current window (you probably won't ever need to do this)
* Use `<Leader>n` to toggle the file browser
* Use `Ctrl P` to perform a recursive fuzzy filename search
* Use `<Leader>a` and type a phrase to search to search based on content within your files (quote and escape if needed)
* Use `<Leader>A` to close the open ack search results at the bottom of the screen

* Use `Ctrl ww` to switch between windows


### File Browser (NERDTree)

* Use `<Leader>n` to toggle the file browser
* Use standard movement keys to move around
* Use `Ctrl j` and `Ctrl k` to move between siblings (aka skip over children in expanded folders)
* Use `C` to make the highlighted node the current working directory
* Use `:Bookmark BookmarkName` to bookmark the current selection
* Use `B` to toggle the bookmark menu
* Use `?` if you'd like some NERDTree documentation
* Use `o` to open the selected file in a new buffer
* Use `t` to open the selected file in a new tab


* Use `I (shift + i)`   to list hidden files.
* Use `s` to vsplit the current window and open the selected file.
* Use `i` to split the current window and open the selected file.
* Use `t` to open file in new tab.
* Use `m` to modify the file/directory to rename, move, delete or create a file/directory.
* Use `shift + c` to move into the selected directory.
* Use `u` to move back one level in the directory tree.
* Use `x` to close the opened directory tree in which you’re in.
* Use `return` to open a directory or file.
* Use `j and k or the cursor keys` to move up and down in the list.

### Tabs

* Use `Cmd t` (or `Alt t` in Linux GVim) to open a new tab
* Use `Cmd w` (or `Alt w` in Linux GVim) to close the current tab
* Use `Cmd 1` to `Cmd 9` (or `Alt 1` to `Alt 9` in Linux GVim) to navigate to the specified tab

### Themes (ColorSchemes)

There is a very large collection of colorschemes in this repository.
Many of them can be seen [here](http://vimcolors.com/).
Set the scheme using `:colorscheme NAME`.

* Use `<Leader>x` to switch to a random theme.
* F8 - Theme


### Ctrl-P FizzyFinder

* Ctrl-D		to switch modes [To Dir search]
* Ctrl-F/B/M	to switch between files/buffers/MUF (Most Used Files)


### C-Tags

* Install CTAG
```bash
$ wget https://downloads.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz
$ tar zxf ctags-5.8.tar.gz
$ cd ctags-5.8
$ ./configure --prefix=$HOME
$ make && make install
```

* Generate the tags file to hold all your project info
```bash
$ctags -R --languages=php .	(you can ignore languages option as well )
 ```

*  g C-] 		is very useful. It opens a quick dialog to select one between multiple definitions. 
*  ctrl-t   - goes to previous spot where you called :tag
*  ctrl-]   - calls :tag on the word under the cursor
 
*  :tag /<pattern>
*  :stag /<pattern>
*  :ptag /<pattern>
*  :tselect /<pattern>
*  :tjump /<pattern>
*  :ptselect /<pattern>
*  :ptjump /<pattern>
*  :tag TAB            - list the known tags
*  :tag function_name  - jump to that function
*  :ptag    - open tag in preview window (also ctrl-w })
*  :pclose  - close preview window

### Quick Fix
:copen  - Opens quick fix window
:cclose	- Closes the quick fix window
:Run <command> 	- Run the command and send the output to Quick fix window

### Text Navigation

Other than the myriad of built-in methods for navigating text...

* Use `<Leader><Leader>b` to highlight and jump to previous words
* Use `<Leader><Leader>w` to highlight and jump to following words

### Copying and Pasting between OS

* Use `<Leader>c` to copy the highlighted text into the OS clipboard
* Use `<Leader>v` to paste the OS clipboard into the document

### General

* :se  - shortcut for :set
* :set mouse=a  - set vim in mouse mode ; No right click , quick paste
* :set mouse=	- set vim in quick edit mode

* gg Goto line #1
* G  Goto EOF
* N| Goto column N
* or # to jump around between files and variables.

* Ctrl f – Jump forward one full screen.
* Ctrl b – Jump backwards one full screen
* Ctrl d – Jump forward (down) a half screen
* Ctrl u – Jump back (up) one half screen


### Closing Windows/Tabs/VI

* :Bclose :Bc - Buffer close
* :tabclose	- Tab close
* :qa :qall - Quit all

### Credits & Thanks 

Please read their FAQ & README for better idea

* All contirbutors to VIM and plugins
* FuzzyFinder - https://github.com/vim-scripts/FuzzyFinder
* CtrlP - https://github.com/kien/ctrlp.vim
* nerdtree - https://github.com/scrooloose/nerdtree
* Shameless self promo - https://github.com/kesavanm


