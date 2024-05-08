#!/bin/bash

# 检查是否有未提交的更改
if ! git diff --quiet; then
    echo "Error: There are uncommitted changes. Please commit or stash them before proceeding."
    exit 1
fi

# 回退到上一次提交
git reset --hard HEAD^

echo "Successfully reverted to the previous commit."
