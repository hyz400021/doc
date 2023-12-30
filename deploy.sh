#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e
npm run build # 生成静态文件
cd docs/.vuepress/dist # 进入生成的文件夹

# deploy to github

git config --global user.name "黄元治"
git config --global user.email "xox@qq.com"

# 推送的分支
push_branch=gh-pages

if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
#   githubUrl=https://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@github.com/hyz400021/doc.git
#   githubUrl=git@github.com:hyz400021/doc.git
else
  msg='来自github action的自动部署'
#   githubUrl=https://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@github.com/hyz400021/doc.git
fi

# git push -f https://${GITHUB_TOKEN}@github.com/hyz400021/doc.git HEAD:$push_branch

git remote set-url origin https://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@github.com/hyz400021/doc.git

git init
git add -A
git commit -m "${msg}"
git push -f https://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@github.com/hyz400021/doc.git gh-pages
# git push -f $githubUrl origin:gh-pages # 推送到github

cd -
rm -rf docs/.vuepress/dist

