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

- I have been using Vimplus before[](https://gitee.com/chxuan/vimplus.git), but Vimplus has several problems

  1. Vimplus has not been updated for a long time, and quite a few issues have not been resolved

  2. At present, the mainstream completion scheme is lsp, and the YCM used by Vimplus is a bit old and needs to be compiled by itself

  3. Some plug-ins already have a better replacement

  4. Github access is too slow, resulting in plug-in download is too slow, not friendly to novices

- for other configurations,

  - Some have github access problems, are not friendly to VIM novices, and are not friendly enough for server configuration

  - Some are too complicated, making the configuration file basically too far from the original.vimrc, and even using different formats of configuration files, which makes it troublesome to customize VIM later, and too redundant

  - Some use lua completely, making VIM incompatible

  - Some use too many files and structures and are not friendly to novices

- Based on the above problems, I want to create based on Vimplus to make it better

## Project characteristics

1. **Install the VIM configuration (including lsp and the like) from the new linux host in 3 minutes, and solve all problems in 3 minutes**

2. Based on Vimplus, all configuration files are in.vimrc, and the configuration files of more than 1000 lines are simpler and more intuitive, while avoiding redundancy of multiple configuration files

3. Plug-ins streamlined, selected 23 plug-ins, making the opening speed increased (**with plug-in version about 130ms, no plug-in version about 20ms**)

4. **Plug-in compression package on gitee, making plug-in download speed has been improved**, friendly to novices, providing shell script one-click configuration plug-in

5. Added a function-based shortcut to find, to avoid the shortcut to forget, through the\<space\>H open

6. Improved **mouse support**, making novices more friendly

7. Support **C/C++,Go,Python,Rust** language one-click configuration (welcome to add more language support)

8. Use coc instead of YCM for a better completion experience

9. Support more diverse themes (more than 10), better visual experience (default tokyonight)

10. Provide shell scripts to customize Vim

11. Detailed Chinese project documentation, more friendly to beginners

12. [**Built-in a simple and complete task management system to facilitate the establishment of a one-click compilation and operation system**](https://github.com/chenxuan520/termtask.vim)

13. Provide one-click download configuration of Chinese VIM manual[(based on Vimcdoc)](https://github.com/yianwillis/vimcdoc)

14. [**Built-in markdown shortcut plugin**](https://github.com/chenxuan520/markdown-simple.vim)

15. Markdown file to **provide ibus input method switching operation**(default), preview markdown(default)

16. And ici and lazygit,fzf,lf integration, no additional plug-ins, you can achieve translation and git management, file management

17. Built-in a **simplified version of Vimrc without plugins**, you can use it without plugins or root privileges

18. Configured folding makes code browsing easier

19. Built-in convenient vimscript for easy learning and simplified operation

## Built-in Vimscript functionality

1. Full-text selection, similar to plug-in[Vim-textobj-entire](https://github.com/kana/vim-textobj-entire)

2. markdown, quick write, format, similar plug-in[vim-markdown](https://github.com/preservim/vim-markdown)

3. **Task management**, similar to the plugin[asynvtasks](https://github.com/skywind3000/asynctasks.vim)

4. **Git status display**, similar to plugin[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

5. Pre-code insertion, similar to plug-in[prepare-code](https://github.com/chxuan/prepare-code)

6. Parameter selected, similar to the plug-in[vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)

7. Highlight, similar to the plug-in[vim-textobj-syntax](https://github.com/kana/vim-textobj-syntax)

8. Indent selection, similar to the plug-in[vim-textobj-indent](https://github.com/kana/vim-textobj-indent)

9. Ibus input method automatic switching, similar to plug-in[vim-ibus](https://github.com/h-youhei/vim-ibus)

10. lazygit and Vim integration, the effect is better, similar to the plugin[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

11. lf and vim integration, similar to the plugin[lf.vim](https://github.com/ptzz/lf.vim)

12. Ici translation, similar to plugin[ici.vim](https://github.com/Flowerowl/ici.vim)

13. Color visualization, similar to plug-in[colorizer](https://kgithub.com/lilydjwg/colorizer)

14. Binary file editing, similar to plugin[Vinarise](https://github.com/Shougo/vinarise.vim)

15. Multi-cursors editing, similar[to vim-multiple-cursors plugin](https://github.com/terryma/vim-multiple-cursors)

16. editorconfig support, similar to plug-in[editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)

17. **Query whether the key is bound and the bound position**,\<leader\>h and\-h trigger detection

18. The mdbook directory is automatically generated

19. View and open the recently closed buffer

20. Simple markdown and html preview

21. Fzf call

- Note: The above features are built into Vim-fast and will not affect Vim startup speed

## Project Folder

- autoload plug-in plug.vim, providing plug-in installation

- Fonts font folder, pre-download, reduce download time

- Colors theme folder, providing more than 10 themes

- Doc Help

- vimscript Some useful VIM scripts

- old Vimplus old version of the file (not recommended, for reference only)

## shell script

- install.shinstallation script, first run, install vim-fast

- install_without_sudo.sh is installed without root and sudo

- update.shPull the latest configuration of vim-fast

- uninstall.shuninstall vim-fast

- shell/cpp/go/rust/python.shfour languages lsp and coc installation, run install.sh after the call on demand

- shell/plug.shDownload and install all the latest plugins (, auto-invoke, use gitee, faster)

- shell/doc_en.sh Download and install vim documentation

- shell/self.shcustomize that name and email in.vimrc to your own

- shell/nodejs.shnodejs installation script, will automatically call

- shell/color.shAdd a Vim theme

- shell/coc_plug.sh Recommended coc plugin installation

- shell/vim_compile.sh vim latest version compile and install

- nvim.shOne-click migration to nvim

## Other documents

- .vimrc VIM configuration file

- vimrc-no-plug does not contain VIM configuration for plugins and themes

## Item Description

1. **! Currently only supports ubuntu,debian, and other ubuntu linux(such as debian,linux mint, etc.), other systems can use vimplus!, At the same time, I hope that everyone can mention mr to improve the warehouse, or propose a system that explains the requirements of the issue**

2. The project is based on[Vimplus](https://gitee.com/chxuan/vimplus.git)

3. **If you encounter a problem, please read the QA section of this article first. If you can't solve it, then raise an issue or contact the author**

## Videos and Articles

- [bilibili](https://space.bilibili.com/322142755)

  1. [installation](https://www.bilibili.com/video/BV1RV4y1K7Le/)

  2. [Configuration Details](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

  3. [Custom VIM Configuration](https://www.bilibili.com/video/BV1Y84y1q79F/)

  4. Update ing

- [zhihu](https://zhuanlan.zhihu.com/p/524286962)

## Installation
> The first and second steps can be simplified to
>
> curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/webinstall.sh |bash
>
> (If you encounter output confusion after installation, you can directly close the terminal and restart it)

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh

3. Press ![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png)enter when it appears

4. The following figure appears and the installation is complete

5. ![](https://pic4.zhimg.com/80/v2-7d5e78a2fbd546f19002673ed432a8ff_720w.jpg)

6. Execute different scripts for different languages

#### C++

1. ./shell/cpp.sh

   ![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. The following figure shows that the configuration is successful

   ![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

1. ./shell/python.sh

   ![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. This completes the installation of python successfully

   ![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./shell/go.sh

   ![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. It takes a while to download the file when you edit it, about two minutes

   ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. This is a successful completion for the installation of go

   ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

#### Rust

1. ./shell/rust.sh

2. Wait for the installation to finish (about a minute), and if there is no rust environment, it will download automatically

### Easy to install plug-in-free version
   > curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/websimple.sh | bash

   - Or ...

   > wget https://gitee.com/mirrorvim/vim-fast/raw/master/vimrc-no-plug -O ~/.vimrc

#### No plug-in version description

   1. The plug-in-free version has only one file (vimrc) and does not create any other files, so you can copy and paste the file (./) directly vimrc-no-plug) to ~/.vimrc

   2. Built-in plugins include **easy-motion**,vim-surround,vim-commentary,auto-pair,vim-slash,vim-airline

   3. Built-in tokynight color theme, as well as all the plug-in version of the custom button function

   4. If you have fzf installed, you have most of the functionality of leaderf

## Update

   - ./update.sh

## External tool integration

1. [lazygit](https://github.com/jesseduffield/lazygit), you need to install lazygit, so that you can call the shell directly from the shell. Press space +g to trigger

2. [ici Translate](https://github.com/Flowerowl/ici)`pip install ici`, and modify the path of ici in.vimrc, press in normal mode or visual mode,i translate words

3. [fzf File Search](https://github.com/junegunn/fzf/),`sudo apt install fzf`,\<space\>z/Z trigger

4. [lf File Manager](https://github.com/gokcehan/lf/), need to install lf,\<space\>e/E trigger

## Vimplus original warehouse

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. Is there an Nvim version?

   - Nvim can be temporarily installed through nvim. sh, and the lua configuration version will be in another repository

2. My system does not support

   - You can submit an issue or make your own mr

3. PlugInstall appears\# unsafe repository git config --global --addsafe.directory

   - git config --global --add safe.directory "\*"

4. xshell,tmux open color confusion

   - In xshell,"Tools"->"Options"->"Advanced"->"Use True Color", open and restart xshell

   - Tmux can only switch the theme to onedark and turn off termguicolors, setting let g:onedark_termcolors=256

5. Do you need root or sudo privileges

   - If you have installed vim-fast before this machine or the corresponding software has been installed, you do not need sudo, otherwise you need sudo to install the package

   - If you do not have root privileges, you can run./install_without_sudo.sh, but some features may not

6. I want to customize the dashboard content when Vim starts

   - Get the pattern representation[Spring Boot banner online generation tool](https://www.bootschool.net/ascii), select type`ANSI Shadow`

   - Get the Vim form[vim-dashboard-header-make](https://chenxuan520.gitee.io/chenxuanweb/header.html)(took a little time to do it, because I don't write the front end, the picture is poor)

   - Copy the result to.vimrc

7. E1208: -complete used without allowing argumentsPress ENTER or type command to continue

   - Go to the coc.nvim plugin directory and git reset --hard v0.0.81

   - Or edit the error file coc.vim and delete line 438

8. Vim specific file pre-generated code I want to modify

   - In`~/.vim/ftplugin`, find the folder of the corresponding file and modify the contents of comment.vim

9. Console Status Bar and Icon Confusion

  - Set the font for the console, open preferences, and set the font to`DroidSansMono Nerd Font Book`

  - If you do not want to set or can not set, you can choose to disable the icon function

     1. Comment the following code
      ```
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      ```

      2. Comment`Plug 'ryanoasis/vim-devicons'`

      3. Add`let g:dashboard_icon_disable=1`

10. E 117, undefined function getenv

  - The reason for the problem is that the VIM version is too low, you can upgrade VIM(./shell/vim_compile. sh) or go to the line in question and delete it

11. Theme used

  - [tokyonight](https://github.com/ghifarit53/tokyonight-vim)

12. There is no more cursor after ctrl-s, but it is stuck

  - Add`stty -ixon`to ~/.bashrc, and then re-open the terminal to load it

13. Error installing nodejs, unable to connect to download

  - Rerun./shell/nodejs.sh

14. Using vim's backspace in xshell cannot delete characters

  - xshell problem,[reference](https://www.cnblogs.com/yjd_hycf_space/p/11329841.html)

## Help

1. [Plugin shortcut description](./doc/key.md)(may be partially outdated, it is recommended to use\<space\>H to view)

2. [Vim Some Key Help](./doc/help.md)

## Feedback

   - Bugs or problems can be raised using github or gitee issues

   - Or contact me directly by adding Q1607772321

## Hope

- Due to limited personal ability, i hope you can write a copy of the system, and then mention mr, thank you very much

## Postscript

- Using VIM shouldn't really be an out-of-the-box ide, but the interface that didn't have anything at first dissuaded most people, so I made this repository to take you to VIM as an IDE in the least amount of time, but let the configuration file be as simple as possible

- When you may be familiar with VIM, you may feel that the shortcuts I set are anti-human. At that time, you can customize everything yourself. Everything in VIM can be customized. When you edit.vimrc yourself,VIM will become You are the most hand-picked weapon

---

### Vim learning materials recommended

- Vim Video

  1. [Suitable for quick start, the original video comes from MOOC](https://www.bilibili.com/video/BV1NG4y1p74h/)

  2. [Best VIM tutorial I've ever seen, original video from YouTube](https://www.bilibili.com/video/BV1pE411y7nj/)

- Vim Books Recommended

  1. **VIM practical tips**(super good VIM books)

  2. VIM8 text processing combat (also OK)

- Learn[vimscript](./vimscript/README.md)(not necessary unless it's very demanding)

---

### Vim learning route recommended

1. Find a reason to use VIM (otherwise you can't use it)

   - Find the simplest VIM tutorial (like[this one](https://www.bilibili.com/video/BV13t4y1t7Wg/)) and use VIM as a normal editor

2. Find a simple (**and very important**) out-of-the-box configuration (such as this repository)[Video](https://www.bilibili.com/video/BV1RV4y1K7Le/)

   - Apply VIM to your daily life

   - Wait to see VIM video to a certain extent

3. Read vimrc configuration content (controllability)[video](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

   - Start reading VIM books

4. Start customizing your own VIM

   - Understanding vimscript simple syntax configuration

---

![](https://www.yundongfang.com/wp-content/uploads/2021/03/Vim-Text-Editor-logo.png)

---

- If this warehouse is useful to you, you can give it a star
