---
title: "bash"
date: 2019-03-25T09:03:04+02:00
draft: false
---

### Move files and subdirectories using mv

```bash
mv /path/source_directory/* /path/target_directory/
```

---

### Unzip ZIP file into another directory

```bash
unzip -o filename.zip -d /path/target_directory/
```

---

### Recover deleted text data/files

```bash
grep -a -C 200 'Unique string in text file' /dev/sdX > /mnt/c/Users/Welington/Downloads/recovered.txt
```

This will search partition `sdX` for data containing the unique string specified and write it to the file `recovered.txt`. Option `-C 200` will include 200 lines before and after each match, while option `-B 200` will only include the 200 before it.

---

### Delete all files and directories except some

```bash
rm -rf !(*.png|.git|.gitignore|CNAME|.|..)
```

This deletes all files and directories in the path where it is executed save for the ones that match the identifiers enclosed in the parentheses. For this command to work though, you must enable **Extended Pattern Matching** first running `shopt -s extglob`
