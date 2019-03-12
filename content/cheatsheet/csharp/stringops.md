---
title: "String Operations"
date: 2019-03-09T07:44:37+02:00
draft: true
---

**Compare**
```csharp
String.Compare(stra, strb, case, ci)
```
bool case – true for case insensitive<br/>ci – new CultureInfo("en-US")<br/>returns: < 0 if `a < b`, 0 if `a = b`, 1 if `a > b`

**IndexOf**
```csharp
str.IndexOf(val, start, num)
```
val – string to search for<br/>start – where to begin in string<br>num – number of chars to search<br>returns (–1) if no match.

**LastIndexOf**

Search from end of string.

**Replace**
```csharp
newstr = oldstr.Replace("old","new");
```

**Split**
```csharp
Char[] delim = {‘ ‘, ‘,’};
string w = "Kim, Joanna Leslie"; 
// create array with three names
string[] names= w.Split(delim);
```