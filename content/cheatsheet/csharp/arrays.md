---
title: "Arrays"
date: 2019-03-09T07:32:21+02:00
draft: true
---

**Declaration**
```csharp
int[] numArray = {1903, 1907, 1910};
int[] numArray = new int[3];
// 3 rows and 2 columns
int[ , ] nums = {{1907, 1990}, {1904, 1986}, {1910, 1980}};
```
**Array Operations**
```csharp
Array.Sort(numArray); // sort ascending

// Sort begins at element 4 and sorts 10 elements
Array.Sort(numArray, 4,10);

// Use one array as a key and sort two arrays
string[] values = {"Cary", "Gary", "Barbara"};
string[] keys = {"Grant", "Cooper", "Stanwyck"};
Array.Sort(keys, values);

// Clear elements in array (array, 1 st element, # elements)
Array.Clear(numArray, 0, numArray.Length);

// Copy elements from one array to another
Array.Copy(src, target, numelements);
```