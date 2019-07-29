#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
cnpm run docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

touch CNAME
echo 'zippolee.ga' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:ZippoLee12138/ZippoLee12138.github.io.git master:master

cd -