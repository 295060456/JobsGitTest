#!/bin/bash

# 放在 .git 文件夹同级

# ❤️要回退远程版本,首先需要有远程服务器的删除代码的权限❤️

# 获取当前文件夹路径
current_directory=$(dirname "$(realpath "$0")")

# 切换到当前目录
cd "$current_directory/.." || exit

# 获取用户输入
read -r -p "请输入要删除的远程提交的ID: " remote_commit_id

# 检查是否有输入
if [ -z "$remote_commit_id" ]; then
    echo "未输入远程提交ID,脚本退出"
    exit 1
fi

# 创建一个新的提交来撤销指定的提交
git revert "$remote_commit_id"

# 强制推送到远程仓库,删除指定的提交
git push origin "+$remote_commit_id^:refs/heads/main"

echo "已删除远程提交ID为 $remote_commit_id 的提交"
