# Vim-Fast

- A **super fast** Vim configuration script

### Produced by

**chenxuan**

- [README](./README.en.md) in English

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

## Why it was made

- I've been using [Vimplus](https://gitee.com/chxuan/vimplus.git) before, but Vimplus has a few problems

  1. Vimplus has not been updated for a long time, and many issues have not been resolved

  2. the current mainstream complementary solution is lsp, Vimplus use of YCM is a bit old, and need to compile their own

  3. some plugins already have a better replacement solution

  4. github access is too slow, resulting in slow download of plugins, not friendly to newcomers

- For other configurations,

  - Some have github access problems, which is not VIM newbie friendly, and not server configuration friendly

  - Some are too complex, making the configuration file basically too far from the original .vimrc, or even use a different format of the configuration file, which makes the later customization of VIM becomes very troublesome, and too redundant

  - Some completely use lua, making the VIM incompatible problems

- Based on the above problems, I would like to create a project based on Vimplus to make it even better.

## Project features

1. **Normal 3 minutes to install a good VIM configuration from a new linux host (including lsp and so on), 3 minutes to solve all the problems**

2. based on Vimplus, so that all configuration files are in .vimrc, more than 600 lines of configuration files more simple and intuitive, but also to avoid multiple configuration files redundant

3. the plug-ins are streamlined and simplified, with a selection of 30 plug-ins to improve opening speed

4. the plug-in archive is placed on gitee, making the download speed of plug-ins improved, friendly to newcomers, providing shell scripts for one-click configuration of plug-ins

5. added function-based shortcut key search, to avoid forgetting the shortcut key

6. improved **mouse support**, making it more novice friendly

7. support C/C++, Go, python language one click configuration (welcome to add more language support)

8. use coc instead of YCM, better completing experience

9. support more diverse themes (more than 10 kinds), better visual experience

10. provide shell scripts to customize Vim

11. detailed Chinese documentation, more friendly to newcomers

12. provide Chinese VIM manual one-click download configuration [(based on Vimcdoc)](https://github.com/yianwillis/vimcdoc)

## Project folder

- autoload plugin plug.vim, providing installation of the plugin

- fonts folder, pre-downloaded to reduce download time

- colors Themes folder, with over 10 themes

- doc help documentation

- vimscript Some useful VIM scripts

- old Vimplus files (not recommended)

## shell scripts

- install.sh install script, run first, to install vim-fast

- install_without_sudo.sh install without root and sudo (need to download apt package in advance)

- cpp/go/python .sh install lsp and coc for all three languages, run install.sh and call it as needed

- update.sh to pull the latest configuration of vim-fast

- uninstall.sh to uninstall vim-fast

- plug.sh download and install all the latest plugins (,automatically called, use gitee, faster)

- doc_zh.sh download and install vim Chinese documentation

- self.sh customize the name and email in .vimrc to your own

- nvim.sh migrate to nvim with one click

- nodejs.sh nodejs installation script, which will be called automatically

## Other files

- .vimrc VIM configuration file

- vimrc-no-plug VIM configuration without plugins and themes

## Project description

1. **! Currently only ubuntu, debian, and other ubuntu linux are supported, other systems can use vimplus!**

2. the project is based on [Vimplus](https://gitee.com/chxuan/vimplus.git)

## Videos and articles

- [bilibili](https://space.bilibili.com/322142755)

  1. [Installation](https://www.bilibili.com/video/BV1RV4y1K7Le/)

  2. [Configuration in detail](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

  3. updateing

- [zhihu](https://zhuanlan.zhihu.com/p/524286962)

## Install

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://link.zhihu.com/?target=https%3A//gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh

3. appear![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png) and press enter

4. The following image appears and the installation is complete

5. ![](https://pic2.zhimg.com/v2-3b7939b834020c3e01d17e27c8381491_r.jpg)

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

2. When you first edit the file you need to wait a little while for it to download, about two minutes

   ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. This means that the installation of go completes successfully

   ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

## Vimplus repository

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. is there an nvim version?

   - nvim can be installed via nvim.sh for now, the lua configuration version will take some time

2. my system doesn't support it

   - You can raise an issue or make your own mr

3. plugInstall appears # unsafe repository git config --global --add safe.directory

   - git config --global --add safe.directory "*"

4. xshell,tmux opens with confusing colours

   - xshell "tools" -> "options" -> "advanced" -> "use natural colours", turn it on and restart xshell

   - tmux currently only switches the theme to onedark and turns off termguicolors, set let g:onedark_termcolors=256

5. Do you need root or sudo access?

- If vim-fast has been installed on the machine before or if all the corresponding software is already installed, you don't need sudo, otherwise you need sudo to install the package.

6. I want to customize the dashboard content when Vim starts

- Get the pattern representation [Spring Boot banner online generation tool](https://www.bootschool.net/ascii), choose the type 'ANSI Shadow'

- Get the Vim form [vim-dashboard-header-make](https://chenxuan520.gitee.io/chenxuanweb/header.html) (took a bit of time to do this myself, as I don't write much front-end and the graphics are rather poor)

- Copy the result to .vimrc

7. appears E1208: -complete used without allowing argumentsPress ENTER or type command to continue

   - Go into the coc.nvim plugin directory and git reset --hard v0.0.81

   - Or edit coc.vim to remove line 438 from the error file

8. I want to change the pre-generated code for a specific Vim file

   - Find the corresponding file in `~/.vim/ftplugin` and change the contents of comment.vim

## Help

1. [plugin shortcut description](./doc/key.md)

2. [Vim keystroke help](./doc/help.md)

## Hope

- Due to personal limitations, I hope you can write an install.sh for your own system, and then mention mr, thank you very much!

## Postscript

- Using VIM should not really be used as an IDE out of the box, but at first the nothing interface discourages most people, so I have created this repository to take you through the process of making VIM an IDE in the least amount of time, but keeping the configuration files as simple as possible.

- When you are familiar with VIM, you may feel that the shortcuts I have set are anti-human, at that time you can customize everything yourself, everything in VIM is customizable, when you edit .vimrc yourself, VIM will become your best weapon!

---Vimrc is your best weapon.

### Vim learning materials recommended

- Introduction to Vim videos

  1. [Suitable for a quick start, original video from MU](https://www.bilibili.com/video/BV1NG4y1p74h/)

  2. [The best Vim tutorial I've ever seen, original video from the oil pipe](https://www.bilibili.com/video/BV1pE411y7nj/)

- Vim book recommendations

  1. **VIM Practical Tips** (Superb VIM book)

  2. VIM8 Text Processing in Action (also ok)

- Learn [vimscript](./vimscript/README.md) (not necessary unless very demanding)

---

### Vim learning route recommendations

1. find a reason why you must use VIM (otherwise you won't be able to use it)

   - Find the simplest VIM tutorial (e.g. [this](https://www.bilibili.com/video/BV13t4y1t7Wg/)) and use VIM as a general editor

2. find a simple (**very important**) and out-of-the-box configuration (such as this repository) [video](https://www.bilibili.com/video/BV1RV4y1K7Le/)

   - Putting VIM to work on a daily basis

   - Watch the VIM video when you get to a certain point

3. read vimrc configuration content (controllability) [video](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

   - Start reading VIM books

4. start to customize your own VIM

   - Understand vimscript Simple syntax configuration

---

![](https://www.yundongfang.com/wp-content/uploads/2021/03/Vim-Text-Editor-logo.png)

---

- If this repository is useful to you, give it a star
