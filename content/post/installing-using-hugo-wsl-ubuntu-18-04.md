---
title: "How to install/use Hugo in WSL (Ubuntu 18.04)"
date: 2020-02-10T14:20:47+02:00
draft: false
hero: "/images/joshua-hoehne-zs5ybmIY0fA-unsplash.jpg"
heroCaption: "An old, rusty Ford 100. My dad had one of these when we were growing up. He still does I think."
---

It's been a while since I wrote on this blog and today when I `git clone`d the blog repo and attempted to update it, I quickly realised that I could not for the life of me remember all of the commands I needed to run in order to download the theme submodule and deploy the site after writing a new post.

So, for my future self and posterity's sake in this post I will be documenting the commands I need for installing Hugo, downloading the site and its theme(s), creating a new post and deploying it:

## Installing Hugo

I like installing Hugo using the tarball/binary method as it does not require me to install any arcane package managers beforehand.

The following commands run in succession will download the latest tarball version _(at the time of writing)_ of Hugo to my `$HOME` directory, and extract the binary therein into my `/usr/local/bin/` directory. The last command deletes the tarball from your `$HOME` directory.

```bash
cd ~
wget https://github.com/gohugoio/hugo/releases/download/v0.64.1/hugo_0.64.1_Linux-64bit.tar.gz
sudo tar -C /usr/local/bin -xzf hugo_$VERSION_$OS-$ARCH.tar.gz
cd ~ && rm hugo_0.64.1_Linux-64bit.tar.gz
```

## Downloading the site and its theme

I setup my site's theme as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) because it's easier to manage that way I think. Once I've cloned my site's git repo I need to run `git submodule update` in order to download the theme from its repository into my `/themes` folder. The `--recursive` flag finds any other submodules within my repo and downloads them as well... recursively.

```bash
git submodule update --init --recursive
```

## Usage

Once all of the above is done, I can then run `hugo server --ignoreCache --disableFastRender` from the site root to serve the site on the default URL: http://localhost:1313.

```bash
hugo server --ignoreCache --disableFastRender
```

To create a new blog post I run `hugo new post/title-of-post.md`, edit the newly created .md file in `/content/post/`, commit and push the changes. That's it.

The build and deployment step is currently handled by a CircleCI workflow that compiles the source to HTML/CSS/JS and deploys **that** to another Github Pages repo. I will document that part in another post. Maybe.
