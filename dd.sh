#!/bin/bash

# 获取当前文件夹路径
current_directory=$(dirname "$(realpath "$0")")

# 切换到当前目录
cd "$current_directory"

# 检查是否有未提交的更改
if ! git diff --quiet; then
    echo "Error: There are uncommitted changes. Please commit or stash them before proceeding."
    exit 1
fi

# 回退到上一次提交
git reset --hard HEAD^

echo "Successfully reverted to the previous commit."
