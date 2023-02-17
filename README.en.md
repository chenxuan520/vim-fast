# Vim-Fast

- A **super fast** Vim configuration script

### Producer

**chenxuan**

- [README](./README.md) in Chinese

```shell
'       _            __          _   '
'      (_)          / _|        | |  '
'__   ___ _ __ ___ | |_ __ _ ___| |_ '
'\ \ / / | "_ " _ \|  _/ _" / __| __|'
' \ V /| | | | | | | || (_| \__ \ |_ '
'  \_/ |_|_| |_| |_|_| \__,_|___/\__|'
```

## Repository address


1. gitee:[vim-fast: A easy vim config](https://gitee.com/mirrorvim/vim-fast)

2. github:[GitHub - chenxuan520/vim-fast](https://github.com/chenxuan520/vim-fast)

## Configuration effects

![](https://picx.zhimg.com/v2-465040e3e32df418808b886729a1815f_1440w.jpg?source=172ae18b)

## Why did you make it

- I've been using [Vimplus](https://gitee.com/chxuan/vimplus.git) before, but there are several problems with Vimplus

  1. Vimplus has not been updated for a long time, quite a number of issues have not been resolved

  2. the current mainstream complementary program is lsp, Vimplus using the YCM is a bit old, and need to compile their own

  3. some plug-ins have a better replacement program

  4. github access is too slow, resulting in slow download of plug-ins, not friendly to newcomers

- For the rest of the configuration,

  - Some have github access problems, not friendly to newcomers to VIM, the server configuration is not friendly enough

  - Some are too complex, making the configuration file is basically too far from the original .vimrc, or even use a different format of the configuration file, which makes the later customization of their own VIM becomes very troublesome, and too redundant

  - Some completely use lua, making the VIM incompatible problems

  - Some use too many files and structures, not friendly to newcomers

- Based on the above problems, I want to create based on Vimplus to make it better

## Project features

1. **normal 3 minutes to install a good VIM configuration from a new linux host (including lsp and so on), 3 minutes to solve all the problems**

2. based on Vimplus, so that all configuration files in .vimrc, more than 1000 lines of configuration files more simple and intuitive, but also to avoid multiple configuration files redundant

3. plug-in streamlining, selected 24 plug-ins, making the opening speed has been improved

4. **plug-in package on gitee, so that the speed of downloading plug-ins has been improved**, friendly to newcomers, providing shell scripts for one-click configuration plug-ins

5. added a function-based shortcut key to find, to avoid the shortcut key to forget, through the \ <space\>H open

6. improved **mouse support**, making it more novice-friendly

7. support **C/C++, Go, Python, Rust** language one-click configuration (welcome to mention mr add more language support)

8. use coc instead of YCM, better complementary experience

9. support more diverse themes (more than 10 kinds), better visual experience (default tokyonight)

10. provide shell script to achieve customization Vim

11. detailed Chinese project documentation, more friendly to newcomers

12. [**built-in a simple and complete task management system, easy to build a one-click compile and run system**](https://github.com/chenxuan520/termtask.vim)

13. provide Chinese VIM manuals for one-click download configuration [(based on Vimcdoc)](https://github.com/yianwillis/vimcdoc)

14. [**Built-in markdown shortcut plugin**](https://github.com/chenxuan520/markdown-simple.vim)

15. to markdown file **provide ibus input method switch operation** (default comes with), preview markdown (default comes with)

16. and ici and lazygit, fzf, lf integration, without additional plug-ins, you can achieve translation and git management, file management

17. built-in a **Vimrc no plug-in simplified version **, no plug-in or root access can also be used

18. well-configured folding function, so that code browsing more simple

19. built-in many convenient vimscript, easy to learn and simplify the operation

## Built-in Vimscript features

1. full text selection, similar to the plug-in [Vim-textobj-entire](https://github.com/kana/vim-textobj-entire)

2. markdown, quick writing, formatting, similar to the plugin [vim-markdown](https://github.com/preservim/vim-markdown)

3. **task management**, similar to the plugin [asynvtasks](https://github.com/skywind3000/asynctasks.vim)

4. **git status display**, similar to plugin [vim-gitgutter](https://github.com/airblade/vim-gitgutter)

5. pre-code insertion, similar to plugin [prepare-code](https://github.com/chxuan/prepare-code)

6. parameter selection, similar to the plugin [vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)

7. highlight selected, similar to the plug-in [vim-textobj-syntax](https://github.com/kana/vim-textobj-syntax)

8. indent selected, similar to plug-in [vim-textobj-indent](https://github.com/kana/vim-textobj-indent)

9. ibus input method automatic switch, similar to the plug-in [vim-ibus](https://github.com/h-youhei/vim-ibus)

10. lazygit and Vim integration, the effect is better, similar plug-ins [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

11. lf and vim integration, similar to the plug-in [lf.vim](https://github.com/ptzz/lf.vim)

12. ici translation, similar plug-in [ici.vim](https://github.com/Flowerowl/ici.vim)

13. color visualization, similar to the plug-in [colorizer](https://kgithub.com/lilydjwg/colorizer)

14. binary file editing, similar to the plug-in [Vinarise](https://github.com/Shougo/vinarise.vim)

15. multi-cursor editing, similar to the plug-in [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

16. editorconfig support, similar to plugin [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)

17. **query whether a key is bound and where it is bound**,\<leader\>h and \-h trigger detection

18. mdbook directory auto-generation

19. view and open recently closed buffer

20. simple markdown and html preview

21. fzf call

- Note: The above features are built into Vim-fast, and will not affect the speed of Vim startup

## Project folder

- autoload plugin plug.vim, providing the installation of the plugin

- fonts folder, pre-download, reduce the download time

- colors Themes folder, providing more than 10 kinds of themes

- doc help documentation

- vimscript some useful VIM scripts

- old Vimplus old version files (not recommended, just for reference)

## shell scripts

- install.sh install script, run first, to install vim-fast

- install_without_sudo.sh install without root and sudo (need to download packages in advance)

- update.sh to pull the latest vim-fast configuration

- uninstall.sh Uninstall vim-fast

- shell/cpp/go/rust/python.sh install lsp and coc for four languages, run install.sh and call as needed

- shell/plug.sh download and install all the latest plugins (,auto call, use gitee, faster)

- shell/doc_zh.sh download and install vim Chinese documentation

- shell/self.sh customize the name and email in .vimrc to your own

- shell/nodejs.sh nodejs installation script, will automatically call

- shell/color.sh add Vim theme

- shell/coc_plug.sh recommended coc plugin installation

- shell/vim_compile.sh vim latest version compile and install

- nvim.sh Migrate to nvim with one click

## Other files

- .vimrc VIM configuration file

- vimrc-no-plug VIM configuration without plugins and themes

## Project description

1. **! Currently only support ubuntu, debian, and other ubuntu system linux, other systems can use vimplus!**

2. the project is based on [Vimplus](https://gitee.com/chxuan/vimplus.git)

## Videos and articles

- [bilibili](https://space.bilibili.com/322142755)

  1. [Installation](https://www.bilibili.com/video/BV1RV4y1K7Le/)

  2. [Configuration Details](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

  3. [Custom VIM Configuration](https://www.bilibili.com/video/BV1Y84y1q79F/)

  4. updateing

- [zhihu](https://zhuanlan.zhihu.com/p/524286962)

## Installation
> The first two steps can be simplified as
>
> curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/webinstall.sh |bash
>
> (If you encounter problems with the output after installation, you can just close the terminal and restart it)

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh

3. ![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png) and press enter

4. The following image appears, the installation is complete

5. ![](https://pic4.zhimg.com/80/v2-7d5e78a2fbd546f19002673ed432a8ff_720w.jpg)

6. Execute different scripts for different languages

#### C++

1. ./shell/cpp.sh

   ![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. The following configuration appears successfully

   ![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

1. ./shell/python.sh

   ![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. This is a successful installation of python

   ![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./shell/go.sh

   ![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. When you first edit the file, you need to wait a while for it to download, about two minutes

   ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. This is the successful installation of go complements

   ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

#### Rust

1. ./shell/rust.sh

2. wait for the installation to finish (about a minute), if the rust environment does not exist it will be downloaded automatically

### Simple installation without plugins version
   > curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/websimple.sh | bash

   - or

   > wget https://gitee.com/mirrorvim/vim-fast/raw/master/vimrc-no-plug -O ~/.vimrc

#### Pluginless version description

   1. The plugin-less version has only one file (vimrc) and does not create any other files, so you can just copy and paste the file (./vimrc-no-plug) to ~/.vimrc. 2.

   2. built-in plugins **easy-motion**, vim-surround, vim-commentary, auto-pair, vim-slash, vim-airline most of the functions

   3. built-in tokynight color theme, as well as all the custom button functions of the version with plug-ins

   4. if fzf is installed, it has most of the functions of leaderf

## Update

   - ./update.sh

## External tool integration

1. [lazygit](https://github.com/jesseduffield/lazygit), you need to install lazygit, so that you can call the shell directly in the shell. press space+g to trigger

2. [ici translate](https://github.com/Flowerowl/ici),`pip install ici`, and modify the path of ici in .vimrc, press ,i to translate the word in normal mode or visual mode

3. [fzf file search](https://github.com/junegunn/fzf/),`sudo apt install fzf`,\<space\>z/Z trigger

4. [lf file manager](https://github.com/gokcehan/lf/), need to install lf,\<space\>e/E trigger

## Vimplus original repository

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. is there a nvim version?

   - nvim can be installed temporarily via nvim.sh, the lua configuration version will be in another repository

2. my system does not support

   - You can raise an issue or make your own mr

3. PlugInstall appears \# unsafe repository git config --global --add safe.directory

   - git config --global --add safe.directory "\*"

4. xshell,tmux opens with confusing colors

   - xshell "tools" -> "options" -> "advanced" -> "use native colors", turn it on and restart xshell

   - tmux currently can only switch theme to onedark, and turn off termguicolors, set let g:onedark_termcolors=256

5. whether you need root or sudo privileges

   - If vim-fast has been installed on this machine or all the corresponding software has been installed, you don't need sudo, otherwise you need sudo to install the package.

6. I want to customize the dashboard content when Vim starts

   - Get the pattern representation [Spring Boot banner online generation tool](https://www.bootschool.net/ascii), select the type as `ANSI Shadow`.

   - Get the Vim form [vim-dashboard-header-make](https://chenxuan520.gitee.io/chenxuanweb/header.html) (took a little time to do it myself, because not much write front-end, the screen is worse)

   - Copy the result to .vimrc

7. appears E1208: -complete used without allowing argumentsPress ENTER or type command to continue

   - Go to the coc.nvim plugin directory and git reset --hard v0.0.81

   - Or edit the coc.vim file with the error and delete line 438.

8. Vim specific file pre-generated code I want to modify

   - In `~/.vim/ftplugin` find the folder of the corresponding file, and modify the content of comment.vim.

9. The console icon is confusing

  - Set the console font, open the preference, set the font to `DroidSansMono Nerd Font Book`.

10. E117 appears, undefined function getenv

  - The reason for the problem is that the VIM version is too low, you can upgrade VIM (./shell/vim_compile.sh latest Vim installation) or go to the problem line to delete the line

11. the theme used

  - [tokyonight](https://github.com/ghifarit53/tokyonight-vim)

12. ctrl-s after not more cursor, but stuck

  - Terminal settings problem, add `stty -ixon` to ~/.bashrc, then reload it

13. error installing nodejs, can't connect to download

  - Re-run ./shell/nodejs.sh

## Help

1. [Plugin shortcut description](./doc/key.md)(some of them may be out of date, we recommend to use \<space\>H to see them)

2. [Vim some keystroke help](./doc/help.md)

## Hope

- Due to my limited ability, I hope you can write an install.sh for your own system, and then mention mr, thank you very much.

## Postscript

- VIM should not be used as an IDE out of the box, but at first nothing interface to dissuade most people, so I made this repository to take you with the least amount of time to make VIM into an IDE, but let the configuration file as simple as possible

- When you may be familiar with VIM may feel that I set the shortcut keys anti-human, at that time you can customize everything yourself, everything in VIM can be customized, when you edit your own .vimrc, VIM will become your most handy weapon

---

### Vim learning materials recommended

- Vim video introduction

  1. [suitable for quick start, the original video from MU class](https://www.bilibili.com/video/BV1NG4y1p74h/)

  2. [I have seen the best VIM tutorial, the original video from the oil pipe](https://www.bilibili.com/video/BV1pE411y7nj/)

- Vim book recommendation

  1. **VIM practical skills** (super good VIM books)

  2. VIM8 text processing practice (also okay)

- Learn [vimscript](./vimscript/README.md) (not necessary unless very demanding)

---

### Vim learning route recommendations

1. find a reason why you must use VIM (otherwise you won't be able to use it)

   - Find the simplest VIM tutorial (such as [this](https://www.bilibili.com/video/BV13t4y1t7Wg/)), use VIM as a general editor

2. find a simple (**very important**) and out-of-the-box configuration (such as the repository) [video](https://www.bilibili.com/video/BV1RV4y1K7Le/)

   - Apply VIM to everyday

   - Wait to use to a certain extent to see VIM video

3. read vimrc configuration content (controllability) [video](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

   - Start reading VIM books

4. start to customize your own VIM

   - Understand vimscript simple syntax configuration

---

![](https://www.yundongfang.com/wp-content/uploads/2021/03/Vim-Text-Editor-logo.png)

---

- If this repository is useful to you, you can give a star
