#!/bin/bash

# 获取当前文件夹路径
current_directory=$(dirname "$(realpath "$0")")
# 切换到当前目录
cd "$current_directory"

# 函数：回退到指定的提交ID版本
rollback_to_commit() {
    commit_id=$1
    git reset "$commit_id"
    git stash # 暂存修改
    git push --force origin :"$commit_id" # 删除远程提交
    git stash pop # 释放暂存的修改，开始修改代码
    git add .
    git commit -m "Revert to $commit_id"
    git push origin HEAD
}

# 获取用户输入
read -p "请输入提交的ID: " input_commit_id

# 检查是否有输入
if [ -z "$input_commit_id" ]; then
    echo "输入的提交ID不能为空"
    exit 1
fi

rollback_to_commit "$input_commit_id"
echo "已删除提交ID为 $input_commit_id 的版本，并推送到远程仓库"
