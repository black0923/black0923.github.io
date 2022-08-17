---
title: 怎么结合Hexo在GitHub搭建自己的博客网站
date: 2022-08-17 14:16:08
tags:
---
## 一，创建[GitHub Pages](https://pages.github.com/)项目

### 1，首先你需要注册一个 GitHub 账号，并在个人主界面里选择创建一个新的 Repository 。

项目命名格式：username.github.io，并设置为Public
![new_repository](/images/new_repository.png)
配置中找到pages项，配置使用哪个分支代码
![new_repository](/images/setting.png)

## 二，使用[HEXO](https://hexo.io/zh-cn/docs/)

### 1，安装 Hexo

安装 Hexo 相当简单，只需要先安装下列应用程序即可：
·[Node.js](https://nodejs.org/en/) (Node.js 版本需不低于 10.13，建议使用 Node.js 12.0 及以上版本)
·[Git](https://git-scm.com/)
所有必备的应用程序安装完成后，即可使用 npm 安装 Hexo。

```git
npm install -g hexo-cli
```

进阶安装和使用
对于熟悉 npm 的进阶用户，可以仅局部安装 hexo 包。

```git
npm install hexo
```

### 2，新建 Hexo项目

安装 Hexo 完成后，请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件。

```git
hexo init my_hexo_demo
cd my_hexo_demo
npm install
```

### 3，运行 Hexo项目

安装完依赖 使用

```
npm run server
```

启动服务，就可以在[本机4000端口](http://localhost:4000)查看效果

## 三，使用hexo编译并更新到GitHub分支

根目录找到_config.yml文件，并配置

```yml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: 你的GitHub代码仓
  branch: pages分支

```

编译并上传到GitHub

```git
hexo clean
hexo g
hexo d
```

我们再打开 username.github.io 就可以看到自己的GitHub Pages了