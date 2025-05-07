# Vim 配置映射文档

## 通用配置
### 基本设置相关
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader><leader>s` | 普通模式 (n) | 重新加载 `.vimrc` 文件，执行 `:source $MYVIMRC` |
| `<leader><leader>S` | 普通模式 (n) | 重新加载当前文件的配置，执行 `:source <c-r>=expand('%:p')<cr><cr>` |
| `<leader><leader>i` | 普通模式 (n) | 执行 `:PlugInstall`，安装插件 |
| `<leader><leader>c` | 普通模式 (n) | 执行 `:PlugClean`，清理插件 |

### 缓冲区操作
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<c-p>` | 普通模式 (n) | 切换到上一个缓冲区，调用 `s:ChangeBuffer('p')` |
| `<c-n>` | 普通模式 (n) | 切换到下一个缓冲区，调用 `s:ChangeBuffer('n')` |
| `H` | 普通模式 (n) | 切换到上一个缓冲区，调用 `s:ChangeBuffer('p')` |
| `L` | 普通模式 (n) | 切换到下一个缓冲区，调用 `s:ChangeBuffer('n')` |
| `<c-m>` | 普通模式 (n) | 根据不同情况执行不同操作，如保存文件、在终端中执行命令、关闭 quickfix 或 loclist 窗口 |
| `<leader>d` | 普通模式 (n) | 关闭当前缓冲区，调用 `s:CloseBuf()` |

### 插入模式映射
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `jk` | 插入模式 (i) | 映射为 `<esc>`，用于快速退出插入模式 |
| `<c-j>` | 插入模式 (i) | 映射为 `<down>`，向下移动光标 |
| `<c-k>` | 插入模式 (i) | 映射为 `<up>`，向上移动光标 |
| `<c-l>` | 插入模式 (i) | 映射为 `<right>`，向右移动光标 |
| `<c-h>` | 插入模式 (i) | 映射为 `<left>`，向左移动光标 |
| `<c-e>` | 插入模式 (i) | 映射为 `<end>`，移动光标到行尾 |
| `<c-a>` | 插入模式 (i) | 映射为 `<c-o>^`，移动光标到行首 |
| `<c-d>` | 插入模式 (i)、可视模式 (v) | 映射为 `<del>`，删除字符 |
| `<c-f>` | 插入模式 (i) | 映射为 `<c-o>w`，向前移动一个单词 |
| `<c-v>` | 插入模式 (i) | 映射为 `<c-o>D`，删除到行尾 |
| `<expr><c-b>` | 插入模式 (i) | 根据不同情况执行不同操作，如在补全菜单中移动、删除缩进等 |
| `<c-q>` | 插入模式 (i)、选择模式 (s) | 映射为 `<c-o>dd`，删除当前行 |

### 可视模式映射
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<c-v>` | 选择模式 (s) | 映射为 `<space><bs><c-o>"0P`，粘贴到选择区域 |
| `<c-d>` | 可视模式 (v) | 映射为 `<del>`，删除选中内容 |
| `<c-y>` | 可视模式 (v) | 查找下一个 `{`，高亮并选中 `{}` 内的内容 |
| `<c-t>` | 可视模式 (v) | 查找上一个 `}`，高亮并选中 `{}` 内的内容 |
| `<leader><leader>y` | 可视模式 (v) | 复制选中内容到系统剪贴板 |
| `<leader><leader>p`、`<leader><leader>P` | 可视模式 (v) | 从系统剪贴板粘贴内容 |

