---
layout: post
title: "取得永久Facebook Page Token的方法"
author: ww
---


### Step 1:
開好Facebook app後，先取一般效期2小時的short-lived token

### Step 2:
用short-lived token去拿long-lived token，方法是將相關資訊套入下方網址：
{% highlight html %}
https://graph.facebook.com/oauth/access_token?
  client_id=APP_ID&
  client_secret=APP_SECRET&
  grant_type=fb_exchange_token&
  fb_exchange_token=SHORTLIVED_ACCESS_TOKEN
{% endhighlight %}
請將上面`APP_ID`、`APP_SECRET`、`SHORTLIVED_ACCESS_TOKEN`替換成你自己的內容，然後在瀏覽器開啟這個網址，就會回傳類似：
{% highlight html %}
access_token=xxxx...
{% endhighlight %}
其中access_token後的就是你的long-lived token

### Step 3:
接下來用long-lived token去query`/me/accounts`就會拿到所有你所管理的粉絲頁的資料，其中的`access_token`就是永久的token。

---
當然也有一些狀況會造成token失效：

- 更改密碼之後，或其他影響到帳號安全性的行為發生之後
- 粉絲頁或帳號因為檢舉等原因被臉書強制登出之後
- 臉書認為你的APP使用出現濫用的狀況之後


