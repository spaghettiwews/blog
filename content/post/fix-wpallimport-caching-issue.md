---
title: "Fixing the WP All Import caching issue with a quick hack"
date: 2020-02-14T16:06:03+02:00
draft: false
hero: ""
heroCaption: ""
---

There's an annoying caching issue I've been experiencing with WP All import, the WordPress CSV/XML plugin we use for importing products into WooCommerce from CSV/XML files.

The way the plugin works is that you give it a URL to a CSV/XML file that it needs to download on a regular basis in order to update product data etc.

{{< figure src="/images/Annotation 2020-02-14 161802.png" width="100%" caption="WP All Import 'import file location' setup dialog" attr="" >}}

The issue is that once the plugin downloads the file the first time an import runs, it caches it somewhere (or the server does?) and uses the cached version for all subsequent imports. Obviously this presents a problem because whatever updates are made to the product data in the file are never actually imported. The developers of the plugin are aware of this issue and have even suggested a solution on their [Troubleshooting Guide](http://www.wpallimport.com/documentation/troubleshooting/common-issues/):

> Issues with caching can be hard to diagnose. Often they will show themselves if you upload a new import file but WP All Import shows you an older, unrelated import file. There are other symptoms as well, but this is the most common one.<br><br>If you’re having a problem with WP All Import and use some form of server side caching, try your import on one of our testing servers. If you aren’t able to reproduce the problem on a testing server, the issue might be related to your caching configuration. We especially see these types of issues with users hosted by WP Engine and Pantheon, or when Varnish tries to cache admin pages.

I'm not hosting on with any of those companies nor do I have time to troubleshoot with the hosting team to fix this "the right way". It's 16:30, on a Friday.

After incessantly googling for an easy solution without success, the easiest one I could think of was to use a cache-busting technique that I've seen used to solve browser caching issues with assets like CSS and JS. i.e. *adding a querystring parameter with a random value to the URL of the asset.*

First we need to find the function that gets called to download the file at the URL we provide. A quick vscode search finds us the function: `get_file_curl`

```php
if ( ! function_exists('get_file_curl') ):
	function get_file_curl($url, $fullpath, $to_variable = false, $iteration = false) {
		if ( ! preg_match('%^(http|ftp)s?://%i', $url) ) return false;
		$uid = uniqid();
        $response = wp_remote_get($url."?v=".$uid);
```

...adding the parameter `?v` to the URL, with a random value `$uid` every time `get_file_curl` gets called means that the server thinks it's downloading a new file each time. Therefore, instead of reaching for the cached copy it will always download the actual updated file guaranteeing that the our products are updated with the latest data.
