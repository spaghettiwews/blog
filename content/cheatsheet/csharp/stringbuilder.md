---
title: "System.Text.StringBuilder"
date: 2019-03-10T12:03:26+02:00
draft: false
---

**Constructor**
```csharp
StringBuilder sb = new StringBuilder();
StringBuilder sb = new StringBuilder(mystring);
StringBuilder sb = new StringBuilder(mystring,capacity);
```
*mystring* – Initial value of StringBuilder object<br/>
*capacity* – Initial size (characters) of buffer.

**Using StringBuilderMembers**
```csharp
decimal bmi = 22.2M;
int wt = 168;
StringBuilder sb = new StringBuilder("My weight is ");
sb = sb.Append(wt); // can append number
sb = sb.Append(" and my bmi is ").Append(bmi);

// my weight is 168 and my bmi is 22.2
sb = sb.Replace("22.2","22.4");
string s = sb.ToString();

// Clear and set to new value
sb.Length = 0;
sb.Append("Xanadu");
```