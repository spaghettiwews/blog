---
title: "Fixing Doom Eternal's \"No Physical Devices Found\" Error. Well, not really."
date: 2021-12-16T23:14:59+02:00
subtitle: "What do you mean no GFX cards found? I have two!"
featured: false
draft: false
---

!["doom, where's my gpu"](/images/dude-wheres-my-gpu-what-does-mine-say-dude-wheres-my-gpu.png)

I'm keep running into this issue where my PC throws this error at me whenever I try and play Doom Eternal. It's annoying and the only solution I have found on the innernet that works is to disable the iGPU, start the game, and then re-enable it afterwards. This is obviously not ideal but whatever... 

Because I'm lazy and hate clicking around the start menu to navigate to the device manager I googled to see if there's a way to to restart the iGPU from the terminal. As it turns out, there is.

Enter [PnPUtil](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/pnputil).

> #### PnPUtil (PnPUtil.exe) is a command line tool that lets an administrator perform actions on driver packages. Some examples include:
> - Adding a driver package to the driver store.
> - Installing a driver package on the computer.
> - Deleting a driver package from the driver store.
> - Enumerating the driver packages that are currently in the driver store. 

Here's the command you run to enumerate devices of class: Display (i.e. the graphics devices) as well as its output. What we need here is the `Instance ID` of the iGPU, the AMD Radeon one.

```cmd
PS C:\WINDOWS\system32> pnputil /enum-devices /class Display
Microsoft PnP Utility

Instance ID:                PCI\VEN_10DE&DEV_1F12&SUBSYS_1F111043&REV_A1\4&1293019d&0&0009
Device Description:         NVIDIA GeForce RTX 2060 with Max-Q Design
Class Name:                 Display
Class GUID:                 {4d36e968-e325-11ce-bfc1-08002be10318}
Manufacturer Name:          NVIDIA
Status:                     Started
Driver Name:                oem89.inf

Instance ID:                PCI\VEN_1002&DEV_1636&SUBSYS_1F111043&REV_C5\4&38c8dac&0&0041
Device Description:         AMD Radeon(TM) Graphics
Class Name:                 Display
Class GUID:                 {4d36e968-e325-11ce-bfc1-08002be10318}
Manufacturer Name:          Advanced Micro Devices, Inc.
Status:                     Started
Driver Name:                oem2.inf
Extension Driver Names:     oem12.inf
```

With the `Instance ID` we can write a simple one-line Windows batch file that we'll run whenever we get this stupid error. This is obviously not a permanent fix but it at least allows us to start the game.

```cmd
pnputil /restart-device "PCI\VEN_1002&DEV_1636&SUBSYS_1F111043&REV_C5\4&38c8dac&0&0041"
```