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

## Warehouse Address


1. gitee:[vim-fast: A easy vim config](https://gitee.com/mirrorvim/vim-fast)

2. github:[GitHub - chenxuan520/vim-fast](https://github.com/chenxuan520/vim-fast)

## Configuration effect

![](https://picx.zhimg.com/v2-465040e3e32df418808b886729a1815f_1440w.jpg?source=172ae18b)

## Why make

- I have been using [Vimplus](https://gitee.com/chxuan/vimplus.git) before, but there are several problems with Vimplus

   1. Vimplus has not been updated for a long time, and there are many issues that have not been resolved

   2. The current mainstream completion solution is lsp, and the YCM used by Vimplus is a bit old, and needs to be compiled by itself

   3. Some plugins already have a better alternative

   4. The access to github is too slow, resulting in slow download of plug-ins, which is not friendly to novices

- for other configurations,

   - Some have github access problems, are not friendly to VIM novices, and are not friendly enough to server configuration

   - Some are too complicated, so that the configuration file is basically too far from the original .vimrc, and even uses a configuration file in a different format, which makes it very troublesome to customize VIM later, and is too redundant

   - Some completely use lua, making VIM incompatible

- Based on the above problems, I want to create based on Vimplus to make it better

## Project Features

1. **Install the VIM configuration (including lsp) from the new linux host in 3 minutes normally, and solve all problems in 3 minutes**

2. Based on Vimplus, all configuration files are in .vimrc, more than 900 lines of configuration files are more simple and intuitive, and also avoid redundancy of multiple configuration files

3. The plug-ins are simplified, and 24 plug-ins are selected, which improves the opening speed

4. **The plug-in compression package is placed on gitee, which improves the download speed of the plug-in**, which is friendly to novices and provides shell scripts to configure the plug-in with one click

5. Added function-based shortcut key search, avoiding shortcut key forgetting, open via \<space\>H

6. Improved **mouse support**, making it more friendly for novices

7. Support C/C++, Go, python language one-click configuration (welcome to add more language support by mr)

8. Use coc instead of YCM for better completion experience

9. Support more diverse themes (more than 10 types), better visual experience (default tokyonight)

10. Provide shell scripts to realize customized Vim

11. The Chinese documentation of the project is detailed and more friendly to novices

12. [**A simple and complete task management system is built in, which is convenient for building a one-click compilation and running system**](https://github.com/chenxuan520/termtask.vim)

13. Provide one-click download configuration of Chinese VIM manual [(based on Vimcdoc)](https://github.com/yianwillis/vimcdoc)

14. [**Built-in markdown shortcut plugin**](https://github.com/chenxuan520/markdown-simple.vim)

15. For markdown files **provide ibus input method switching operation** (default built-in), preview markdown (default built-in)

16. Integrated with ici and lazygit, fzf, lf, translation and git management, file management can be realized without additional plug-ins

17. The configured folding function makes code browsing easier

18. Built-in many convenient vimscript, easy to learn and simplify operation

## Built-in Vimscript features

1. Select the full text, similar to the plug-in [Vim-textobj-entire](https://github.com/kana/vim-textobj-entire)

2. markdown, quick writing, formatting, similar plug-ins [vim-markdown](https://github.com/preservim/vim-markdown)

3. **Task management**, similar plugin [asynvtasks](https://github.com/skywind3000/asynctasks.vim)

4. **git status display**, similar to plugin [vim-gitgutter](https://github.com/airblade/vim-gitgutter)

5. Pre-code insertion, similar to plug-in [prepare-code](https://github.com/chxuan/prepare-code)

6. Parameter selection, similar to plug-in [vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)

7. The ibus input method is automatically switched, the default markdown file is enabled, similar to the plug-in [vim-ibus](https://github.com/h-youhei/vim-ibus)

8. Lazygit and Vim integration, similar plug-in [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

9. ici translation, similar plug-in [ici.vim](https://github.com/Flowerowl/ici.vim)

10. View and open the most recently closed buffer

11. Simple markdown and html preview

12. fzf simple call

- Note: The above functions are built in Vim-fast, and will not affect the startup speed of Vim

## Project folder

- autoload plug-in plug.vim, providing plug-in installation

- fonts font folder, pre-download, reduce download time

- colors theme folder, providing more than 10 themes

- doc help documentation

- vimscript Some useful VIM scripts

- old Vimplus legacy files (not recommended, for reference only)

## shell script

- install.sh installation script, first run, install vim-fast

- install_without_sudo.sh is installed without root and sudo (you need to download the package in advance)

- update.sh pulls the latest configuration of vim-fast

- uninstall.sh uninstall vim-fast

- shell/cpp/go/python.sh Lsp and coc installation in three languages, run install.sh and call on demand

- shell/plug.sh download and install all the latest plug-ins (automatically called, use gitee, faster)

- shell/doc_zh.sh download and install vim Chinese documentation

- shell/self.sh customize the name and email in .vimrc as your own

- shell/nodejs.sh nodejs installation script, will be called automatically

- shell/color.sh add Vim theme

- shell/coc_plug.sh recommended coc plug-in installation

- nvim.sh one-click migration to nvim

## Other files

- .vimrc VIM configuration file

- vimrc-no-plug does not contain VIM configuration for plugins and themes

## project instruction

1. **! Currently only supports ubuntu, debian, and other ubuntu-based linux, and other systems can use vimplus! At the same time, I really hope that everyone can mention mr to improve the warehouse, or raise an issue to explain the required system**

2. The project is based on [Vimplus](https://gitee.com/chxuan/vimplus.git)

## Videos and Articles

- [bilibili](https://space.bilibili.com/322142755)

   1. [Installation](https://www.bilibili.com/video/BV1RV4y1K7Le/)

   2. [Configuration details](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

   3. [Custom VIM Configuration](https://www.bilibili.com/video/BV1Y84y1q79F/)

   4. Updating

- [zhihu](https://zhuanlan.zhihu.com/p/524286962)

## Install

> The first and second steps can be simplified as
>
> curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/webinstall.sh | bash
>
> (After the installation is complete, if you encounter the problem of output confusion, you can directly close the terminal and restart it)

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh

3. When ![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png) appears, press Enter

4. The following picture appears, the installation is complete

5. ![](https://pic4.zhimg.com/80/v2-7d5e78a2fbd546f19002673ed432a8ff_720w.jpg)

6. Execute different scripts for different languages

#### C++

1. ./shell/cpp.sh

    ![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. The following figure appears and the configuration is successful

    ![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

1. ./shell/python.sh

    ![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. If this appears, the installation of python is completed successfully

    ![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./shell/go.sh

    ![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. When you just edited the file, you need to wait for a while to download, about two minutes

    ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. If this appears, the installation of go completion is successful

    ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

### Easy installation without plugin version
    > curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/websimple.sh | bash

## renew

    - ./update.sh

## External tool integration

1. [lazygit](https://github.com/jesseduffield/lazygit), you need to install lazygit so that you can directly call the shell in the shell. Press space+g to trigger

2. [ici translation](https://github.com/Flowerowl/ici)`pip install ici`, and modify the path of ici in .vimrc, press ,i to translate words in normal mode or visualization mode

3. [fzf file search](https://github.com/junegunn/fzf/), `sudo apt install fzf`, \<space\>z/Z trigger

4. [lf file manager](https://github.com/gokcehan/lf/), need to install lf, \<space\>e/E trigger

## Vimplus repository

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. Is there an nvim version?

    - nvim can be temporarily installed through nvim.sh, and the lua configuration version will take some time

2. My system does not support

    - You can raise an issue or create your own mr

3. PlugInstall appears\# unsafe repository git config --global --add safe.directory

    - git config --global --add safe.directory "*"

4. The colors of xshell and tmux are confused

    - "Tools" -> "Options" -> "Advanced" -> "Use True Color" in xshell, open and restart xshell

    - tmux currently can only switch the theme to onedark, and turn off termguicolors, set let g:onedark_termcolors=256

5. Do you need root or sudo privileges?

    - If you have installed vim-fast on this machine before or the corresponding software has been installed, you don’t need sudo, otherwise you need sudo to install the software package

6. I want to customize the dashboard content when Vim starts

    - Get the pattern representation [Spring Boot banner online generation tool] (https://www.bootschool.net/ascii), select the type as `ANSI Shadow`

    - Get the Vim form [vim-dashboard-header-make](https://chenxuan520.gitee.io/chenxuanweb/header.html) (it took me a little time to do it, because I don’t write much on the front end, and the picture is relatively poor)

    - Copy the result to .vimrc

7. E1208 appears: -complete used without allowing arguments Press ENTER or type command to continue

    - Enter the coc.nvim plugin directory and then git reset --hard v0.0.81

    - Or edit the wrong file coc.vim and delete line 438

8. Vim-specific file pre-generated code I want to modify

    - Find the folder of the corresponding file in `~/.vim/ftplugin`, and modify the content of comment.vim

9. Console icon mess

   - Set the font of the console, open the preferences, set the font to `DroidSansMono Nerd Font Book`

10. E117, undefined function getenv

   - The reason for the problem is that the VIM version is too low, you can upgrade VIM or go to the problematic line and delete the line

11. Themes used

   - [tokyonight](https://github.com/ghifarit53/tokyonight-vim)

## help

1. [Plug-in shortcut key description](./doc/key.md) (some parts may be outdated, it is recommended to use \<space\>H to view)

2. [Vim some key help](./doc/help.md)

## hope

- Due to limited personal ability, I hope you can write an install.sh for your own system, and then mention mr, thank you very much

## Epilogue

- Using VIM should not be used as an out-of-the-box ide, but the interface with nothing at the beginning dissuaded most people, so I made this warehouse to take you to use the least time to build VIM into an IDE, but let the configuration Documentation as simple as possible

- When you may be familiar with VIM, you may feel that the shortcut keys I set are anti-human. At that time, you can customize everything by yourself. Everything in VIM can be customized. When you edit .vimrc yourself, VIM will become your best weapon

---

### Recommended Vim learning materials

- Vim video introduction

   1. [Suitable for quick start, the original video is from MOOC](https://www.bilibili.com/video/BV1NG4y1p74h/)

   2. [The best VIM tutorial I have ever seen, the original video is from YouTube](https://www.bilibili.com/video/BV1pE411y7nj/)

- Vim book recommendation

   1. **VIM Practical Tips** (super good VIM book)

   2. VIM8 text processing actual combat (not bad)

- Learn [vimscript](./vimscript/README.md) (not necessary unless very demanding)

---

### Vim learning route recommendation

1. Find a reason why you must use VIM (otherwise you will not be able to use it)

    - Find the simplest VIM tutorial (such as [this](https://www.bilibili.com/video/BV13t4y1t7Wg/)), use VIM as a normal editor

2. Find a simple (**very important**) out-of-the-box configuration (such as this warehouse) [video](https://www.bilibili.com/video/BV1RV4y1K7Le/)

    - Apply VIM to daily life

    - Watch VIM videos after using it to a certain extent

3. Understand vimrc configuration content (controllability) [Video] (https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

    - Start reading VIM books

4. Start to customize your own VIM

    - Understand vimscript simple syntax configuration

---

![](https://www.yundongfang.com/wp-content/uploads/2021/03/Vim-Text-Editor-logo.png)

---

- If this warehouse is useful to you, you can give a star
