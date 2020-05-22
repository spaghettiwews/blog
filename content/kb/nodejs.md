---
title: "Node.js"
date: 2020-05-23T01:08:02+02:00
draft: false
---

### Diffence between tilde(~) and caret(^) in package.json?

A tilde in front of the version number means that `npm` or `yarn` will update to, or use future patch versions of that library. Both the major and minor versions will not be changed. e.g. `~1.2.4` means use versions 1.2.4 < 1.3.0

A caret in front of the version number means that `npm` or `yarn` will update to, or use future minor/patch versions of that library. The only number that will not be changed is the major version e.g. `^1.2.4` means use versions 1.2.4 < 2.0.0

reference: https://stackoverflow.com/questions/22343224/whats-the-difference-between-tilde-and-caret-in-package-json