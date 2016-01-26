---
layout: post
title: jQuery取得陣列input的數值
author: ww
---


假如我們有如下的表單欄位：
{% highlight html %}
<input type="text" name="text[]">
<input type="text" name="text[]">
<input type="text" name="text[]">
{% endhighlight %}


就可以用下面的方式一句來取得所有input的value<br>
這邊以coffeeScript為例：
{% highlight js %}
array = $('input[name="text[]"').map(-> $(this).val()).get()
{% endhighlight %}

最終的輸出為一個array
