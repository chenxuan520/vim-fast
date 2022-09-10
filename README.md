# Vim快速配置

### 修改人

chenxuan

## 仓库地址

1. gitee:[vim-fast: A easy vim config](https://gitee.com/mirrorvim/vim-fast)

2. github:[GitHub - chenxuan520/vim-fast](https://github.com/chenxuan520/vim-fast)

## 配置效果

![](https://picx.zhimg.com/v2-465040e3e32df418808b886729a1815f_1440w.jpg?source=172ae18b)

## 项目说明

1. 仓库基于Vimplus

2. 解决插件本地安装太慢问题

3. 用coc 替换YCM,获得更加流畅的补全体验

4. 增加对go和python的支持,目前支持C++,go,python

5. 添加了快捷键说明,在使用VIM时候随时查找对应快捷键

6. 完善了一些地方,详情见下文QA

7. **!目前只支持ubuntu,debian,以及其他ubuntu系的linux,其他系统可以使用vimplus!,同时非常希望大家可以提mr来完善仓库**

## 安装

1. git clone [https://gitee.com/mirrorvim/vim-fast](https://link.zhihu.com/?target=https%3A//gitee.com/mirrorvim/vim-fast)

2. cd vim-fast && ./install.sh

3. 等待软件的安装，直到出现，按下y 回车，如果你原来vim有配置会弹出询问是否保存配置

![](https://pic3.zhimg.com/80/v2-e446d1e2516b559cf5a0d039a06fa242_720w.jpg)

4. 等到下图，按下回车

5. ![](https://pic3.zhimg.com/80/v2-c8683440682115dcb5c95c78f93c52b2_720w.png)

6. 出现下图，安装完成

7. ![](https://pic1.zhimg.com/80/v2-e6ced21db995500235c706af87ab5410_720w.jpg)

8. 对于不同语言执行不同脚本

#### C++

1. ./cpp.sh
   
   ![](https://pic1.zhimg.com/80/v2-8f63e192e0b96e7514fd89112f0bbbb4_720w.png)

2. 出现下图配置成功
   
   ![](https://pic2.zhimg.com/80/v2-3116e456f0df668740f16dabb7eb50d9_720w.jpg)

#### Python

1. ./python.sh
   
   ![](https://pic4.zhimg.com/80/v2-f4024d6b0b3ac1563753ff06485f6203_720w.png)

2. 出现这个为安装python补全成功
   
   ![](https://pic2.zhimg.com/80/v2-acbb90f61bbe85985e5619382ece1235_720w.jpg)

#### Go

1. ./go.sh
   
   ![](https://pic2.zhimg.com/80/v2-a9f92770ec5d7ff5ad891e20cb9dfb49_720w.png)

2. 刚编辑文件时需要等待一会下载，大概两分钟
   
   ![](https://pic1.zhimg.com/80/v2-fe683bb1bae4bbf75e447528cdfecf18_720w.png)

3. 出现这个为安装go补全成功
   
   ![](https://pic2.zhimg.com/80/v2-1d6ebe0d321f1f0aaae71836371c1c35_720w.jpg)

## 源仓库

[Vimplus](https://gitee.com/chxuan/vimplus.git)

## QA

1. 为什么不直接用Vimplus
   
   - 下载插件依赖github,网络不好下载太慢了,对VIM新手不友好
   
   - YCM体验没有coc好,而且coc安装更加简单
   
   - 更换了一些插件,使得界面更加美观和更加流畅

2. 和其他的区别
   
   - 主要是其他大部分直接从github拉取,对国内服务器安装不友好,因此做了这个所有插件都不需要github的
   
   - 配置文件非常少,Vimrc只有400行,插件加载更加快速
   
   - 内置了快捷键文档查询,避免了配置了不知道怎么用的现象
   
   - 插件数量适中,目前31个,避免加载太慢
   
   - 颜色支持丰富,支持20余种主题

3. 有nvim版本吗
   
   - nvim可以通过nvim.sh安装,lua配置版本还需要一点时间

## 希望

- 由于个人能力有限,希望大家可以给自己的linux写一份install.sh,然后提mr,非常感谢

---

- 如果这个仓库对你有用,可以给个星星
