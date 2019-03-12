---
title: "Using the C# Compiler at the Command Line"
date: 2019-03-12T19:05:54+02:00
draft: true
---
```bash
C:\>csc /t:library /out:reslib.dll mysource.cs
    csc /t:winexe /r:ctls1.dll /r:ctls2.dll winapp.cs
    csc /keyfile:strongkey.snk secure.cs
```
