---
title: "Ubuntu"
date: 2020-04-29T22:16:36+02:00
draft: false
---

### What is `/etc/apt/sources.list.d/ used for?`

The directory is used for adding new repositories without editing the central `/etc/apt/sources.list` file. Add a file with a unique name and the same format as `/etc/apt/sources.list` into this folder and it will be used by apt.

