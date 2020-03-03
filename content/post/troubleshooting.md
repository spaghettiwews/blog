---
title: "Troubleshooting"
date: 2020-02-28T18:21:14+02:00
draft: false
---

This past week I had to troubleshoot a problem with a 4 year old WordPress/CiviCRM application that had largely gone untouched since its development. Recently, it had stopped rendering the frontend and was throwing an unhelpful error message that contained what would turn out to be misleading information later, "`Sorry but we are not able to provide this at the moment. Please make sure the folder is writable`".

Ummm ohkay?? Which folder?? Also, annoyingly, the app would work just fine when set up on the development server. At the time this made me think that the problem was due to some difference in the two environments (dev and prod) but then I largely dumped that idea and focused on the error message that the app was throwing. So, after spending almost two days combing through every setting (*there were plenty of settings*) and tinkering with various folder permissions my frustration was palpable. Enabling error reporting hadn't helped -  the stack traces included zero information that pointed me in the right direction.

Having exhausted all options (*I hadn't really*) I then looked to the Cpanel account PHP logs. Thus far I had focused my attention on the application specific logs - which hadn't turned up anything of use. In there I found thousands of warnings about functions that had been disabled for security reasons. With my initial gut feeling that the environments were at the center of this problem strengthened I skyped the error log to the sysadmin and mosied on over to his office to explain my suspicions. 

I needed him to confirm whether or not the site had been migrated onto a new server/environment at some point. An environment that possibly had those functions disabled. He didn't remember, so he launched his terminal and navigated to the path that contained that PHP error log and typed the following:

```bash
tail -F domain_tld.php.error.log
```
He opened the broken site in his browser and just like that, a single line was printed on his screen.

```bash
[28-Feb-2020 12:37:30 Africa/Harare] PHP Warning:  parse_ini_file() has been disabled for security reasons in /home/xxxxxxxxx/public_html/wp-content/plugins/civicrm/civicrm/packages/IDS/Init.php on line 92
```
There it was, in just 2 minutes he'd figured out what had taken me 2 days to arrive at. All with one simple command. Sigh...

It turned out that the site had been migrated after all, onto a new server with lot more restrictions that the one it had originally been hosted on. Enabling the function resolved the error. `parse_ini_file()` was being used to read in a configuration file that contained a folder path the application needed to write to. Without that path the app just threw the error, "`Please make sure folder writable.`" 🤦🏾‍♂️

Maybe better error messages might have saved me all the trouble. Maybe. But since I have no control over what error messages developers choose to include in their apps I decided that a better lesson to take away from this was that better tools in my arsenal would have saved and served me just as well. It's time to learn Unix tools properly, beyond just `ls` and `git add`. And I think I found just the right course for that: [Unix Tools: Data, Software and Production Engineering](https://www.edx.org/course/unix-tools-data-software-and-production-engineering)
