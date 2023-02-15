## 说明

这是我 fork 的文档，我会修改其中的内容。

github地址：https://github.com/Ming-ux/my_book

github pages地址：https://ming-ux.github.io/my_book/



## 1. 文章内容目录

请参考`SUMMARY.md`文件。



## 2. 项目开发部署

本服务使用的是gitbook + github pages托管形式网站。

[gitbook使用教程](https://segmentfault.com/a/1190000017960359#articleHeader6)

本地电脑编辑器推荐使用：https://typora.io/

### 2.1 本地开发

需要本地电脑里面有终端和nodejs，如果没有请自行查找安装，nodejs官网：http://nodejs.cn/ 

1、代码克隆到本地电脑。

2、终端使用`npm install gitbook-cli -g` 命令安装 gitbook-cli工具，已经安装请忽略。

3、在终端使用`npm install`命令安装gitbook插件。

4、终端使用`npm start`命令启动本地开发服务。

4.1 本地启动时，发现报错在此文件中/usr/local/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287:18，问题是polyfills.js中的定义cd.apply的statFix()函数出现问题，将三行statFix()函数注释掉即可正常运行。

5、在浏览器中输入`http://localhost:4000/`地址查看项目。

### 2.2 服务部署

终端使用`bash deolog.sh`命令运行自动部署脚本。

具体部署方法请参照`./deploy.sh`文件内容。



