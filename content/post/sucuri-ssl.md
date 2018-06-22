---
title: "Using a reverse proxy to provide ssl to a wordpress site hosted on a non-https server"
date: 2018-06-22T22:10:28+02:00
draft: false
---

### **what's a reverse proxy? well, in this context, wikipedia has this to say:**

>In computer networks, a reverse proxy is a type of proxy server that retrieves resources on behalf of a client from one or more servers.
>
>In the case of secure websites, a web server may not perform SSL encryption itself, but instead offloads the task to a reverse proxy that may be equipped with SSL acceleration hardware.
> &mdash; [https://en.wikipedia.org/wiki/Reverse_proxy](https://en.wikipedia.org/wiki/Reverse_proxy)

### **what's sucuri?**

> it's an example of the above. in oversimplified terms i guess. maybe.
> &mdash; me

### **a guide (read: a reminder for myself)**

1. the A records for both domain names **example.com** and **www.example.com** need to point to the IP address provided by sucuri in order for them to be able to generate and install a valid LE cert for the domain
2. once that is done, select Partial HTTPS under the HTTPS/SSL tab. Partial SSL because sucuri is reverse proxying to a non-https server. Full HTTPS is for when the hosting server already has an SSL cert installed - then it's an https-to-https connection all the way.
3. Next up include the code below in your **wp-config.php** file to prevent the site from going into an infinite redirect loop. Read up more on this here: [https://codex.wordpress.org/Administration_Over_SSL](https://codex.wordpress.org/Administration_Over_SSL)

```
/* Handle HTTPS Protocol */

if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')

	$_SERVER['HTTPS']='on';
```
  
4. change site and home url protocols to https 
5. lastly, your site will most likely still have some resources being loaded over insecure http. hunt these down and deeeestroy them. just kidding, just search & replace absolute urls with relatives ones where you can. if some http resources still remain after that, figure it out son. 



### **did you win?**
yes? good! now it's time feel good about yourself for completing this simple task by watching this [video](https://www.youtube.com/watch?v=JrO46CJd9ns)  ✌️

### **more reading**

1. [Troubleshooting Mixed Content Warnings with HTTPS - https://blog.sucuri.net/2016/04/troubleshooting-mixed-content-warnings-https.html](https://blog.sucuri.net/2016/04/troubleshooting-mixed-content-warnings-https.html)
2. [How to Install an SSL Certificate - https://sucuri.net/guides/how-to-install-ssl-certificate](https://sucuri.net/guides/how-to-install-ssl-certificate)

