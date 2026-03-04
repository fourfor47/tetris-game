#!/bin/bash
# 游戏开发自动化运行脚本

echo "🎮 游戏开发自动化流水线"
echo "========================"
echo ""

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 需要安装 Node.js"
    exit 1
fi

# 检查 Git
if ! command -v git &> /dev/null; then
    echo "⚠️  Git 未安装，跳过 Git 功能"
fi

# 运行自动化脚本
cd "$(dirname "$0")"
node auto-dev.js

echo ""
echo "✅ 自动化完成"
