#!/bin/bash
# 放在 .git 文件夹同级

# 获取当前文件夹路径
current_directory=$(dirname "$(realpath "$0")")
# 切换到当前目录
cd "$current_directory"
# 函数：回退到指定的提交ID版本
rollback_to_commit() {
    commit_id=$1
    git reset --hard "$commit_id"
}

# 获取用户输入
read -p "请输入提交的ID（按回车键回退到上一个版本）: " input_commit_id

# 检查是否有输入
if [ -z "$input_commit_id" ]; then
    # 如果没有输入，则回退到上一个版本
    git reset --hard HEAD^
    echo "已回退到上一个版本"
else
    # 否则，回退到指定的提交ID版本
    rollback_to_commit "$input_commit_id"
    echo "已回退到提交ID为 $input_commit_id 的版本"
fi
