# 快捷键

## 说明
**!本文档已经落后实际配置,但是懒得更新了!**

1. 个人爱好,并非通用快捷键

2. **下列快捷键均可以自由定制**,不需要死记硬背,自由定制VIM

3. **leader 为 ',' (可修改)**,<space>为空格

## 自定义快捷键

| 快捷键                                | 说明                   |
| ---------------------------------- | -------------------- |
| `<leader><leader>s`                | 重新加载.vimrc           |
| `<leader><leader>i`                | 插件install            |
| `<leader><leader>c`                | 插件clean              |
| `<leader><leader>y`                | 复制到系统粘贴板             |
| `<leader><leader>p`                | 粘贴到系统粘贴板             |
| `<leader>p`                        | 粘贴上次复制内容(避免delete影响) |
| `<leader>c`                        | 生成带有名字的注释            |
| `<ctrl+n/p>`                       | 上一个/下一个缓冲区           |
| `<ctrl+m>/<enter>`**normal model** | 保存文件                 |
| `<leader>d`                        | 关闭缓冲区                |
| `<ctrl+j/k>`(insert model)         | 插入模式下上下移动            |
| `<ctrl+l>`(insert model)           | 插入模式下右移              |
| `<leader><leader>t`                | 打开终端                 |
| `<leader><leader>T`                | 水平打开终端               |
| `<shift+up/down/left/right>`       | 移动光标窗口               |
| `<ctrl+shift+up/down/left/right>`  | 更改窗口布局               |
| `<ctrl+up/down/left/right>`        | 改变窗口大小               |
| `<leader><leader>d`,`F5`           | 打开调试窗口               |
| `F6`                               | 调试:打断点               |
| `F7`                               | 调试:下一步               |
| `F8`                               | 调试:进入                |
| `[q`                               | quickfix next        |
| `]q`                               | quickfix last        |
| `\q`                               | quickfix close       |
| `=m`                               | 打开鼠标功能               |
| `\m`                               | 关闭鼠标功能               |
| `=s`                               | 打开拼写检查               |
| `\s`                               | 关闭拼写检查               |
| `=i`                               | 打开缩进线显示              |
| `\i`                               | 关闭缩进线显示              |
| `;n`(insert model)                 | 插入姓名                 |
| `;e`(insert model)                 | 插入邮箱                 |

## 插件相关

#### coc 插件

| 快捷键                 | 说明          |
| ------------------- | ----------- |
| `<leader>u`,`gd`    | 转到函数/变量声明   |
| `<leader>U`,`gt`    | 转到函数/变量实现   |
| `gr`,`gi`           | 跳转到函数/变量引用  |
| `<leader>r`         | 重命名(重构)     |
| `<space>r`          | 更加高级重构      |
| `<leader>ff`        | 修复错误        |
| `<space>w`          | 错误列表        |
| `<leader>a`         | code action |
| `:Format`           | 格式化代码       |
| `<leader><leader>f` | 格式化代码       |
| `:Import`           | import包管理   |
| `<space><space>c`   | 打开coc配置文件   |
| `<space>l`          | coc插件列表     |
| `<space>a`          | coc 代码操作提示  |
| `K`                 | 帮助手册        |

#### tagbar

| 快捷键         | 说明     |
| ----------- | ------ |
| `<leader>t` | 打开函数目录 |

#### easy-motion

| 快捷键           | 说明      |
| ------------- | ------- |
| `<leader>w`   | 快速移动到单词 |
| `<leader>f`   | 快速移动到字母 |
| `<leader>l/k` | 快速移动到某行 |

#### dash-board

| 快捷键        | 说明        |
| ---------- | --------- |
| `<space>S` | session保存 |
| `<space>s` | session加载 |

#### leaderf

| 快捷键                    | 说明       |
| ---------------------- | -------- |
| `<leader>F`,`<space>f` | 文件搜索     |
| `<space>F`             | 最近文件     |
| `<leader>b`,`<space>b` | buffer搜索 |
| `<space>a`             | 单词搜索     |
| `<space>t`             | 函数搜索     |
| `<space>/`             | 增强/搜索    |
| `<space>:`             | : 提示     |
| `<F1>`                 | 主题搜索     |

#### ack

| 快捷键         | 说明     |
| ----------- | ------ |
| `<leader>A` | 搜索单词   |
| `<leader>H` | 搜索光标单词 |

#### tabular

| 快捷键         | 说明  |
| ----------- | --- |
| `<leader>T` | 对齐  |

#### gv

| 快捷键         | 说明    |
| ----------- | ----- |
| `<leader>g` | 仓库提交  |
| `<leader>G` | 该文件提交 |

#### nerdtree

| 快捷键         | 说明    |
| ----------- | ----- |
| `<leader>n` | 打开文件树 |

#### comment

| 快捷键   | 说明   |
| ----- | ---- |
| `gcc` | 注释代码 |

### asyncrun

| 快捷键        | 说明        |
| ---------- | --------- |
| `<space>c` | 配置项目文件    |
| `<space>;` | 异步运行shell |
