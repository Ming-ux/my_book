[TOC]



# github推送代码方式

从2021-08-13号开始，github不在支持`密码认证`方式来推送代码了，所以需要使用新的形式来推送代码。

```bash
~ git push

remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.
remote: Please see https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/ for more information.
fatal: unable to access 'https://github.com/user/repo.git/': The requested URL returned error: 403
```

## 1. 使用access tokens方式

github网站登陆后， 点击右上角的用户图标 -> settings -> 选择 Developer settings -> 选择 Personal access tokens，或者打开链接https://github.com/settings/tokens 

1、在access token页面，点击`Generate new token`按钮进入新建token页面。

2、在新建页面，输入token名字、选择过期时间、勾选权限后。点击`Generate token`按钮，生成一个新token。生成成功后会返回 access tokens页面。

3、在access token页面，会显示新建的token的值，复制，保存。

4、clone一个仓库、修改仓库地址：

```bash
# git clone https://oauth2:[access tokens]@github.com/user/repo
git clone https://oauth2:ghp_GjguOh******KZm@github.com/user/repo

# 修改仓库
git remote set-url origin https://oauth2:ghp_GjguOh******ThzKZm@github.com/user/repo
```

![](./img/038-github-token.png)

![](./img/039-github-token.png)



## 2. 使用ssh方式

在 Linux/macOS 系统中，一般都会自带ssh。windows下的[git终端](https://git-scm.com/)里有ssh。

1、终端打开`~/.ssh`文件夹，使用`ll`命令查看文件，查看是否存在`id_rsa`和`id_rsa.pub`文件。如果没有这两个文件，终端使用`ssh-keygen -o`名称生成一个秘钥和公钥:

```bash
$ ssh-keygen -o
Generating public/private rsa key pair.
Enter file in which to save the key (/home/schacon/.ssh/id_rsa):
Created directory '/home/schacon/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/schacon/.ssh/id_rsa.
Your public key has been saved in /home/schacon/.ssh/id_rsa.pub.
The key fingerprint is:
d0:82:24:8e:d7:f1:bb:9b:33:53:96:93:49:da:9b:e3 schacon@mylaptop.local
```

如果上面命令报错，尝试使用`ssh-keygen -t rsa -C 'user@gmail.com'`

2、打开生成的秘钥所在文件夹，终端使用`cat id_rsa.pub`命令查看公钥内容，复制显示的内容：

```bash
~ cat id_rsa.pub

ssh-rsa AAAAB3..省略内容..utlook.com
```

3、github网站登陆后， 点击右上角的用户图标 -> settings -> 选择 SSH and GPG keys，点击`New SSH key`按钮新建一个，在新建页面中，输入title和之前复制的公钥内容，然后点击`Add SSH key`按钮就好了。

4、使用终端使用如下命令测试是否配置成功：

```bash
~ ssh -T git@github.com

The authenticity of host 'github.com (13.250.177.223)' can't be established.
RSA key fingerprint is SHA256:nT*******5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,13.250.177.223' (RSA) to the list of known hosts.

# 出现如下语句，说明设置成功了
Hi user! You've successfully authenticated, but GitHub does not provide shell access.
```

如果测试失败了，等一会在测试，如果还是失败，查看终端是否能访问github(代理)，然后在测试

4、ssh设置好后，就可以使用ssh方式clone仓库或者修改已存在的仓库使用ssh方式：

```bash
~ git clone git@github.com:user/my_blog.git

# 修改已存在的仓库使用ssh
git remote set-url origin git@github.com:user/my_blog.git
```

![](./img/040-github-ssh.png)

![](./img/041-github-ssh.png)







## 参考资料

[Git - 生成 SSH 公钥](https://git-scm.com/book/zh/v2/服务器上的-Git-生成-SSH-公钥)

