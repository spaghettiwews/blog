---
title: "git"
date: 2020-03-23T23:17:49+02:00
draft: false
---

### Download submodules for the first time

```bash
git submodule update --init --recursive
```

This pulls all submodules using the latest revision that the parent repo is tracking, and not the latest revision from the submodule itself.

---

### Update submodule to its latest revision/commit on origin

```bash
git submodule update --remote --merge
```

This will update the submodule to the latest version on origin and update the commit SHA hash that the parent is tracking. You will need to commit this change to persist it.

---

###
