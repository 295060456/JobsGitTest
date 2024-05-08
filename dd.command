#!/bin/bash

# 检查是否有未提交的更改
if ! git diff --quiet; then
    # 将未提交的更改暂存起来
    git stash save "Stashed changes before reverting to previous commit"
fi

# 回退到上一次提交
git reset --hard HEAD^

# 恢复之前暂存的更改（如果有的话）
if [ $(git stash list | wc -l) -gt 0 ]; then
    git stash pop
fi

echo "Successfully reverted to the previous commit."
