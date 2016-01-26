---
layout: post
title: javascript 中與 jQuery selector 相同的 DOM 選擇器
author: marc
---


一般在使用 jQuery 可以利用 [jQuery selectors](http://www.w3schools.com/jquery/jquery_ref_selectors.asp "jQuery selectors") 選取網頁中的 elements。

其實在 pure javascript 中也有類似的 implementation 叫做 [querySelector() Method](http://www.w3schools.com/jsref/met_document_queryselector.asp "querySelector()")

### 例一：選取 document 中有 class="example" 的物件
{% highlight js %}
// in jQuery
$(".example");

// in javascript
document.querySelectorAll(".example");
{% endhighlight %}


### 例二：取得所以被選取的 checkbox (checked=true)

{% highlight js %}
// in jQuery
$("input:checkbox:checked");

// in javascript
document.querySelectorAll('input[type="checkbox"]:checked');
{% endhighlight %}
