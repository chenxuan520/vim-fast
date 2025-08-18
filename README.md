# Vim-Fast

- 一个**超级快速**的Vim配置脚本

### 制作人

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

## 仓库地址


1. gitee:[vim-fast: A easy vim config](https://gitee.com/mirrorvim/vim-fast)

2. github:[GitHub - chenxuan520/vim-fast](https://github.com/chenxuan520/vim-fast)

## 配置效果

### 打开效果

![](https://pic1.zhimg.com/80/v2-bbb4ad457961cf116facf75be76486b0_720w.jpg)

### 编辑效果

![](https://picx.zhimg.com/70/v2-7f64e5078afe4b4ef6ca033ae4fecbe2_1440w.awebp)

## 为什么制作

- 之前一直使用[Vimplus](https://gitee.com/chxuan/vimplus.git),不过Vimplus出现几个问题

  1. Vimplus很久没有更新了,挺多issue没有解决的

  2. 目前主流补全方案是lsp,Vimplus使用的YCM有点老了,而且需要自己编译

  3. 有的插件已经有个更加好的替换方案

  4. github访问太慢,导致插件下载太慢,对新手不友好

- 对于其他的配置,

  - 有的存在github访问问题,对VIM新手不友好,对服务器配置也不够友好

  - 有的因为太过复杂,使得配置文件基本和原来的.vimrc相差太远,甚至使用了不同格式的配置文件,这样使得后期自己定制VIM变得很麻烦,而且太过冗余

  - 有的完全使用lua,使得VIM不兼容问题

  - 有的使用的文件以及结构太多,对于新手不友好

- 基于以上的问题,我想基于Vimplus进行创作,使得它更加好

## 项目特点

1. **正常3分钟从新的linux主机安装好VIM配置(包括lsp之类),3分钟解决所有问题**

2. 基于Vimplus,使得所有配置文件都在.vimrc中,1100 余行的配置文件更加简单和直观,同时也避免了多个配置文件冗余

3. 插件精简化,精选出了23个插件,使得打开速度得到提高(**有插件版本大约130ms,无插件版本约20ms**)

4. **插件压缩包放在gitee上,使得插件下载的速度得到提高**,对新手友好化,提供shell脚本一键配置插件

5. 添加了基于功能的快捷键的查找,避免了出现快捷键忘记,通过\<space\>H打开

6. 完善了**鼠标的支持**,使得新手更加友好

7. 支持**C/C++,Go,Python,Rust**语言一键配置(欢迎大家提mr添加更多语言支持)

8. 使用coc代替YCM,更好的补全体验

9. 支持更加多样化的主题(超过10种),更好的视觉体验(默认tokyonight)

10. 提供shell脚本实现定制化Vim

11. 项目中文文档详细,对新手更加友好

12. [**内置了一个简单完整的任务管理系统,方便建立一键编译运行系统**](https://github.com/chenxuan520/termtask.vim)

13. 提供中文VIM手册的一键下载配置[(基于Vimcdoc)](https://github.com/yianwillis/vimcdoc)

14. [**内置markdown快捷插件**](https://github.com/chenxuan520/markdown-simple.vim)

15. 对markdown文件**提供ibus输入法的切换操作**(默认自带),预览markdown(默认自带)

16. 和ici以及lazygit,fzf,lf集成,无需额外插件,即可实现翻译和git管理,文件管理

17. 内置了一个**Vimrc无插件简化版本**,没有插件或者root权限也可以使用

18. 配置好的折叠功能,让代码浏览更加简单

19. 内置众多便捷vimscript,方便学习和简化操作

20. 携带 ai 插件, 方便让 gpt 接入 vim

## 内置的Vimscript功能

1. 全文选中,类似插件[Vim-textobj-entire](https://github.com/kana/vim-textobj-entire)

2. markdown,快捷编写,格式化,类似插件[vim-markdown](https://github.com/preservim/vim-markdown)

3. **任务管理**,类似插件[asynctasks](https://github.com/skywind3000/asynctasks.vim)

4. **git状态显示**,类似插件[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

5. 预先代码插入,类似插件[prepare-code](https://github.com/chxuan/prepare-code)

6. 参数选中,类似插件[vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)

7. 高亮选中,类似插件[vim-textobj-syntax](https://github.com/kana/vim-textobj-syntax)

8. 缩进选中,类似插件[vim-textobj-indent](https://github.com/kana/vim-textobj-indent)

9. ibus输入法自动切换,类似插件[vim-ibus](https://github.com/h-youhei/vim-ibus)

10. lazygit和Vim集成,效果更好,类似插件[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

11. lf和vim集成,类似插件[lf.vim](https://github.com/ptzz/lf.vim)

12. ici翻译,类似插件[ici.vim](https://github.com/Flowerowl/ici.vim)

13. 颜色可视化,类似插件[colorizer](https://kgithub.com/lilydjwg/colorizer)

14. 二进制文件编辑,类似插件[Vinarise](https://github.com/Shougo/vinarise.vim)

15. 多光标编辑,类似插件[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

16. editorconfig支持,类似插件[editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)

17. **查询按键是否被绑定以及被绑定的位置**,\<leader\>h 和\-h触发检测

18. mdbook 目录自动生成

19. 查看并打开最近关闭的buffer

20. 简单的markdown和html预览

21. fzf调用

- 说明:以上功能均内置在Vim-fast,且不会影响Vim启动速度

## 项目文件夹

- autoload 插件plug.vim,提供插件的安装

- fonts 字体文件夹,预先下载,缩减下载时间

- colors 主题文件夹,提供超过10种主题

- doc 帮助文档

- vimscript 一些有用的VIM脚本

- old Vimplus旧版文件(不推荐,仅供参考)

## shell脚本

- install.sh 安装脚本,首先运行,安装vim-fast

- install_without_sudo.sh 在没有root和sudo下安装

- update.sh 拉取vim-fast最新配置

- uninstall.sh 卸载vim-fast

- shell/cpp/go/rust/python.sh 四种语言的lsp以及coc安装,运行install.sh后按需调用

- shell/plug.sh 下载并安装最新所有插件(,自动调用,使用gitee,更加快速)

- shell/doc_zh.sh 下载安装vim中文文档

- shell/self.sh 将.vimrc中姓名和email定制为自己的

- shell/nodejs.sh nodejs安装脚本,会自动调用

- shell/color.sh 添加Vim主题

- shell/coc_plug.sh 推荐的coc插件安装

- shell/vim_compile.sh vim最新版本编译安装

- nvim.sh 一键迁移到nvim

## 其他文件

- .vimrc VIM配置文件

- vimrc-no-plug 不包含插件和主题的VIM配置

## 项目说明

1. **!目前只支持ubuntu,debian,以及其他ubuntu系的linux(如debian,linux mint等),mac支持可能不完善,其他系统可以使用vimplus!,同时非常希望大家可以提mr来完善仓库,或者提出issue说明需求的系统**

2. 该项目基于[Vimplus](https://gitee.com/chxuan/vimplus.git)

3. **如果遇到问题请先阅读本文的QA部分,不能解决再提出issue或者联系作者**

4. vim版本需**8.1**以上

5. 如果出现了QA以外的问题,优先考虑是不是nodejs版本问题,经过测试v18.13.0版本是没问题,[参考](https://juejin.cn/post/7132680379898527757)

## 视频及文章

- [bilibili](https://space.bilibili.com/322142755)

  1. [安装](https://www.bilibili.com/video/BV1RV4y1K7Le/)

  2. [配置详解](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

  3. [自定义VIM配置](https://www.bilibili.com/video/BV1Y84y1q79F/)

  4. 更新ing

- [zhihu](https://zhuanlan.zhihu.com/p/524286962)

## 安装

- **在这里出现任何问题(比如乱码问题)先访问本文中的 QA 部分**,无法解决再去开issue或者联系作者

> 第一第二步可以简化为
>
> curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/webinstall.sh |bash
>
> (在安装完毕后如果遇到输出混乱的问题,可以直接关闭终端重启就可以了)

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh (**不需要sudo,sudo会使得文件位置错误**)

3. 出现![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png)后按下回车

4. 出现下图，安装完成

5. ![](https://pic4.zhimg.com/80/v2-7d5e78a2fbd546f19002673ed432a8ff_720w.jpg)

6. 对于不同语言执行不同脚本

#### C++/C

1. ./shell/cpp.sh

   ![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. 出现下图配置成功

   ![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

> 注意:node需要在14以上,使用node --version 查看node版本,如果版本太低,参考[这篇文章解决](https://juejin.cn/post/6980714131217350692)

1. ./shell/python.sh

   ![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. 出现这个为安装python补全成功

   ![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./shell/go.sh

   ![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. 刚编辑文件时需要等待一会下载，大概两分钟

   ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. 出现这个为安装go补全成功

   ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

#### Rust

1. ./shell/rust.sh

2. 等待安装结束(大约一分钟),如果不存在rust环境会自动下载

### 简易安装无插件版本
   > curl https://gitee.com/mirrorvim/vim-fast/raw/master/shell/websimple.sh | bash

   - 或者

   > wget https://gitee.com/mirrorvim/vim-fast/raw/master/vimrc-no-plug -O ~/.vimrc

#### 无插件版说明

   1. 无插件版只有一个文件(vimrc),不会创建任何其他文件,因此可以直接复制粘贴文件(./vimrc-no-plug)到~/.vimrc

   2. 内置插件有**easy-motion**,vim-surround,vim-commentary,auto-pair,vim-slash,vim-airline的大部分功能

   3. 内置了tokynight颜色主题,以及所有有插件版本的自定义按键功能

   4. 如果安装有fzf,拥有leaderf大部分功能

## 更新

   - ./update.sh

## 卸载

   - ./uninstall.sh

## 外部工具集成

1. [lazygit](https://github.com/jesseduffield/lazygit),需要安装lazygit,使得在shell中可以直接调用shell.按下 空格+g 触发

2. [ici翻译](https://github.com/Flowerowl/ici)`pip install ici`,并修改.vimrc中ici的路径,在普通模式或者可视化模式按下 ,i 翻译单词

3. [fzf文件搜索](https://github.com/junegunn/fzf/),`sudo apt install fzf`,\<space\>z/Z 触发

4. [lf文件管理器](https://github.com/gokcehan/lf/),需要安装lf,\<space\>e/E 触发

## Vimplus原仓库

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

### 1. 有nvim版本吗

   - nvim可以通过nvim.sh安装,配置兼容

   - 纯lua 版本正在开发中, 敬请期待

### 2. 我的系统没有支持

   - 可以提出issue或者自己制作提出mr

### 3. PlugInstall 出现\# unsafe repository git config --global --add safe.directory

   - git config --global --add safe.directory "\*"

### 4. xshell,tmux 打开的颜色混乱

   - xshell中 “工具” -> “选项” -> “高级”->"使用本色",打开后重启xshell

   - tmux

    1. 通过`echo $TERM` 查找终端类型,通常是`xterm-256color`或者`screen-256color`

    2. 编辑`~/.tmux.conf` 添加
```shell
set -g default-terminal "xterm-256color"
#set -g default-terminal "screen-256color"   # 如果使用screen-256color则用这条指令
set-option -ga terminal-overrides ",*256col*:Tc"
```

    3. 重启tmux

   - 如果还是无法解决,可以切换主题为onedark,并关闭termguicolors,设置let g:onedark_termcolors=256

### 5. 是否需要root或者sudo权限

   - 如果在本机之前安装过vim-fast或者对应的软件已经全部安装好了,可以不需要sudo,否则需要sudo安装软件包

   - 如果没有root权限可以运行./install_without_sudo.sh,但部分功能可能没有

### 6. 我想要自定义Vim启动时候dashboard内容

   - 获取图案表示[Spring Boot banner在线生成工具](https://www.bootschool.net/ascii),选择类型为`ANSI Shadow`

   - 获取Vim形式[vim-dashboard-header-make](https://chenxuanweb.top/cppnet/header.html)(花了一点自己时间做的,因为不怎么写前端,画面比较差)

   - 将得到的结果复制到.vimrc中

### 7. 出现E1208: -complete used without allowing argumentsPress ENTER or type command to continue

   - 进入coc.nvim 插件目录然后git reset --hard v0.0.81

   - 或者编辑coc.vim 这个出错的文件,把438行删除也可以

### 8. Vim 特定文件预先生成的代码我想要修改

   - 在`~/.vim/ftplugin/template`找到对应文件的文件夹,修改文件的内容即可

### 9. 控制台状态栏和图标混乱(重要参考)

  - 设置终端的字体

      - 如果是linux系统

          1. 打开终端首选项

          2. 设置字体为 `DejaVuSansM Nerd Font Mono`(如果没有双击ttf字体安装)

      - 如果是mac(以iterm2终端举例)

          1. 打开fonts文件夹(项目根目录下),双击DejaVu.ttf文件安装该字体

          2. 打开Item2 -> setting -> profile -> text -> font

          3. 设置字体为`DejaVuSansM Nerd Font Mono`

          4. 如果是 macvim gui的话使用 `set guifont=DejaVuSansMono_Nerd_Font:h17`

      - 如果是windows(以windows terminal终端举例)

          1. 打开fonts文件夹(项目根目录下),双击DejaVu.ttf文件安装该字体

          2. 打开 terminal -> 设置 -> 默认值 -> 外观 -> 字体

          3. 设置字体为`DejaVuSansMono Nerd Font`

  - 如果不想设置或者无法设置,可以选择禁用图标功能

     1. 将下列代码注释,如果执行之后还是乱码,将下列代码中的类似更改为空格
      ```
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      ```

      2. 将`Plug 'ryanoasis/vim-devicons'`这一行注释

      3. 在~/.vimrc中加入`let g:dashboard_icon_disable=1`

### 10. 出现E117,未定义的函数getenv

  - 出现问题原因为VIM版本太低了,可以升级VIM(./shell/vim_compile.sh 最新Vim安装)或者去到出问题的行删除该行

### 11. 使用的主题

  - [tokyonight](https://github.com/ghifarit53/tokyonight-vim)

### 12. ctrl-s之后没有多光标,反而卡住了

  - 终端的设置问题,将`stty -ixon`加到~/.bashrc,然后重新打开终端加载就可以了

### 13. 安装nodejs出错,无法连接下载

  - 重新运行./shell/nodejs.sh

### 14. xshell中使用vim的backspace无法删除字符

  - xshell的问题,[参考](https://www.cnblogs.com/yjd_hycf_space/p/11329841.html)

### 15. nvim无法使用系统粘贴板

  - 运行`sudo apt install xclip`,[参考](https://zhuanlan.zhihu.com/p/667386801)

### 16. 出现ctags: Warning: Cannot disable fixed field

  - 默认的ctags版本太低了,需要更新,[下载地址](https://github.com/universal-ctags/ctags-nightly-build/releases)

  - 打不开github链接也可以用[我提前下好的](https://gitee.com/mirrorvim/userful-tools-2/releases/download/ctagsv1.0.1/ctags)(注意是linux x86_64的)

### 17. pyright 无法识别本地的包(coc插件)

  - 更改 `~/.config/nvim/coc-settings.json` 文件,将其中的 `python.pythonPath` 修改为正确的python路径

### 18. vimscript 和 lua 没有只能补全

  - vimscript 的话使用 `:CocInstall coc-vimlsp`

  - lua 使用 `:CocInstall coc-sumneko-lua`, 同时在 CocConfig 加上 `"sumneko-lua.enableNvimLuaDev": true,` 即可


## 帮助

1. [插件快捷键说明](./doc/key.md)(也可以使用\<space\>H查看)

2. [Vim一些按键帮助](./doc/help.md)

## 反馈

   - 出现bug或者问题可以使用github或者gitee的issue提出

   - 或者直接加Q1607772321联系我

## 希望

- 由于个人能力有限,希望大家可以给自己的系统写一份install.sh,然后提mr,非常感谢

## 后记

- 使用VIM其实不应该作为开箱即用的ide,但是刚开始什么都没有的界面劝退了大多数人,因此我制作了这个仓库带你用最少的时间把VIM打造成IDE,但是让配置文件尽量简单化

- 当你可能熟悉VIM之后可能会觉得我设置的快捷键反人类,那个时候你可以自己去定制一切,VIM的一切都是可以定制的,当你自己去编辑.vimrc的时候,VIM就会成为你最称手的兵器

---

### Vim学习资料推荐

- Vim视频介绍

  1. [合适快速入门,原视频来自慕课](https://www.bilibili.com/video/BV1NG4y1p74h/)

  2. [我见过最好的VIM教程,原视频来自油管](https://www.youtube.com/watch?v=mPVwS8gjDVI&list=PLBd8JGCAcUAH56L2CYF7SmWJYKwHQYUDI)

- Vim 书籍推荐

  1. **VIM实用技巧** (超级好的VIM书籍)

  2. VIM8 文本处理实战(也还行)

- 学习[vimscript](./vimscript/README.md)(除非要求很高否则没必要)

---

### Vim学习路线推荐

1. 找到一个一定要用VIM的理由(不然用不下去的)

   - 找一个最简单的VIM教程(比如[这个](https://www.bilibili.com/video/BV13t4y1t7Wg/)),把VIM作为普通编辑器用

2. 找到一个简单(**非常重要**)并且开箱即用的配置(比如该仓库)[视频](https://www.bilibili.com/video/BV1RV4y1K7Le/)

   - 将VIM运用到日常

   - 等用到一定程度看VIM视频

3. 读懂vimrc配置内容(可控性)[视频](https://www.bilibili.com/video/BV1Ht4y1P7Ao/)

   - 开始看VIM书籍

4. 开始自己定制属于自己的VIM

   - 了解vimscript 简单语法配置

---

![](https://edyfox.codecarver.org/html/vim-logo-en.png)

---

- 如果这个仓库对你有用,可以给个星星⭐