### 普通模式映射
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader><leader>y` | 普通模式 (n) | 复制当前行到系统剪贴板 |
| `<leader><leader>p`、`<leader><leader>P` | 普通模式 (n) | 从系统剪贴板粘贴内容 |
| `<c-y>` | 普通模式 (n) | 查找下一个 `{`，高亮并选中 `{}` 内的内容 |
| `<c-t>` | 普通模式 (n) | 查找上一个 `}`，高亮并选中 `{}` 内的内容 |
| `<space>q` | 普通模式 (n) | 显示最近关闭文件的列表，调用 `s:GetRecentClose()` |
| `<c-]>` | 普通模式 (n) | 根据情况查找标签，调用 `s:FindTags(expand('<cword>'))` |
| `<F5>` | 普通模式 (n) | 启动调试，执行 `:packadd termdebug<cr>:Termdebug<space>` |
| `<F6>` | 普通模式 (n) | 设置断点，执行 `:Break` |
| `<F7>` | 普通模式 (n) | 单步跳过，执行 `:Over` |
| `<F8>` | 普通模式 (n) | 单步进入，执行 `:Step` |
| `<leader><leader>d` | 普通模式 (n) | 启动调试，执行 `:packadd termdebug<cr>:Termdebug<space>` |
| `<leader><leader>T` | 普通模式 (n) | 在下方分割窗口并打开终端 |
| `<leader><leader>t` | 普通模式 (n) | 在右侧分割窗口并打开终端 |
| `<space><space>t` | 普通模式 (n) | 在新标签页中打开终端 |
| `<space><space>T` | 普通模式 (n) | 在新标签页中打开终端并切换到当前文件所在目录 |
| `<space>g` | 普通模式 (n) | 打开 lazygit 工具 |
| `<space>G` | 普通模式 (n) | 在新标签页中打开 lazygit 并指定文件 |
| `<space>E` | 普通模式 (n) | 打开 lf 文件管理器并定位到用户主目录 |
| `<space>e` | 普通模式 (n) | 打开 lf 文件管理器 |
| `<leader>p`、`<leader>P` | 普通模式 (n) | 从寄存器 `"0` 粘贴内容 |
| `<leader>h` | 普通模式 (n) | 显示键绑定信息，调用 `findkey#get_key_msg(0)` |
| `-h` | 普通模式 (n) | 显示键绑定信息，调用 `findkey#get_key_msg(1)` |
| `]h` | 普通模式 (n) | 打开键绑定文件，调用 `findkey#open_file(1)` |
| `[h` | 普通模式 (n) | 打开键绑定文件，调用 `findkey#open_file(0)` |
| `<leader>i` | 普通模式 (n) | 执行 `termtask#Term_cmd_exec_popup('')` |
| `gs` | 普通模式 (n) | 全局替换当前光标下的单词 |
| `e` | 普通模式 (n) | 打开文件，路径为当前工作目录 |
| `E` | 普通模式 (n) | 打开文件，路径为当前文件所在目录 |
| `<leader>e` | 普通模式 (n) | 打开文件，路径为用户主目录 |
| `<space>;` | 普通模式 (n)、可视模式 (v) | 进入命令模式 |
| `<silent><nowait>U` | 普通模式 (n) | 在当前行上方插入空行 |
| `<silent><nowait>M` | 普通模式 (n) | 在当前行下方插入空行 |
| `<c-e>` | 普通模式 (n)、可视模式 (v) | 移动光标到行尾 |
| `<expr><c-a>` | 普通模式 (n) | 根据光标位置移动到行首或执行 `<c-a>` 操作 |
| `<expr><c-a>` | 可视模式 (v) | 根据选择范围移动到行首或执行 `<c-a>` 操作 |
| `<expr>g<c-a>` | 普通模式 (n) | 对当前数字加 1 |
| `<expr>g<c-x>` | 普通模式 (n) | 对当前数字减 1 |
| `<leader><space>` | 普通模式 (n) | 插入空格，直到用户输入非空格字符 |
| `\u` | 普通模式 (n) | 在其他窗口向上滚动 |
| `\d` | 普通模式 (n) | 在其他窗口向下滚动 |
| `R` | 普通模式 (n) | 重绘屏幕，执行 `:redr!<cr>` |
| `S` | 普通模式 (n) | 重新编辑当前文件，执行 `:edit<space><c-r>=expand('%')<cr><cr>` |
| `Pwd` | 普通模式 (n) | 显示当前文件的完整路径 |
| `Reload` | 普通模式 (n) | 重新加载文件 |
| `Delete` | 普通模式 (n) | 删除当前文件 |
| `Rename` | 普通模式 (n) | 重命名当前文件 |
| `Mkdir` | 普通模式 (n) | 创建目录 |
| `Rmdir` | 普通模式 (n) | 删除目录 |
| `Write` | 普通模式 (n) | 保存文件，若目录不存在则创建 |
| `Check` | 普通模式 (n) | 开始或停止自动检查文件更新 |
| `gl` | 普通模式 (n) | 打开当前行中的链接 |
| `\a` | 普通模式 (n) | 显示缩写列表，执行 `:iabc<cr>` |
| `=a` | 普通模式 (n) | 显示缩写列表，执行 `:ab<cr>` |
| `;e` | 插入模式 (i) | 自动补全邮箱地址 `1607772321@qq.com` |
| `;n` | 插入模式 (i) | 自动补全名称 `chenxuan` |
| `=` | 普通模式 (n) | 对当前文件进行自动缩进 |
| `d<space>` | 普通模式 (n) | 删除行尾的空格 |
| `g<space>` | 普通模式 (n) | 高亮显示行尾的空格 |
| `dl` | 普通模式 (n) | 删除空行 |
| `g/` | 可视模式 (v) | 以选中内容为搜索模式进行搜索 |
| `@` | 可视模式 (v) | 在可视模式下执行宏 |
| `<c-q>` | 普通模式 (n) | 重复执行上一个宏 |
| `=m` | 普通模式 (n) | 重新设置鼠标右键菜单 |
| `\m` | 普通模式 (n) | 禁用鼠标 |
| `=i` | 普通模式 (n) | 显示缩进线 |
| `\i` | 普通模式 (n) | 隐藏缩进线 |
| `=s` | 普通模式 (n) | 启用拼写检查 |
| `\s` | 普通模式 (n) | 禁用拼写检查 |
| `=r` | 普通模式 (n) | 启用自动换行，并设置 `j` 和 `k` 键的行为 |
| `\r` | 普通模式 (n) | 禁用自动换行，并恢复 `j` 和 `k` 键的默认行为 |
| `=n` | 普通模式 (n) | 禁用相对行号 |
| `\n` | 普通模式 (n) | 启用相对行号和行号显示 |
| `=N` | 普通模式 (n) | 禁用相对行号、行号和缩进线显示 |
| `\N` | 普通模式 (n) | 启用相对行号、行号和缩进线显示 |
| `=z` | 普通模式 (n) | 启用自动折叠，设置折叠模式为缩进 |
| `\z` | 普通模式 (n) | 禁用自动折叠，设置折叠模式为手动 |
| `=o` | 普通模式 (n) | 打开所有折叠 |
| `\o` | 普通模式 (n) | 关闭所有折叠 |
| `<bs>` | 普通模式 (n) | 根据光标位置关闭折叠或执行 `<bs>` 操作 |
| `=t` | 普通模式 (n) | 打开新标签页 |
| `\t` | 普通模式 (n) | 关闭当前标签页 |
| `[t` | 普通模式 (n) | 切换到上一个标签页 |
| `]t` | 普通模式 (n) | 切换到下一个标签页 |
| `\h` | 普通模式 (n) | 取消搜索高亮 |
| `=h` | 普通模式 (n) | 启用搜索高亮 |
| `=<tab>` | 普通模式 (n) | 自动设置缩进，调用 `s:IndentSet()` |
| `d<space>` | 普通模式 (n) | 删除行尾的空格 |
| `dl` | 普通模式 (n) | 删除空行 |
| `g/` | 可视模式 (v) | 以选中内容为搜索模式进行搜索 |
| `@` | 可视模式 (v) | 在可视模式下执行宏 |
| `<c-q>` | 普通模式 (n) | 重复执行上一个宏 |
| `=m` | 普通模式 (n) | 重新设置鼠标右键菜单 |
| `\m` | 普通模式 (n) | 禁用鼠标 |
| `=i` | 普通模式 (n) | 显示缩进线 |
| `\i` | 普通模式 (n) | 隐藏缩进线 |
| `=s` | 普通模式 (n) | 启用拼写检查 |
| `\s` | 普通模式 (n) | 禁用拼写检查 |
| `=r` | 普通模式 (n) | 启用自动换行，并设置 `j` 和 `k` 键的行为 |
| `\r` | 普通模式 (n) | 禁用自动换行，并恢复 `j` 和 `k` 键的默认行为 |
| `=n` | 普通模式 (n) | 禁用相对行号 |
| `\n` | 普通模式 (n) | 启用相对行号和行号显示 |
| `=N` | 普通模式 (n) | 禁用相对行号、行号和缩进线显示 |
| `\N` | 普通模式 (n) | 启用相对行号、行号和缩进线显示 |
| `=z` | 普通模式 (n) | 启用自动折叠，设置折叠模式为缩进 |
| `\z` | 普通模式 (n) | 禁用自动折叠，设置折叠模式为手动 |
| `=o` | 普通模式 (n) | 打开所有折叠 |
| `\o` | 普通模式 (n) | 关闭所有折叠 |
| `<bs>` | 普通模式 (n) | 根据光标位置关闭折叠或执行 `<bs>` 操作 |
| `=t` | 普通模式 (n) | 打开新标签页 |
| `\t` | 普通模式 (n) | 关闭当前标签页 |
| `[t` | 普通模式 (n) | 切换到上一个标签页 |
| `]t` | 普通模式 (n) | 切换到下一个标签页 |
| `\h` | 普通模式 (n) | 取消搜索高亮 |
| `=h` | 普通模式 (n) | 启用搜索高亮 |
| `=<tab>` | 普通模式 (n) | 自动设置缩进，调用 `s:IndentSet()` |

