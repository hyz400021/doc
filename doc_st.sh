

#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 从环境变量中获取 Personal Access Token,这里直接写了,放到环境变量中比较安全
TOKEN="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" 

# push_addr=`git remote get-url --push origin` # git提交地址，也可以手动设置，比如：push_addr=git@github.com:xugaoyi/vuepress-theme-vdoing.git

# 生成提交信息
commit_info=$(git describe --all --always --long)

# 打包生成的文件夹路径
dist_path=docs/.vuepress/dist

# 推送的分支
push_branch=gh-pages

# 生成静态文件
npm run build

# 进入生成的文件夹
cd $dist_path

# 初始化 Git 仓库
git init

# 添加文件并提交
git add -A
git commit -m "deploy, $commit_info"

# 使用 Personal Access Token 进行推送
# 注意：在 URL 中使用 $TOKEN 可以将环境变量的值插入
git push -f https://$TOKEN@github.com/hyz400021/doc.git HEAD:$push_branch

cd ..
rm -rf $dist_path
