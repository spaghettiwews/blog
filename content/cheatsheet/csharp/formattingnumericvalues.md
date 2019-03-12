---
title: "Formatting Numeric Values"
date: 2019-03-10T18:04:04+02:00
draft: true
---
**Format Item Syntax:** {index[,alignment] [:format string]}

*index* – Specifies element in list of values to which format is applied.<br>
*alignment* – Indicates minimum width (in characters) to display value.<br>
*format string* – Contains the code that specifies the format of the displayed value.


```csharp
// Example: 
String.Format("Price is: {0:C2}", 49.95); // output: Price is: $ 49.95
```
Format Specifier|Pattern|Value|Description
---|---|---|---
C or c|{0:C2}, 1388.55|$ 1388.55|Currency.
D or d|{0:D5}, 45|00045|Must be integer value.
E or e|{0,9:E2}, 1388.55|1.39+E003|Must be floating point.
F or f|{0,9:F2}, 1388.55|1388.55|Fixed Point representation.
N or n|{0,9:N1}, 1388.55|1,388.6|Insert commas
P or p|{0,9:P3}, .7865|78.650%|Converts to percent.
R or r|{0,9:R}, 3.14159|3.14159|Retains all decimal places.
X or x|{0,9:X4}, 31|001f|Converts to Hex