## 插件相关配置
### coc.nvim
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<TAB>` | 插入模式 (i) | 根据补全窗口状态进行不同操作，如选择下一个补全项、刷新补全列表等 |
| `<S-TAB>` | 插入模式 (i) | 根据补全窗口状态选择上一个补全项 |
| `<right>` | 插入模式 (i) | 根据补全窗口状态确认补全项 |
| `<c-p>` | 插入模式 (i) | 根据补全窗口状态选择上一个补全项 |
| `<leader>u` | 普通模式 (n) | 跳转到定义处，调用 `<Plug>(coc-definition)` |
| `<leader>U` | 普通模式 (n) | 跳转到类型定义处，调用 `<Plug>(coc-type-definition)` |
| `gd` | 普通模式 (n) | 跳转到定义处，调用 `<Plug>(coc-definition)` |
| `gD` | 普通模式 (n) | 跳转到类型定义处，调用 `<Plug>(coc-type-definition)` |
| `gr` | 普通模式 (n) | 查找引用，调用 `<Plug>(coc-references)` |
| `gi` | 普通模式 (n) | 查找实现，调用 `<Plug>(coc-implementation)` |
| `<space>r` | 普通模式 (n) | 代码重构，调用 `<Plug>(coc-refactor)` |
| `<leader>r` | 普通模式 (n) | 重命名，调用 `<Plug>(coc-rename)` |
| `<F3>` | 普通模式 (n) | 跳转到上一个诊断，调用 `<Plug>(coc-diagnostic-prev)` |
| `<F4>` | 普通模式 (n) | 跳转到下一个诊断，调用 `<Plug>(coc-diagnostic-next)` |
| `[w` | 普通模式 (n) | 跳转到上一个诊断，调用 `<Plug>(coc-diagnostic-prev)` |
| `]w` | 普通模式 (n) | 跳转到下一个诊断，调用 `<Plug>(coc-diagnostic-next)` |
| `-w` | 普通模式 (n) | 修复当前诊断，调用 `<Plug>(coc-fix-current)` |
| `=w` | 普通模式 (n) | 显示诊断列表，执行 `:CocList --normal diagnostics` |
| `<space>w` | 普通模式 (n) | 显示诊断列表，执行 `:CocList --normal diagnostics` |
| `if`、`af`、`ic`、`ac` | 可视模式 (v)、操作符等待模式 (o) | 与代码对象选择相关，调用 `<Plug>(coc-funcobj-i)` 等 |
| `<leader>a` | 普通模式 (n) | 调用代码操作，调用 `<Plug>(coc-codeaction)` |
| `<leader>a` | 可视模式 (v) | 调用代码操作，调用 `<Plug>(coc-codeaction-selected)` |
| `<leader>l` | 普通模式 (n) | 调用代码镜头操作，调用 `<Plug>(coc-codelens-action)` |
| `<leader>s` | 普通模式 (n)、可视模式 (v) | 选择范围，调用 `<Plug>(coc-range-select)` |
| `:Format` | 普通模式 (n) | 格式化代码，调用 `CocActionAsync('format')` |
| `Import` | 普通模式 (n) | 组织导入，调用 `CocActionAsync('runCommand', 'editor.action.organizeImport')` |
| `<leader><leader>f` | 普通模式 (n) | 格式化代码，执行 `:Format` |
| `<space><space>c` | 普通模式 (n) | 打开 Coc 配置文件，执行 `:CocConfig` |
| `<space><space>l` | 普通模式 (n) | 显示扩展列表，执行 `:CocList --normal extensions` |
| `<space><space>j` | 普通模式 (n) | 显示大纲，执行 `:CocList outline` |
| `<space><space>k` | 普通模式 (n) | 显示当前函数符号，执行 `:echo CocAction('getCurrentFunctionSymbol')` |
| `K`、`gh` | 普通模式 (n) | 显示文档，调用 `ShowDocumentation()` |
| `<c-LeftMouse>`、`<a-LeftMouse>` | 普通模式 (n) | 点击跳转到定义处 |
| `<c-RightMouse>`、`<a-RightMouse>` | 普通模式 (n) | 点击显示文档 |
| `-c` | 普通模式 (n) | 启用 Coc 鼠标模式 |

### nerdtree
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader>n` | 普通模式 (n) | 切换 NerdTree 窗口的显示，执行 `:NERDTreeToggle` |
| `<leader>N` | 普通模式 (n) | 在 NerdTree 中定位当前文件，执行 `:NERDTreeFind` |

