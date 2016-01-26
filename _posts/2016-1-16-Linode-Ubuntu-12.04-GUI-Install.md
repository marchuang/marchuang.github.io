---
layout: post
title: Linode Ubuntu 12.04 GUI Install
author: marc
---


### Using VNC to Operate a Desktop on Ubuntu 12.04

### Step 1
Using SSH Login into your server

### Step 2
{% highlight sh %}
sudo apt-get update
sudo apt-get upgrade
{% endhighlight %}

### Step 3 install ubuntu default desktop
{% highlight sh %}
sudo apt-get install ubuntu-desktop
{% endhighlight %}

### Step 4 install VNC server
{% highlight sh %}
sudo apt-get install vnc4server
{% endhighlight %}

### Step 5 Insert new rule into ip tables file
{% highlight sh %}
vim /etc/iptables.firewall.rules

# insert the following line to iptables.firewall.rules and save file
-A INPUT -m state --state NEW -m tcp -p tcp --dport 5901 -j ACCEPT
{% endhighlight %}

### Step 6 Add rule to ip tables
{% highlight sh %}
sudo iptables-restore < /etc/iptables.firewall.rules
{% endhighlight %}

### Step 7 Start VNC server from Mac OS X
{% highlight sh %}
ssh -L 5901:127.0.0.1:5901 user@(ip|doamin)
vncserver :1
{% endhighlight %}

### Step 8 Connecting to VNC from Mac OS X
Download and install [RealVNC Viewer ](http://www.realvnc.com/download/viewer/)

### Step 9 Login through VNC
Using `localhost:1` or `localhost::5901` (replace localhost to your server ip)

![image](https://d2mxuefqeaa7sj.cloudfront.net/s_1503B160B655F9A8BC0E173A0553541DB77E110D4077144DA7D711B9CF29A939_1452914534996_1657-vnc-3-2.png)

### Configuration VNC
**Turn off**
{% highlight sh %}
vncserver -kill :1
{% endhighlight %}

**User interface setting**
{% highlight sh %}
Vim ~/.vnc/xstartup
{% endhighlight %}

Replace line `x-window-manager &` to  `gnome-session &`
