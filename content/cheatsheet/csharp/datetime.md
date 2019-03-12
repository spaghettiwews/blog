---
title: "DateTime and TimeSpan"
date: 2019-03-10T12:32:31+02:00
draft: true
---

**DateTime Constructor**
```csharp
DateTime(yr, mo, day);
DateTime(yr, mo, day, hr, min, sec);

DateTime bday = new DateTime(1964,12,20,11,2,0);
DateTime newyr= DateTime.Parse("1/1/2005");
DateTime currdt = DateTime.Now;

// also AddHours, AddMonths, AddYears
DateTime tomorrow = currdt.AddDays(1);
TimeSpan diff = currdt.Subtract(bday);

// 14795 days from 12/20/64 to 6/24/05
Console.WriteLine("{0}", diff.Days);

// TimeSpan(hrs, min, sec)
TimeSpan ts = new TimeSpan(6, 30, 10);

// also FromMinutes, FromHours, FromDays
TimeSpan ts = TimeSpan.FromSeconds(120);
TimeSpan ts = ts2 – ts1; // +,-,>,<,==, !=
```