### vista.vim
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader>t` | 普通模式 (n) | 切换 Vista 窗口的显示，执行 `:Vista!!` |

### vim-easymotion
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader>w` | 普通模式 (n) | 调用 EasyMotion 的 `<Plug>(easymotion-bd-w)`，用于快速移动 |
| `<leader>f` | 普通模式 (n) | 调用 EasyMotion 的 `<Plug>(easymotion-s)`，用于快速查找字符 |
| `s` | 普通模式 (n) | 调用 EasyMotion 的 `<Plug>(easymotion-s)`，用于快速查找字符 |
| `<c-s>` | 插入模式 (i) | 切换到普通模式并调用 EasyMotion 的 `<Plug>(easymotion-s)` |

### leaderF
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<space>f` | 普通模式 (n) | 查找文件，执行 `:LeaderfFile` |
| `<space>F` | 普通模式 (n) | 查找最近使用的文件，执行 `:LeaderfMru` |
| `<leader>b`、`<space>b` | 普通模式 (n) | 查找缓冲区，执行 `:LeaderfBuffer` |
| `<space>t` | 普通模式 (n) | 查找函数，执行 `:LeaderfFunction` |
| `<space>T` | 普通模式 (n) | 查找所有函数，执行 `:LeaderfFunctionAll` |
| `<space>t` | 可视模式 (v) | 以选中内容为输入查找函数，执行 `:Leaderf function --all --input ` 加选中内容 |
| `<space>h` | 普通模式 (n) | 查找帮助，执行 `:LeaderfHelp` |
| `<space>H` | 普通模式 (n) | 查找帮助，输入关键词为 `key:`，执行 `:Leaderf help --input key:` |
| `<space>h` | 可视模式 (v) | 以选中内容为输入查找帮助，执行 `:Leaderf help --input ` 加选中内容 |
| `<space>/` | 普通模式 (n) | 查找行，执行 `:LeaderfLine` |
| `<space>/` | 可视模式 (v) | 以选中内容为输入查找行，执行 `:Leaderf line --input ` 加选中内容 |
| `<space>?` | 普通模式 (n) | 查找所有行，执行 `:LeaderfLineAll` |
| `<space>?` | 可视模式 (v) | 以选中内容为输入查找所有行，执行 `:Leaderf line --all --input ` 加选中内容 |
| `<space>a` | 普通模式 (n) | 使用 `rg -i` 查找，执行 `:Leaderf rg -i` |
| `<space>A` | 普通模式 (n) | 使用 `rg -i` 查找当前光标下的单词，执行 `:Leaderf rg -i --cword` |
| `<space>a` | 可视模式 (v) | 以选中内容为输入使用 `rg -i` 查找，执行 `:Leaderf rg -i --input ` 加选中内容 |
| `<space>A` | 可视模式 (v) | 以选中内容为输入使用 `rg -i` 查找，执行 `:Leaderf rg -i ` 加选中内容 |
| `<space>j` | 普通模式 (n) | 查找缓冲区标签，执行 `:LeaderfBufTag` |
| `<space>J` | 普通模式 (n) | 查找所有缓冲区标签，执行 `:LeaderfBufTagAll` |
| `<space>k` | 普通模式 (n) | 查找跳转记录，执行 `:Leaderf jumps` |
| `<space>l` | 普通模式 (n) | 召回 LeaderF 历史记录，执行 `:Leaderf --recall` |
| `<space>Q` | 普通模式 (n) | 查找 quickfix 列表，执行 `:Leaderf quickfix` |
| `<F1>` | 普通模式 (n) | 查找颜色方案，执行 `:LeaderfColorscheme` |
| `=l` | 普通模式 (n) | 设置 LeaderF 工作目录模式为 `ac` |
| `\l` | 普通模式 (n) | 设置 LeaderF 工作目录模式为 `c` |

### tabular
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader>T` | 普通模式 (n)、可视模式 (v) | 执行 `:Tabularize /`，用于文本对齐 |

