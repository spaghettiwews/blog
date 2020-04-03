---
title: "How not to write an CI/CD build pipeline"
date: 2020-04-03T09:22:11+02:00
subtitle: "Not making it an infinite loop seems reasonable enough."
featured: false
draft: false
---

If your build workflow/pipeline triggers on a `push` or `merge` to `master` and it needs push some changes back upstream, say for Github Pages or something, make sure it does so to a seperate branch or a submodule. That's it.

Now, it seems obvious in hindsight but imagine my surprise when I tried to push a change and kept getting the error that there were changes on remote that I needed to pull - even after I'd pulled said changes (_the build was completing its run before I could push thus introducing new changes_).

```bash
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:spaghettiwews/trailers.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

After kicking off the domino that set all this in motion I'd gone off to do other things, chuffed that the workflow was now working as expected. I ended up with 200+ commits in the space of 45 minutes. Luckily, this was on the free Github Actions plan. Can you imagine doing something like this on a paid plan, on Friday, and knocking off for the weekend. 😂

Anyways, be smart. Don't be like me.

![so much for a clean commit history](/images/Screenshot_2020-04-03-spaghettiwews-trailers.png)
