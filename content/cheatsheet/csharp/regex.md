---
title: "Using the System.Text.RegularExpressions.Regex class"
date: 2019-03-12T18:52:23+02:00
draft: true
---
```csharp
string zipexp = @"\d{5}((-|\s)?\d{4})?$";
string addr = "W.44th St, New York, NY 10017-0233";
Match m = Regex.Match(addr,zipexp); // Static method
Regex zipRegex = new Regex(zipexp);
m = zipRegex.Match(addr); // Use Regex Object
Console.WriteLine(m.Value); // 10017-0233
```
Pattern |Description|Example
---|---|---
+ |Match one or more occurrence |ab+c matches abc, abbc
* |Match zero or more occurrences |ab*c matches ac, abbc
? |Matches zero or one occurrence |ab?c matches ac, abc
\d \D |Match decimal digit or non-digit (\D) |\d\d matches 01, 55
\w \W |Match any word character or non-char |\w equals [a-zA-Z0-9_]
\s \S |Match whitespace or non-whitespace |\d*\s\d+ matches 246 98
[ ] |Match any character in set |[aeiou]n matches in, on
[^ ] |Match any character not in set |[^aeiou] matches r or 2
a \| b |Either a or b |jpg\|jpeg\|gif matches .jpg
\n \r \t |New line, carriage return, tab