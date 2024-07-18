#!/usr/bin/env python3
# coding=utf-8
# 此文件和解释文件都是通过GPT生成的😃

import re

# 定义正则表达式匹配所有map的语句，包括递归和非递归的情况
map_pattern = re.compile(r'^\s*(i|n|v|x|s|o|c|l|t|a)?(nore)?map\s+(\S+)\s+(.*)')

# 定义映射类型和其对应的模式描述
mode_description = {
    'map': '所有模式',
    'imap': '插入模式',
    'noremap': '所有模式(无递归)',
    'inoremap': '插入模式(无递归)',
    'nmap': '普通模式',
    'nnoremap': '普通模式(无递归)',
    'vmap': '可视模式',
    'vnoremap': '可视模式(无递归)',
    'xmap': '选择模式',
    'xnoremap': '选择模式(无递归)',
    'smap': '选择模式',
    'snoremap': '选择模式(无递归)',
    'omap': '操作符待定模式',
    'onoremap': '操作符待定模式(无递归)',
    'cmap': '命令行模式',
    'cnoremap': '命令行模式(无递归)',
    'lmap': '插入命令模式',
    'lnoremap': '插入命令模式(无递归)',
    'tmap': '终端模式',
    'tnoremap': '终端模式(无递归)',
    'amap': '所有模式',
    'anoremap': '所有模式(无递归)',
}

# 读取vimrc文件内容
with open('/home/chenxuan/vim-fast/.vimrc', 'r', encoding='utf-8') as file:
    vimrc_content = file.readlines()

# 读取已存在的映射文件内容
output_file_path = 'key_map.txt'
try:
    with open(output_file_path, 'r', encoding='utf-8') as file:
        existing_mappings = file.read().splitlines()
except FileNotFoundError:
    existing_mappings = []

# 将已有的映射转换为字典 {region+key: (mapping, description)}
existing_mappings_dict = {}
for line in existing_mappings:
    parts = line.split('\t\t')
    if len(parts) >= 4:
        region_key = parts[0] + parts[1]
        existing_mappings_dict[region_key] = (parts[2], parts[3])

# 用于存储新的映射结果
new_mappings = []

# 遍历每一行，匹配并拆分
for line in vimrc_content:
    match = map_pattern.match(line.strip())
    if match:
        region_prefix = match.group(1) or ''
        nore = match.group(2) or ''
        region = region_prefix + nore + 'map'
        key = match.group(3)
        mapping = match.group(4)
        description = mode_description.get(region, '未知模式')
        
        # 构建唯一标识
        unique_key = region + key
        
        # 检查该映射是否已经存在
        if unique_key in existing_mappings_dict:
            # 如果存在但mapping不一样，替换这一行
            if existing_mappings_dict[unique_key][0] != mapping:
                existing_mappings_dict[unique_key] = (mapping, description)
        else:
            # 如果不存在，添加新的映射
            existing_mappings_dict[unique_key] = (mapping, description)

# 将字典中的映射转换回列表形式
final_mappings = []
for region_key, (mapping, description) in existing_mappings_dict.items():
    # 拆分唯一标识回region和key
    region_match = re.match(r'^(i|n|v|x|s|o|c|l|t|a)?(nore)?map', region_key)
    if region_match:
        region = region_match.group(0)
        key = region_key[len(region):]
        final_mappings.append(f"{region}\t\t{key}\t\t{mapping}\t\t{description}\t\t")

# 将结果写入文件
with open(output_file_path, 'w', encoding='utf-8') as file:
    for line in final_mappings:
        file.write(line + '\n')

print("处理完成，映射已更新并保存到output.txt文件中。")

