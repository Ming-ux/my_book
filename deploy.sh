#!/usr/bin/env sh
-------------------------------------------------------------------------------------------
#! github+gitbook实现主分支master编辑，分支gh-pages发布的功能
#！教程参考：https://www.cnblogs.com/phyger/p/14035937.html

#！步骤一：完成编辑后，在根目录my_book处，上传所有文件到仓库my_book的主分支master
git init
git add .		#添加根目录下的所有文件
git commit -m "first commit"
git branch -m master
git remote add origin https://github.com/Ming-ux/my_book.git  #仓库my_book
git push -u origin master

#！步骤二：在根目录下my_book下进行gitbook编译,该过程是将上一步的md文件编译成静态html文件
gitbook build .

#！步骤三：目录切到编译成的_book文件夹，开始讲该文件传至分支gh-pages
cd _book
git init #！初始化
git remote add origin https://github.com/Ming-ux/my_book.git
git add .
git commit -m 'second'
git branch -m master
git push --force --quiet "https://github.com/Ming-ux/my_book.git" master:gh-pages #！强制提交

#！经过步骤三，前往仓库my_book可发现新增了gh-pages分支，进入该分支可发现仓库有index.html文件
#！步骤四：github pages的设置
#！点击gh-pages分支上方的settings,在左侧点击Pages，branch处选择分支和文件，点击save。上方出现pages网址

author:Ming
-------------------------------------------------------------------------------------------
echo '开始执行命令'
# 生成静态文件
echo ''
echo '执行命令：gitbook build .gitbook编译'
echo ''
gitbook build .

# 进入生成的文件夹
echo ''
echo "执行命令：cd ./_book"
echo ''
cd ./_book

# 发布到自定义域名
echo ''
echo "把域名放到CNAME文件中"
echo 'yu66.vip' > CNAME
echo ''

# 初始化一个仓库，仅仅是做了一个初始化的操作，项目里的文件还没有被跟踪
echo ''
echo "执行命令：git init"
echo ''
git init

# 保存所有的修改
echo ''
echo "执行命令：git add -A"
echo ''
git add -A

# 把修改的文件提交
echo ''
echo "执行命令：commit -m 'deploy'"
echo ''
git commit -m 'deploy'

# 发布到码云网站
echo ''
echo "执行命令：git push -f https://gitee.com/dragon-li/my-wiki master:gh-pages"
echo ''
git push -f https://gitee.com/dragon-li/my-wiki master:gh-pages

echo ""
echo "打开码云 Gitee Pages 服务，手动更新服务"
open https://gitee.com/dragon-li/my-wiki/pages

# 发布到github网站: https://<USERNAME>.github.io/<REPO>
echo ''
echo "发布到github网站服务，执行命令：git push -f git@github.com:yulilong/my_blog.git master:gh-pages"
git push -f git@github.com:yulilong/my_blog.git master:gh-pages


# 返回到上一次的工作目录
echo ''
echo "回到刚才工作目录"
cd -
