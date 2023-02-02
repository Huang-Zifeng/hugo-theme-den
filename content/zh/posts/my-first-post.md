---
title: "搭建你的第一个博客"
date: 2023-02-01T12:10:21+08:00
draft: false
tags: ["博客"]
categories: ["Notes"]
authors:
- "Mitcher"
resources:
- name: header
  src: 'header.jpg'
---

今天在这里给大家分享如何快速用Hugo搭建自己的个人博客。

# 一、环境搭建

本文面对对Git有一定基础知识的读者（搭建仓库、Push和Pull操作）

安装程序的时候最好勾选添加到环境变量选项，如果忘记添加也可以按照Step4手动添加

## 1. Git安装

[Git - Downloads (git-scm.com)](https://git-scm.com/downloads)

## 2. Hugo安装

[Windows | Hugo (gohugo.io)](https://gohugo.io/installation/windows/)

[macOS | Hugo (gohugo.io)](https://gohugo.io/installation/macos/)

## 3. Go安装

[Download and install - The Go Programming Language](https://go.dev/doc/install)

Go是Hugo在[Quick Start](https://gohugo.io/getting-started/quick-start/)里面推荐搭建的编程语言环境

## 4. 添加环境变量

![8Pt6z.png](https://i.328888.xyz/2023/02/01/8Pt6z.png)

# 创建 Hugo 网站

## 1. 创建网站

```bash
hugo new site site-name(网站名字)
```

## 2. 安装主题

Hugo支持广泛的主题，你可以在[Themes](https://themes.gohugo.io/)当中选取你想要的主题，每个主题的配置方式有些许不同，应该参考主题对应仓库下的说明，但是以下步骤是每个主题搭建都会遵循的步骤。

你可以下载主题的最新版本 .zip 文件 并且解压放到 `themes` 目录.

另外, 也可以直接把这个主题克隆到 `themes` 目录:

```bash
https://github.com/luizdepra/hugo-coder.git themes/hugo-coder
```

或者, 初始化你的项目目录为 git 仓库, 并且把主题仓库作为你的网站目录的子模块

```bash
git init
git submodule add https://github.com/pseudoyu/hugo-theme-den themes/hugo-theme-den
```

（PS: `Coder`主题笔者直接用`git clone`可以成功，但是`den`主题只有使用第三种方式的时候才成功，采用前两种方式的时候不会创建`.gitmodule`文件，后续`GitPages`在网站时会报错，den默认使用了`gitmodule`?  未知QAQ）

下面以den这款主题为例子讲述如何搭建

## 3. 修改配置文件`.toml`

根目录下的`config.toml`是我们网站的配置文件，一般可以在`theme\exampleSite`里面直接找到作者推荐的配置文件。

```bash
# ------------------------------------- #
# ---- General Settings --------------- #
# ------------------------------------- #
baseURL = "https://example.com"
title = "Den"
theme = "hugo-theme-den"
#enableRobotsTXT = true       # generate robots.txt
enableEmoji = true           # use emoji support
hasCJKLanguage = true        # detect CJK languages for word count etc.
preserveTaxonomyNames = true # do not make tag names lowercase
# uglyURLs = true            # more info: https://gohugo.io/content-management/urls/#ugly-urls
rssLimit = 20                # limit number of entries in RSS feeds
ignoreErrors = ["error-remote-getjson"]

# Copyright, appears in the footer
# copyright = ""             # default: author.name

# Pagination
# number of entries per page for archives, tags and categories
# since we don't have list view, recommend a large value
paginate = 20
paginatePath = "page"

# Syntax Hightlight
PygmentsCodeFences = true
PygmentsUseClasses = true    # required for shhighlight shortcode

# service plugins
disqusShortname = ""         # disqus_shortname
googleAnalytics = ""         # UA-XXXXXXXX-X

# language support # en / zh-tw / other... translations present in i18n/
defaultContentLanguage = "en"           # Default language to use
defaultContentLanguageInSubdir = true

# Links format
[permalinks]
  posts = "/:year/:month/:day/:slug/"
  categories = "/category/:slug/"      # required
  tags = "/tag/:slug/"                 # required
  pages = "/:slug/"

[author]                     # required
  name = "Jane Doe"

[sitemap]                    # required
  changefreq = "weekly"
  priority = 0.5
  filename = "sitemap.xml"

# ------------------------------------- #
# ---- Other Params ------------------- #
# ------------------------------------- #

[params]
  since = "2017"             # Site creation time
  rssFullContent = true      # set true to use full content instead of summary

  # site info (optional)
  keywords = ["Hugo", "theme","den"]
  description = "A simple theme for Hugo"
  logoTitle = "Den" # shown on top-left, default: title
  siteLogoImage = "images/globe.svg"     # shown besides logoTitle
  # headerTitle = "Den"                   # default: title
  headerImage = "images/background.jpg"
  showAuthorCard = true # Whether to show author information below the article

  showMenuLanguages = true

  autoLoadComments = false # auto load comment when scrolling down

  # paginate style, default use numbered pagination links
  # if true, use original "Previous" and "Next" links.
  # paginateOriginalStyle = true

  # The date format to use; for a list of valid formats, see https://gohugo.io/functions/format/
  dateFormatToUse = "2006-01-02"

  google_verification = ""  # Google_Verification

  # Link custom CSS and JS assets
  #   (relative to /static/css and /static/js respectively)
  customCSS = []             # if ['custom.css'], load '/static/css/custom.css' file
  customJS = []              # if ['custom.js'], load '/static/js/custom.js' file

# ------------------------------------- #
# ---- Related Articles --------------- #
# ------------------------------------- #
[related]
  # Only include matches with rank >= threshold. This is a normalized rank between 0 and 100.
  threshold = 50

  # To get stable "See also" sections we, by default, exclude newer related pages.
  includeNewer = true

  # Will lower case keywords in both queries and in the indexes.
  toLower = false

[[related.indices]]
  name = "categories"
  weight = 200

[[related.indices]]
  name = "keywords"
  weight = 150

[[related.indices]]
  name = "tags"
  weight = 100


[languages.en]
  languageCode = "en"
  languageName = "English"
  contentDir = "content/en"
  weight = 1

  [[languages.en.menu.main]]
    name = "Notes"
    weight = 10
    identifier = "notes"
    url = "category/notes/"
  [[languages.en.menu.main]]
    name = "Demos"
    weight = 20
    identifier = "demos"
    url = "category/demos/"

  [[languages.en.menu.social]]
    name = "GitHub"
    weight = 10
    identifier = "github"
    url = "https://github.com/shaform/hugo-theme-den/"

  [[languages.en.menu.links]]
    name = "About Me"
    weight = 10
    identifier = "about-me"
    url = "https://github.com/shaform/hugo-theme-den/"

[languages.zh-tw]
  languageCode = "zh-tw"
  languageName = "繁體中文"
  contentDir = "content/zh-tw"
  weight = 2

  [languages.zh-tw.params]
    description = "一個簡單的佈景。"

  [[languages.zh-tw.menu.main]]
    name = "筆記"
    weight = 10
    identifier = "notes"
    url = "category/notes/"
  [[languages.zh-tw.menu.main]]
    name = "展示"
    weight = 20
    identifier = "demos"
    url = "category/demos/"

  [[languages.zh-tw.menu.social]]
    name = "GitHub"
    weight = 10
    identifier = "github"
    url = "https://github.com/shaform/hugo-theme-den/"

  [[languages.zh-tw.menu.links]]
    name = "關於我"
    weight = 10
    identifier = "about-me"
    url = "https://github.com/shaform/hugo-theme-den/"

```

一般来说可以直接将`theme\exampleSite`里面的所有文件都复制到根目录，快速查看网站的效果。

## 4.发布文章

使用命令

```bash
hugo new posts\first-post.md
```

来发布你的第一篇文章吧。

注意文章开头的draft要设置成false才可以渲染文章。

![ID885.png](https://i.328888.xyz/2023/02/01/ID885.png)

## 5. 在本地启动你的网站

使用以下命令启动网站:

```bash
hugo serve
```

或者

```bash
hugo server
```

去查看 `http://localhost:1313`.

![8Tiqy.png](https://i.328888.xyz/2023/02/01/8Tiqy.png)

# 在Git Pages上面发布你的网站

（填个小坑，这几天补上）
