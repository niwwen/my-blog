---
title: HTML常用标签
date: 2018-04-10 19:23:04
tags:
---

1、<iframe>iframe 元素会创建包含另外一个文档的内联框架（即行内框架）。 标签支持 HTML 中的全局属性。
frame常见用法，设置高度和宽度：

```
<iframe src="index.html" width="200" height="200"></frame>
```
iframe 可用作链接的目标，链接的 target 属性必须引用 iframe 的 name 属性：
```
<iframe src="demo_iframe.htm" name="iframe_a"></iframe>
<p><a href="index.html" target="iframe_a">W3School.com.cn</a></p>
```
Iframe删除边框:frameborder 属性规定是否显示 iframe 周围的边框。设置属性值为 "0" 就可以移除边框：```<iframe src="demo_iframe.htm" frameborder="0"></iframe>```

2、<a>超链接 
基本结构：
```
<a href=""></a>
```
href属性链接。
title属性 当你鼠标移向超链接时显示文字：
```
<a href="http://www.baidu.com" title="点击打开"></a>
```
target属性  点击超链接网页打开方式：
新打开的网页覆盖当前网页 _self
```
<a href="http://www.baidu.com" title="百度" target="_self">baidu</a>
```
新打开的网页用新的窗口显示 _blank
```
<a href="http://www.baidu.com" title="百度" target="_blank">baidu</a>
```
rel属性 声明即将跳转的文件与当前文件的关系，这个属性对用户没有任何作用，但对于搜索引擎是友好的，搜索引擎在抓取网页时可以很清楚的知道网页中上下文结构关系
```
<a href="" rel="prev"></a> 当前文件的 上一篇
 <a href="" rel="next"></a> 当前文件的 下一篇
<a href="http://www.sohu.com" rel="prefetch">sohu</a> 文档的预加载
```

3、<form>form 元素定义 HTML 表单,跳转页面（HTTP POST 请求）。表示了文档中的一个区域，这个区域包含有交互控制元件，用来向web服务器提交信息。
这个表单会发送一个 GET 请求
```
<form action="">
<label for="GET-name">Name:</label>
<input id="GET-name" type="text" name="name">
<input type="submit" value="Save">
</form>
```

4、<input>元素用于为基于Web的表单创建交互式控件，以便接受来自用户的数据。
定义可点击的按钮：
```
<input type="button" value="点我" onclick="msg()">
```
定义密码，密码可隐藏：
```
<input type="password" name="pwd">
```
复选框允许用户在一定数量的选择中选取一个或多个选项：
```
<input type="checkbox" name="vehicle[]" value="Bike"> 我有一辆自行车<br>
<input type="checkbox" name="vehicle[]" value="Car"> 我有一辆小轿车<br>
<input type="checkbox" name="vehicle[]" value="Boat"> 我有一艘船<br>
```
定义重置按钮：
```
<input type="reset">
```

5、<button> 表示一个可点击的按钮，可以用在表单或文档其它需要使用简单标准按钮的地方。
以下代码标记一个按钮：
```
<button type="button">点我!</button>
```
在 <button> 元素内部，可以放置内容，比如文本或图像。这是该元素与使用 <input> 元素创建的按钮之间的不同之处。

6、<table> 元素表示表格数据 — 即通过二维数据表表示的信息。<table> 标签定义 HTML 表格.
一个简单的 HTML 表格：
```
<table border="1">
<tr>
<th>Month</th>
<th>Savings</th>
</tr>
<tr>
<td>January</td>
<td>$100</td>
</tr>
</table>
```

7、<br> 标签插入一个简单的换行符。<br> 标签是一个空标签，意味着它没有结束标签。

8、<dd> 标签被用来对一个描述列表中的项目/名字进行描述。<dd> 标签与 <dl> （定义一个描述列表）和 <dt> （定义项目/名字）一起使用。在 <dd> 标签内，能放置段落、换行、图片、链接、列表等等。
```
<dl>
  <dt>Coffee</dt>
    <dd>Black hot drink</dd>
  <dt>Milk</dt>
    <dd>White cold drink</dd>
</dl>
```

9、<body> 标签定义文档的主体。<body> 元素包含文档的所有内容（比如文本、超链接、图像、表格和列表等等）。
```
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>标题</title>
</head>
<body>
内容
</body>
</html>
```

10、<div> 标签定义 HTML 文档中的一个分隔区块或者一个区域部分。常用于组合块级元素，以便通过 CSS 来对这些元素进行格式化。
```
<div style="color:#0000FF">
  <h3>标题</h3>
  <p>文本</p>
</div>
```

11、<h1> - <h6> 标签被用来定义 HTML 标题。
```
<h1> 1</h1> 
<h2>2</h2> 
<h3>3</h3> 
<h4>4</h4> 
<h5>5</h5> 
<h6>6</h6>
```

12、<hr> 标签定义 HTML 页面中的主题变化（比如话题的转移），并显示为一条水平线。

13、<li> 标签定义列表项目。可用在有序列表（<ol>）、无序列表（<ul>）和菜单列表（<menu>）中。
```
<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>
```

14、<nav> 标签定义导航链接的部分。并不是所有的 HTML 文档都要使用到 <nav> 元素。<nav> 元素只是作为标注一个导航链接的区域。
```
<nav>
  <a href="/html/">HTML</a> 
  <a href="/css/">CSS</a> 
  <a href="/js/">JavaScript</a> 
</nav>
```

15、<p> 标签定义段落。

16、<style> 标签定义 HTML 文档的样式信息。
```
<head>
<meta charset="utf-8"> 
<title>1</title>
<style type="text/css">
h1 {color:red;}
p {color:blue;}
</style>
</head>
```