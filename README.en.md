# Vim Quick configuration

### producer

**chenxuan**

- [README](./README.en.md) in English

## Warehouse address

1. gitee:[vim-fast: A easy vim config](https://gitee.com/mirrorvim/vim-fast)

2. github:[GitHub - chenxuan520/vim-fast](https://github.com/chenxuan520/vim-fast)

## Configuration effect

![](https://picx.zhimg.com/v2-465040e3e32df418808b886729a1815f_1440w.jpg?source=172ae18b)

## Why is it made

- have been used before [Vimplus](https://gitee.com/chxuan/vimplus.git), but Vimplus appear a few problems
1. Vimplus has not been updated for a long time, and many issues have not been solved

2. The current mainstream completion scheme is LSP. The YCM used by Vimplus is a little old and needs to be compiled by itself

3. Some plugins already have a better replacement

4. Github access is too slow, resulting in slow plug-in download, which is not friendly to beginners
- For other configurations,

- Some have Github access issues, are not friendly to new VIM users, and are not friendly to server configuration

- Some configuration files are so complex that they are basically different from the original. Vimrc, and even use different configuration files, which makes it cumbersome and redundant to customize VIM later

- Some use Lua entirely, making VIM incompatible

- Based on the above questions, I want to create based on Vimplus to make it better

## Project features

1. **It takes 3 minutes to install the VIM configuration (including LSPS) from the new Linux host and 3 minutes to resolve all problems**

2. Based on Vimplus, all configuration files are stored in. Vimrc. The configuration file with more than 500 lines is simple and intuitive, and redundancy of multiple configuration files is avoided

3. Simplify the plug-ins, and select 30 plug-ins to improve the opening speed

4. The plug-in compression package is placed on Gitee, which improves the speed of plug-in download and makes it friendly to beginners. One-click configuration of plug-in is provided by shell script

5. Added a function based shortcut key search to avoid forgetting the shortcut key

6. Improved the ** mouse support to make it more novice friendly

7. Support C/C++,Go, Python one-click configuration (welcome to mention Mr To add more language support)

8. Use COC instead of YCM for better completion experience

9. Support more diverse themes (more than 10) for better visual experience

10. Provide shell scripts to achieve customized Vim

11. The Chinese documents are detailed and more friendly to beginners

12. Provide one-click download configuration of VIM manual in Chinese [(based on Vimcdoc)](https://github.com/yianwillis/vimcdoc)

## Project folder

- autoload plug-in Plug. vim: allows you to install plug-ins

- Fonts folder, pre-download, reduce the download time

-Colors Themes folder, which provides more than 10 themes

- doc Help document

- Old Vimplus file (not recommended)

## shell script

- install.sh Indicates the installation script. Run it first to install Vim-fast

- install_without_sudo.sh Install without root and sudo (the apt package must be downloaded in advance)

- CPP /go/ python.sh Installs LSPS and COC in three languages. Run install.sh to invoke LSPS and COC as required

- update.sh Displays the latest configuration of Vim-fast

- Uninstall. sh uninstalls Vim-fast

- plug.sh downloads and installs all the latest plug-ins (automatically called, using Gitee, faster)

- doc_zh.sh Downloads and installs the VIM file

- self.sh Customizes the name and email in. Vimrc as its own

- nvim.sh One-click migration to NVIM

- nodejs.sh nodejs installation script, which is automatically invoked

## Other files

-.vimrc VIM configuration file

- vimrc-no-plug does not contain VIM configuration for plug-ins and themes

## Project Description

1. * *! Currently only Ubuntu, Debian, and other Ubuntu Linux systems are supported. Other systems can use VIMPLus! At the same time, we really hope that you can propose Mr To improve the warehouse, or issue the system ** to explain the demand

2. The project is based on [Vimplus](https://gitee.com/chxuan/vimplus.git)

## Video and article

- [bilibili](https://space.bilibili.com/322142755)
1. [install](https://www.bilibili.com/video/BV1RV4y1K7Le/)

2. [configuration steps](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)
- [zhihu](https://zhuanlan.zhihu.com/p/524286962)

## to install

1. git clone  [https://gitee.com/mirrorvim/vim-fast](https://link.zhihu.com/?target=https%3A//gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh

3. To Press enter after ![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png)

4. If the following figure is displayed, the installation is complete

5. ![](https://pic1.zhimg.com/80/v2-e6ced21db995500235c706af87ab5410_720w.jpg)

6. Execute different scripts for different languages

#### C++

1. ./cpp.sh

![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. The following figure shows that the configuration is successful

![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

1. ./python.sh

![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. If this is displayed, Python is successfully installed

![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./go.sh

![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. When you just edit a file, you need to wait for a while to download it, about two minutes

![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. If this message appears, GO installation is completed successfully

![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

## Vimplus warehouse

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. Is there an NVIM version
- NVIm can be temporarily installed using nvim.sh. It takes some time to configure the LuA version
2. My system has no support
- You can issue or make your own Mr
3. In the PlugInstall command, # unsafe Repository git config --global --add safe.directory is displayed
- git config --global --add safe.directory "*"
4. Xshell, Tmux open color confusion
- xshell "tools" - > "options" - > "advanced" - > "use of color," open after the restart xshell

-Tmux currently can only switch the theme to OnEDArk, turn off Termguicolors, and set let G :onedark_termcolors=256

5. Check whether the root or sudo permission is required
- If VIM-FAST has been installed before or all the corresponding software has been installed, SUdo is not required. Otherwise, the SUDO installation package is required

## help

1. [Plug-in shortcut Key Description](./doc/key.md)
2. [Vim some key help](./doc/help.md)

## hope

-Due to my limited ability, I hope you can write a install.sh for your own system and then mention Mr, thank you very much

## afterword.

- VIM should not be used as an IDE out of the box, but the initial interface with nothing dissuade most people, so I made this repository to get you to build VIM into an IDE in the least amount of time, but keep the configuration files as simple as possible

- When you are familiar with VIM, you may feel that the shortcut keys I set are anti-human, at that time you can customize everything, everything in VIM can be customized, when you edit. Vimrc,VIM will become your most powerful weapon

---

- If this warehouse works for you, you can get a star
