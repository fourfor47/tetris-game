/bin/bash
# GitHub Pages 部署脚本
# 使用方法：
# 1. 在 GitHub 创建一个新仓库（public）
# 2. 将仓库地址替换下面的 YOUR_USERNAME 和 REPO_NAME
# 3. 运行此脚本

set -e

echo "🚀 开始部署到 GitHub Pages..."

# 配置（请修改这些）
GITHUB_USERNAME="YOUR_USERNAME"
REPO_NAME="tetris-game"
BRANCH="gh-pages"

# 询问用户
read -p "GitHub 用户名: " GITHUB_USERNAME
read -p "仓库名: " REPO_NAME
read -p "是否已经创建仓库？(y/n): " CREATED

if [ "$CREATED" != "y" ]; then
    echo "请先访问 https://github.com/new 创建仓库"
    echo "仓库名: $REPO_NAME"
    echo "建议：Public, 不添加 README/ .gitignore"
    echo "创建后按回车继续..."
    read
fi

# 添加远程仓库
echo "📤 添加远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# 创建 gh-pages 分支
echo "🌿 创建 gh-pages 分支..."
git checkout -b $BRANCH 2>/dev/null || git checkout $BRANCH

# 复制部署文件（覆盖 index.html）
cp games/tetris/index.html ./index.html
cp README-deploy.md ./README.md

# 添加 .nojekyll 文件（避免 Jekyll 处理）
touch .nojekyll

# 提交并推送
echo "📦 提交代码..."
git add .
git commit -m "🚀 Deploy to GitHub Pages" || echo "无更改"

echo "☁️  推送到 GitHub..."
git push -u origin $BRANCH --force

# 等待并检查 Pages 状态
echo "⏳ 等待 GitHub Pages 构建..."
sleep 10

echo ""
echo "✅ 部署完成！"
echo "🌐 访问地址：https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo ""
echo "📝 后续更新步骤："
echo "1. 开发游戏：在 games/tetris/ 修改代码"
echo "2. 运行 deploy.sh 重新部署"
echo "3. 访问 https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
