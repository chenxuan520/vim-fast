# Vim quick configuration

### Modified by

**chenxuan**

-

## Warehouse Address

1. gitee:[vim-fast: A easy vim config](https://gitee.com/mirrorvim/vim-fast)

2. github:[GitHub - chenxuan520/vim-fast](https://github.com/chenxuan520/vim-fast)

## Configuration effect

![](https://picx.zhimg.com/v2-465040e3e32df418808b886729a1815f_1440w.jpg?source=172ae18b)

## Why made

- I have been using [Vimplus](https://gitee.com/chxuan/vimplus.git) before, but there are several problems with Vimplus

  1. Vimplus has not been updated for a long time, and many issues have not been resolved

  2. The current mainstream completion solution is lsp, the YCM used by Vimplus is a bit old, and it needs to be compiled by itself

  3. Some plugins already have a better alternative

  4. The access to github is too slow, resulting in slow download of plugins and unfriendly to novices

- For other configurations,

  - Some have github access problems, are not friendly to VIM newbies, and are not friendly enough to server configuration

  - Some configuration files are too far from the original .vimrc because they are too complicated, and even use configuration files in different formats, which makes customizing VIM in the later stage very troublesome and too redundant

  - Some use lua completely, making VIM incompatibility problems

- Based on the above questions, I want to create based on Vimplus to make it better

## Project Features

1. Based on Vimplus, all configuration files are in .vimrc, the configuration file with more than 400 lines is simpler and more intuitive, and it also avoids the redundancy of multiple configuration files

2. The plug-ins are simplified, and 30 plug-ins have been selected to improve the opening speed

3. The plug-in compressed package is placed on gitee, which improves the download speed of the plug-in, is friendly to novices, and provides a shell script to configure the plug-in with one click

4. Added function-based shortcut key search to avoid shortcut key forgetting

5. Improve the mouse support, making the novice more friendly

6. Support C/C++, Go, python language one-key configuration (welcome to add mr function)

7. Use coc instead of YCM for a better completion experience

8. Support more diverse themes, better programming experience

9. Provide shell script to customize Vim

10. Detailed Chinese documentation, more friendly to novices

11. Provide one-click download of Chinese VIM manual [(based on Vimcdoc)](https://github.com/yianwillis/vimcdoc)

## project folder

- autoload plug-in plug.vim, providing plug-in installation

- fonts font folder, pre-download, reduce download time

- colors theme folder, providing more than 10 themes

- old Vimplus legacy files (not recommended)

## shell script

- install.sh installation script, first run, install vim-fast

- install_without_sudo.sh is installed without root and sudo (the apt package needs to be downloaded in advance)

- cpp/go/python.sh lsp and coc installation in three languages, after running install.sh

- update.sh pulls the latest configuration of vim-fast

- uninstall.sh uninstall vim-fast

- plug.sh downloads and installs the latest all plug-ins (use gitee, which is faster)

- doc_zh.sh Download and install vim Chinese documentation

- self.sh customize the name and email in .vimrc to your own

- nvim.sh one-click migration to nvim

## Other files

- .vimrc VIM configuration file

- vimrc-no-plug does not include VIM configuration for plugins and themes

- Some old plugins in vim.tar.gz (for no internet)

## project instruction

1. **! Currently only supports ubuntu, debian, and other ubuntu-based linux, other systems can use vimplus! At the same time, I very much hope that you can improve the warehouse by mentioning mr, or put forward system requirements for issue description**

2. The project is based on [Vimplus](https://gitee.com/chxuan/vimplus.git)

## Install

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://link.zhihu.com/?target=https%3A//gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh

3. Wait for the software to be installed until it appears, press y to enter, if you have a configuration in vim, it will pop up asking whether to save the configuration

![](https://pic3.zhimg.com/80/v2-e446d1e2516b559cf5a0d039a06fa242_720w.jpg)

4. Wait until the picture below and press Enter

5. ![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png)

6. The following figure appears, the installation is complete

7. ![](https://pic1.zhimg.com/80/v2-e6ced21db995500235c706af87ab5410_720w.jpg)

8. Execute different scripts for different languages

#### C++

1. ./cpp.sh

   ![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. The following figure appears, the configuration is successful

   ![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

1. ./python.sh

   ![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. When this appears, the installation of python is completed successfully

   ![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./go.sh

   ![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. When you just edit the file, you need to wait for a while to download, about two minutes

   ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. When this appears, the installation of go completion is successful

   ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

## Vimplus repository

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. Is there an nvim version?

   - nvim can be temporarily installed through nvim.sh, the lua configuration version will take some time

2. My system is not supported

   - You can submit an issue or make your own mr

## help

1. [Plug-in shortcut key description](./key.md)
2. [Vim some key help](./help.md)

## hope

- Due to limited personal ability, I hope you can write a copy of install.sh for your own system, and then mention mr, thank you very much

---

- If this repository is useful to you, you can give a star
