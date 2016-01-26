---
layout: post
title: "Ubuntu server 啟用Apache Cross-sites XHR"
author: ww
---


### Step 1:
啟用header
{% highlight sh %}
sudo ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load
{% endhighlight %}

### Step 2:
在`<Directory>`、`<Location>`、`<Files>`、`<VirtualHost>`或`.htaccess`加入以下內容
{% highlight sh %}
Header set Access-Control-Allow-Origin "*"
{% endhighlight %}

### Step 3:
{% highlight sh %}
sudo service apache2 reload
{% endhighlight %}