### vim-surround
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| 无特定映射 | 普通模式 (n)、可视模式 (v)、操作符等待模式 (o) | 用于快速更改包围符号，`g:surround_no_insert_mappings=1` 表示在插入模式下不映射 |

### vim-smooth-scroll
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<c-u>` | 普通模式 (n) | 平滑向上滚动，调用 `smooth_scroll#up` |
| `<c-d>` | 普通模式 (n) | 平滑向下滚动，调用 `smooth_scroll#down` |
| `<c-b>` | 普通模式 (n) | 平滑向上滚动两倍距离，调用 `smooth_scroll#up` |
| `<c-f>` | 普通模式 (n) | 平滑向下滚动两倍距离，调用 `smooth_scroll#down` |

### gv
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader>g` | 普通模式 (n) | 打开 Git 可视化界面，执行 `:GV` |
| `<leader>G` | 普通模式 (n) | 打开 Git 可视化界面（强制刷新），执行 `:GV!` |
| `<leader><leader>g` | 普通模式 (n) | 打开 Git 可视化界面（查询模式），执行 `:GV?` |

### clever f
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `;` | 普通模式 (n)、可视模式 (v) | 重复向前查找，调用 `<Plug>(clever-f-repeat-forward)` |
| `{` | 普通模式 (n)、可视模式 (v) | 重复向后查找，调用 `<Plug>(clever-f-repeat-back)` |

### asyncrun
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<space>:` | 普通模式 (n) | 执行异步任务，执行 `:AsyncRun` |
| `<leader>A` | 普通模式 (n) | 使用 `ack -i` 进行查找，执行 `:AsyncRun ack -i<space>` |

### Codeium
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `Codeium` | 命令模式 (c) | 启用 Codeium，执行 `Codeium Enable` |

### vim-ai-doubao
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `aic` | 命令模式 (c) | 执行 `AIChat` 命令 |
| `aie` | 命令模式 (c) | 执行 `AIEdit` 命令 |
| `ai` | 命令模式 (c) | 执行 `AI` 命令 |
| `<space>i` | 普通模式 (n)、可视模式 (v) | 执行 `:AIChat` 命令 |
| `<space>I` | 可视模式 (v) | 执行 `:AIEdit` 命令 |

### termtask
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<space>c` | 普通模式 (n) | 执行 `:TaskRun` 命令，运行任务 |
| `<space>C` | 普通模式 (n) | 编辑任务配置文件，调用 `termtask#Term_config_edit()` |

### restful
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<space><space>i` | 普通模式 (n) | 执行 `rest#VrcQuery(1)`，进行 REST 请求 |
| `<space><space>I` | 普通模式 (n) | 执行 `rest#VrcQuery(0)`，进行 REST 请求 |

### gitgutter
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `=g` | 普通模式 (n) | 启用 GitGutter，调用 `gutter#GitGutterAble()` |
| `\g` | 普通模式 (n) | 禁用 GitGutter，调用 `gutter#GitGutterDisable()` |
| `[g` | 普通模式 (n) | 跳转到上一个 Git 更改，调用 `gutter#GitGutterChangeTurn(0,line('.'))` |
| `]g` | 普通模式 (n) | 跳转到下一个 Git 更改，调用 `gutter#GitGutterChangeTurn(1,line('.'))` |
| `-g` | 普通模式 (n) | 恢复 Git 更改，调用 `gutter#GitGutterRecover()` |
| `zg` | 普通模式 (n) | 折叠 Git 更改，调用 `gutter#GitGutterFold()` |
| `<c-g>` | 普通模式 (n) | 显示 Git 差异，调用 `gutter#GitGutterDiff()` |

### editorconfig
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `=E` | 普通模式 (n) | 启用 EditorConfig，调用 `editorconfig#Able()` |
| `\E` | 普通模式 (n) | 禁用 EditorConfig，调用 `editorconfig#Disable()` |
| `-E` | 普通模式 (n) | 编辑 EditorConfig 文件，调用 `editorconfig#EditconfigFile()` |

### cursorline
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `=f` | 普通模式 (n) | 启用光标行高亮，调用 `cursorline#Able()` |
| `-f` | 普通模式 (n) | 切换光标行高亮状态，调用 `cursorline#Toggle()` |
| `\f` | 普通模式 (n) | 禁用光标行高亮，调用 `cursorline#Disable()` |

### ici
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<leader>i` | 可视模式 (v) | 执行 `termtask#Term_cmd_exec_popup('v')` |
| `<leader>i` | 普通模式 (n) | 执行 `termtask#Term_cmd_exec_popup('')` |

### obj
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `ae`、`il`、`al`、`aa`、`ia`、`ai`、`ii`、`ih`、`iq`、`i/`、`i-`、`i.`、`i*`、`i,`、`a,`、`i;`、`a;`、`in`、`an` | 操作符等待模式 (o)、可视模式 (v) | 与代码对象选择相关，调用 `obj` 模块的不同函数 |

### sudo
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `w!!` | 命令模式 (c) | 使用 `pkexec` 以管理员权限保存文件 |

### cd
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `cdn` | 命令模式 (c) | 切换到当前文件所在目录，执行 `cd <c-r>=expand('%:p:h')<cr>` |
| `cdr` | 命令模式 (c) | 切换到项目根目录，执行 `cd <c-r>=termtask#Term_get_dir()<cr>` |

### cmd
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<c-a>`、`<c-e>`、`<c-d>`、`<c-h>`、`<c-l>`、`<c-b>`、`<c-f>` | 命令模式 (c) | 与 Emacs 模式类似的光标移动和删除操作 |
| `(`、`[`、`{`、`"`、`'`、`>`、`)`、`}`、`]` | 命令模式 (c) | 自动补全配对符号，并根据情况移动光标 |
| `<bs>` | 命令模式 (c) | 根据情况删除配对符号或执行普通删除操作 |

### tab
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `<tab>` | 可视模式 (v) | 增加缩进，执行 `>gv` |
| `<s-tab>` | 可视模式 (v) | 减少缩进，执行 `<gv` |
| `<tab>` | 选择模式 (s) | 切换到下一个代码片段，执行 `<c-j>` |
| `<s-tab>` | 选择模式 (s) | 切换到上一个代码片段，执行 `<c-k>` |

### gf
| 映射 | 模式 | 功能描述 |
| ---- | ---- | ---- |
| `gf` | 普通
