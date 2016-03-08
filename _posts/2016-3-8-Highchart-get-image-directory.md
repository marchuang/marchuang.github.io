---
layout: post
title: "Highchart 直接取得圖片檔"
author: marc
---


### Step 1:
Include jQuery and create an image container
{% highlight html %}
<div id="imgContainer"></div>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
{% endhighlight %}

### Step 2:
Declare a highchart option object
{% highlight javascript %}
var options = {
    exporting: {
    url: 'http://export.highcharts.com/'
    },
	title: {
	text: 'Monthly Average Temperature',
	x: -20 //center
	},
	subtitle: {
	text: 'Source: WorldClimate.com',
	x: -20
	},
	xAxis: {
	categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
	'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
	]
	},
	yAxis: {
	title: {
	  text: 'Temperature (°C)'
	},
	plotLines: [{
	  value: 0,
	  width: 1,
	  color: '#808080'
	}]
	},
	tooltip: {
	valueSuffix: '°C'
	},
	legend: {
	layout: 'vertical',
	align: 'right',
	verticalAlign: 'middle',
	borderWidth: 0
	},
	series: [{
	name: 'Tokyo',
	data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
	}, {
	name: 'New York',
	data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
	}, {
	name: 'Berlin',
	data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
	}, {
	name: 'London',
	data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
	}]
};
{% endhighlight %}

### Step 3:
Create an AJAX object and contain highchart object into it
{% highlight javascript %}
var obj = {},
exportUrl = options.exporting.url;
obj.options = JSON.stringify(options);
obj.type = 'image/png';
obj.async = true;
{% endhighlight %}

### Step 4:
Execute AJAX when web page is ready
{% highlight javascript %}
$(document).ready(function () {
    $.ajax({
        type: 'post',
        url: exportUrl,
        data: obj,
        success: function (data) {
            var imgContainer = $("#imgContainer");
            $('<img>').attr('src', exportUrl + data).appendTo(imgContainer);
            $('<a>or Download Here</a>').attr('href', exportUrl + data).appendTo(imgContainer);

        }
    });
});
{% endhighlight %}
