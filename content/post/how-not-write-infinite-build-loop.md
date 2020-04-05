---
title: "How not to write an CI/CD build pipeline"
date: 2020-04-03T09:22:11+02:00
subtitle: "Not making it an infinite loop should probably be a bare minimum requirement."
featured: false
draft: false
---

If your build workflow/pipeline triggers on a `push` or `merge` to `master` and it needs push some changes back upstream, say for Github Pages or something, make sure it does so to a seperate branch or a submodule.

It seems obvious but I just wrote a workflow that did the complete opposite of that and got this Git error whenever I tried to push a change to the repo. _The build was obviously completing its run, committing new changes to `master` before I could do a git pull, and push my local modifications_. I must admit, I was rather confused for a moment before realising my mistake.

```bash
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:spaghettiwews/trailers.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

I ended up with 200+ commits in the space of 45 minutes (_after unknowingly kicking off my infinite loop, I had gone off to do other things, chuffed that the workflow was now working as expected_).

Luckily, this was on the free Github Actions plan. Can you imagine doing something like this on a paid plan, on a Friday, not realising it and knocking off for the weekend. 😂

**NB:** To end the loop I had to edit the workflow file directly on Github, temporarily commenting out the part that pushing changes to the repo.

![so much for a clean commit history](/images/Screenshot_2020-04-03-spaghettiwews-trailers.png)
