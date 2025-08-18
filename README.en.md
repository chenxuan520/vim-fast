# Vim-Fast

- A **super fast** Vim configuration script

### producer

**chenxuan**

- [README](./README.en.md) in English

```txt
        _            __          _
       (_)          / _|        | |
 __   ___ _ __ ___ | |_ __ _ ___| |_
 \ \ / / | "_ " _ \|  _/ _" / __| __|
  \ V /| | | | | | | || (_| \__ \ |_
   \_/ |_|_| |_| |_|_| \__,_|___/\__|
```

## warehouse address


1. gitee:[vim-fast: A easy vim config](https://gitee.com/mirrorvim/vim-fast)

2. github:[GitHub - chenxuan520/vim-fast](https://github.com/chenxuan520/vim-fast)

## allocation effect

### opening effect

![](https://pic1.zhimg.com/80/v2-bbb4ad457961cf116facf75be76486b0_720w.jpg)

### edit effects

![](https://picx.zhimg.com/70/v2-7f64e5078afe4b4ef6ca033ae4fecbe2_1440w.awebp)

## Why make

- I've been using[Vimplus](https://gitee.com/chxuan/vimplus.git), but there are a few issues with Vimplus.

  1. Vimplus hasn't been updated for a long time, quite a few issues haven't been resolved

  2. Currently the mainstream completion scheme is lsp,Vimplus uses YCM a bit old, and need to compile their own

  3. Some plugins already have a better alternative

  4. Github access is too slow, resulting in plug-ins download too slow, unfriendly to novices

- for other configurations,

  - Some have github access problems, are not friendly to VIM novices, and are not friendly enough to server configuration

  - Some are too complex, so that the basic configuration file and the original.vimrc are too far apart, and even use different format configuration files, which makes it troublesome to customize VIM later, and too redundant.

  - Some use lua completely, making VIM incompatible.

  - Some use too many files and structures and are not friendly to novices

- So based on that, I wanted to build on Vimplus and make it better.

## project characteristics

1. **Normal 3 minutes to install VIM configuration from new Linux host (including lsp etc.), 3 minutes to solve all problems**

2. Based on Vimplus, all configuration files are in.vimrc, more than 1100 lines of configuration files are simpler and intuitive, and multiple configuration files are avoided.

3. Plug-ins streamlined, selected 23 plug-ins, so that the opening speed has been improved (**plug-in version about 130ms, no plug-in version about 20ms**)

4. **Plug-in compression package on gitee, so that plug-in download speed has been improved**, novice-friendly, shell script to provide a one-click configuration plug-in

5. Added function-based shortcut key lookup to avoid shortcut key forgetfulness, opened via\<space\>H

6. Improved **mouse support** to make novice friendly

7. Support **C/C++,Go,Python,Rust** language one-click configuration (welcome to add more language support)

8. Use coc instead of YCM for better completion experience

9. Support for more diverse themes (more than 10), better visual experience (default tokyonight)

10. Provide shell scripts to customize Vim

11. Project Chinese documentation detailed, more novice friendly

12. [**Built-in a simple and complete task management system, easy to establish a one-click compilation and operation system**](https://github.com/chenxuan520/termtask.vim)

13. One-click download configuration of VIM manual in Chinese[(based on Vimcdoc)](https://github.com/yianwillis/vimcdoc)

14. [**Built-in markdown shortcut plugin**](https://github.com/chenxuan520/markdown-simple.vim)

15. markdown file **provides ibus input method switching operation** (default), preview markdown(default)

16. Integration with ici and lazygit,fzf,lf, translation and git management, file management without additional plug-ins

17. Built-in a **simplified version of Vimrc without plugins**, no plugins or root privileges can also be used

18. Collapsing function configured to make code browsing easier

19. Built-in convenient vimscript for easy learning and simplified operation

## Built-in Vimscript functionality

1. Select full text, similar plug-ins[Vim-textobj-entire](https://github.com/kana/vim-textobj-entire)

2. markdown, shortcut writing, formatting,[plug-in like vim-markdown](https://github.com/preservim/vim-markdown)

3. **Task management**, similar to plugin[asynvtasks](https://github.com/skywind3000/asynctasks.vim)

4. **git status display**, similar to plugin[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

5. Prepare-code insertion, similar to plug-in[prepare-code](https://github.com/chxuan/prepare-code)

6. parameter selected, similar to plug-in[vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)

7. Highlight, similar to plugin[vim-textobj-syntax](https://github.com/kana/vim-textobj-syntax)

8. indented selected, similar to plugin[vim-textobj-indent](https://github.com/kana/vim-textobj-indent)

9. ibus input method automatic switching, similar to plug-in[vim-ibus](https://github.com/h-youhei/vim-ibus)

10. lazygit and Vim integration, works better, similar to the plugin[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

11. lf and vim integration, similar to plugin[lf.vim](https://github.com/ptzz/lf.vim)

12. ici translation, similar to plugin[ici.vim](https://github.com/Flowerowl/ici.vim)

13. Color visualization, similar to plugin[colorizer](https://kgithub.com/lilydjwg/colorizer)

14. Binary file editing, similar to plugin[Vinarise](https://github.com/Shougo/vinarise.vim)

15. Multi-cursor editing, similar to plug-ins[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

16. editorconfig support, similar to plug-in[editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)

17. **Query whether keys are bound and where they are bound**,\<leader\>h and\-h trigger detection

18. mdbook directory automatically generated

19. View and open recently closed buffers

20. Simple markdown and html preview

21. Fzf calls

- Description: All of the above features are built into Vim-fast and do not affect Vim startup speed.

## project folder

- autoload plug-in plug.vim, provides plug-in installation

- fonts folder, pre-download, reduce download time

- colors theme folder, offering more than 10 themes

- doc Help Documentation

- vimscript Some useful VIM scripts

- old Vimplus old files (not recommended, reference only)

## Shell script

- install.sh install script, run first, install vim-fast

- install_without_sudo.sh installed without root and sudo

- update.sh Pull vim-fast latest configuration

- uninstall.sh uninstall vim-fast

- shell/cpp/go/rust/python.sh lsp and coc installation in four languages, run install.sh and call on demand

- shell/plug.sh Download and install all the latest plugins (, auto-invoke, use gitee, faster)

- shell/doc_zh.sh Download and install vim Chinese documentation

- shell/self.sh customize the name and email in.vimrc to your own

- shell/nodejs.sh nodejs installation script, which automatically calls

- shell/color.sh Add a Vim theme

- shell/coc_plug.sh Recommended coc plugin installation

- shell/vim_compile.sh vim latest version compile install

- nvim.sh One-click migration to nvim

## other documents

- .vimrc VIM Profile

- vimrc-no-plug VIM configuration without plugins and themes

## item description

1. **! Currently only supports ubuntu,debian, and other ubuntu linux(such as debian,linux mint, etc.),mac support may not be perfect, other systems can use vimplus!, At the same time, I hope that everyone can propose mr to improve the warehouse, or propose a system for issue specification requirements.**

2. The project is based on[Vimplus](https://gitee.com/chxuan/vimplus.git)

3. **If you encounter a problem, please read the QA section of this article first. If you can't solve it, raise an issue or contact the author.**

4. Vim version **8.1** or above

5. If there is a problem other than QA, give priority to whether it is a nodejs version problem, after testing v18.13.0 version is no problem,[refer to](https://juejin.cn/post/7132680379898527757)

## Videos and Articles

- [bilibili](https://space.bilibili.com/322142755)

  1. [installation](https://www.bilibili.com/video/BV1RV4y1K7Le/)

  2. [configuration details](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

  3. [Custom VIM configuration](https://www.bilibili.com/video/BV1Y84y1q79F/)

  4. Update ing

- [zhihu](https://zhuanlan.zhihu.com/p/524286962)

## installation
>The first and second steps can be simplified to
>
> curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/webinstall.sh |bash
>
>(After installation, if you encounter a problem with output confusion, you can directly close the terminal and restart it)

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./ install.sh (**sudo is not required,sudo will make the file location wrong**)

3. Press Enter when it appears

4. The following figure appears, installation is complete

5. ![](https://pic4.zhimg.com/80/v2-7d5e78a2fbd546f19002673ed432a8ff_720w.jpg)

6. Execute different scripts for different languages

#### C++/C

1. ./ shell/cpp.sh

   ![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. The following figure appears. Configuration is successful.

   ![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

>Note:node needs to be above 14, use node --version to view node version, if the version is too low, refer to[this article to solve](https://juejin.cn/post/6980714131217350692)

1. ./ shell/python.sh

   ![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. This is a successful Python installation.

   ![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./ shell/go.sh

   ![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. When you first edit a file, you need to wait for a while to download it, about two minutes.

   ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. This is a successful installation.

   ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

#### Rust

1. ./ shell/rust.sh

2. Wait for the installation to finish (about one minute), if no rust environment exists it will download automatically

### Easy to install plug-in free version
   > curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/websimple.sh | bash

   - or

   > wget https://gitee.com/mirrorvim/vim-fast/raw/master/vimrc-no-plug -O ~/.vimrc

#### No plug-in version description

   1. The plug-in-free version has only one file (vimrc) and does not create any other files, so you can copy and paste files directly (./ vimrc-no-plug) to ~/.vimrc

   2. Built-in plugins have **easy-motion**,vim-surround,vim-commentary,auto-pair,vim-slash,vim-airline most of the functions

   3. Built-in tokynight color theme, and all custom button functions with plug-in version

   4. If fzf is installed, it has most of the features of leaderf

## update

   - ./ update.sh

## uninstall

   - ./ uninstall.sh

## External tool integration

1. [lazygit](https://github.com/jesseduffield/lazygit), lazygit needs to be installed, so that shell can be called directly from shell. Press space +g to trigger

2. [ici Translate](https://github.com/Flowerowl/ici)`pip install ici`, and modify the path to ici in.vimrc, press, i in normal mode or visual mode to translate the word

3. [fzf File Search](https://github.com/junegunn/fzf/),`sudo apt install fzf`,\<space\>z/Z trigger

4. [lf File Manager](https://github.com/gokcehan/lf/), lf,\<space\>e/E trigger needs to be installed

## Vimplus former warehouse

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. Is there an NVIM version?

   - nvim can be installed via nvim.sh, configuration compatible

2. My system has no support.

   - You can submit an issue or make your own mr

3. PlugInstall appears\# unsafe repository git config --global --add safe.directory

   - git config --global --add safe.directory "\*"

4. xshell,tmux open color confusion

   - xshell "Tools"->"Options"->"Advanced"->"Use Color", restart xshell after opening

   - tmux can only switch theme to onedark at present, and turn off termguicolors, set let g:onedark_termcolors=256

5. Do you need root or sudo privileges?

   - If vim-fast has been installed before this machine or the corresponding software has been installed, sudo is not required, otherwise sudo is required to install the software package.

   - If you don't have root privileges, you can run./ install_without_sudo.sh, but some features may not

6. I want to customize dashboard content when Vim starts

   - Get Pattern Representation[Spring Boot banner online generation tool](https://www.bootschool.net/ascii), select type`ANSI Shadow`

   - Get Vim form[vim-dashboard-header-make](https://chenxuanweb.top/cppnet/header.html) (took a little time to do it, because I don't write much about the front, the picture is poor)

   - Copy the result to.vimrc

7. E1208: -complete used without allowing arguments Press ENTER or type command to continue

   - Go to the coc.nvim plugin directory and git reset --hard v0.0.81

   - Or edit the error file coc.vim, delete line 438 or

8. Vim specific file pre-generated code I want to modify

   - Find the folder corresponding to the file in`~/.vim/ftplugin/template`, and modify the contents of the file

9. Messy Console Status Bar and Icons (Important Note)

  - Set the terminal font:

       - On Linux systems:

           1. Open terminal preferences.

           2. Set the font to `DejaVuSansM Nerd Font Mono` (if not installed, double-click the .ttf file to install it).

       - On macOS (using iTerm2 as an example):

           1. Open the `fonts` folder (located in the project root directory), then double-click the `DejaVu.ttf` file to install the font.

           2. Go to iTerm2 → Settings → Profiles → Text → Font.

           3. Set the font to `DejaVuSansM Nerd Font Mono`.

           4. For MacVim GUI users, use `set guifont=DejaVuSansM_Nerd_Font_Mono:h22`.

       - On Windows (using Windows Terminal as an example):

           1. Open the `fonts` folder (in the project root directory), then double-click the `DejaVu.ttf` file to install the font.

           2. Navigate to Settings → Defaults → Appearance → Font in Windows Terminal.

           3. Set the font to `DejaVuSansMono Nerd Font`.

   - If you prefer not to set or cannot set these configurations, you may disable icon features instead:

       1. Comment out the following code block. If garbled text still appears after execution, replace special characters like `` with spaces in this code:
           ```vim
           let g:airline_left_sep = ''
           let g:airline_left_alt_sep = ''
           let g:airline_right_sep = ''
           let g:airline_right_alt_sep = ''
           ```

       2. Comment out the line `Plug 'ryanoasis/vim-devicons'`.

       3. Add `let g:dashboard_icon_disable=1` to your `~/.vimrc` file.

10. E117, undefined function getenv appears

  - The reason for the problem is that the VIM version is too low, you can upgrade VIM(./ shell/vim_compile.sh Latest Vim installation) or go to the line in question and delete the line

11. Theme used

  - [tokyonight](https://github.com/ghifarit53/tokyonight-vim)

12. There is no more cursor after ctrl-s, but it is stuck

  - Terminal settings problem,`stty -ixon` added to ~/.bashrc, and then re-open the terminal load can be

13. Error installing nodejs, unable to connect download

  - Re-run./ shell/nodejs.sh

14. backspace using vim in xshell cannot delete characters

  - xshell problems,[reference](https://www.cnblogs.com/yjd_hycf_space/p/11329841.html)

15. nvim cannot use the system pasteboard

  - Run`sudo apt install xclip`,[see](https://zhuanlan.zhihu.com/p/667386801)

16. Appearance of ctags: Warning: Cannot disable fixed field

  - The default version of ctags is too low and needs to be updated. [Download address](https://github.com/universal-ctags/ctags-nightly-build/releases)

  - If you can't open the github link, you can also use [the one I downloaded in advance](https://gitee.com/mirrorvim/userful-tools-2/releases/download/ctagsv1.0.1/ctags) (note that it is for linux x86_64).

17. pyright cannot recognize local packages (coc plugin)

  - Change the `~/.config/nvim/coc-settings.json` file and modify the `python.pythonPath` in it to the correct python path.

18. There is no only completion for vimscript and lua.

  - For vimscript, use `:CocInstall coc-vimlsp`.

  - For lua, use `:CocInstall coc-sumneko-lua`, and at the same time add `"sumneko-lua.enableNvimLuaDev": true` in CocConfig. 

## help

1. [Plugin shortcut key description](./doc/key.md)(You can also use \<space\>H to check.)

2. [Vim Some Keys Help](./doc/help.md)

## feedback

   - Bugs or problems can be raised using github or gitee issues

   - Or contact me directly by adding Q1607772321

## hope

- Due to personal capacity is limited, I hope you can give their own system to write an install.sh, and then mention mr, thank you very much

## PostScript

- Using VIM shouldn't really be an IDE out of the box, but the lack of an interface at first discourages most people, so I built this repository to take you to an IDE in the least amount of time, but keep the configuration file as simple as possible.

- When you are familiar with VIM, you may feel that the shortcut keys I set are anti-human. At that time, you can customize everything yourself. Everything in VIM can be customized. When you edit.vimrc yourself,VIM will become your most suitable weapon.

---

### Vim learning materials recommended

- Vim Video Introduction

  1. [Suitable for quick start, original video from MOOC](https://www.bilibili.com/video/BV1NG4y1p74h/)

  2. [Best VIM tutorial I've seen, original video from YouTube](https://www.youtube.com/watch?v=mPVwS8gjDVI&list=PLBd8JGCAcUAH56L2CYF7SmWJYKwHQYUDI)

- Vim Recommended Books

  1. **VIM practical tips**(super good VIM books)

  2. VIM8 text processing combat (also OK)

- Learn[vimscript](./vimscript/README.md) (not necessary unless demanding)

---

### Vim Learning Route Recommendations

1. Find a reason to use VIM (or else you won't)

   - Find the simplest VIM tutorial (like[this one](https://www.bilibili.com/video/BV13t4y1t7Wg/)) and use VIM as a regular editor

2. Find a simple (**very important**) and out-of-the-box configuration (like this repository)[Video](https://www.bilibili.com/video/BV1RV4y1K7Le/)

   - Apply VIM to everyday life

   - Wait until you use it to a certain extent to watch VIM videos

3. Read vimrc configuration content (controllability)[video](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

   - Start reading VIM books

4. Start customizing your own VIM

   - Understanding vimscript simple syntax configuration

---

![](https://edyfox.codecarver.org/html/vim-logo-en.png)

---

- If this warehouse is useful to you, you can give it a star.
