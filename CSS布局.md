---
title: CSS布局
date: 2018-04-14 13:58:56
tags:
---

1、左右布局：两列布局，可以使用浮动属性来达到左右布局的效果，仅需设置float:left和float:right就可以布局页面。
html代码:

```
<body>
    <div class="container">
      <div class="f1"></div>
      <div class="f2">![图片描述][1]</div>
</div>
```
css代码：
```
.f1 {
  width: 300px;
  height: 100%;
  background: red;
  float: left;
}     
.f2 {
  width: 700px;
  height: 100%;
  background: blue;
  float: right;
}
```
效果图：
![%KWRLU42(E0%1KO$M@BC(C0.png](https://upload-images.jianshu.io/upload_images/11649292-35227ef919a4d46d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



用定位布局：父元素设置为position:relative;f1设置固定宽度，设定为绝对定位position:absolute。f2设置为相对定位position:relative。f2设置左边距，边距值margin-left刚好为左侧栏的宽度。
css代码：

```
.container {
  width: 1000px;
  height: 700px;
  margin: 0 auto;
  position: relative;
}
.container .f1 {
  width: 300px;  
  height: 100%;
  position: absolute;
  background: rgb(230, 21, 21);
}
.container .f2 {
  height: 100%;
  margin-left: 300px; 
  background: #333;
  position: relative;
}

```
效果图：

![image.png](https://upload-images.jianshu.io/upload_images/11649292-7d82840e583e32f9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


2、左中右布局：左侧中间右侧设置固定宽度，并且分别设置左右浮动。
css代码:
```
.f1 {
  width: 300px;
  height: 500px;
  background: #6e0bdf;
  float: left;
}      
f2 {
  width: 300px;
  height: 500px;
  background: #dd9c11;
  float: left;
}
```
效果图：

![ZB_BC7[QJULF2ZJWC9]KP8B.png](https://upload-images.jianshu.io/upload_images/11649292-752199ede03d74c0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


绝对定位：
css代码：

```
.container {
  width: 1000px;
  height: 700px;
  margin: 0 auto;
  position: relative;
}
.f1 {
  width: 300px;
  height: 500px;
  position: absolute;
  background: #f4f74e;
  left: 0;
}
.f2 {
  height: 500px;
  position: absolute;
  background: #e01c95;
  left: 300px;
  right: 300px;
}
.f3 {
  width: 300px;
  height: 500px;
  position: absolute;
  background: #e76209;
  right: 0;
}

```
效果图：


![image.png](https://upload-images.jianshu.io/upload_images/11649292-74fe7b6b761a3f5b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


3、水平居中
对于内联元素：直接构建”text-align:center“样式。

``` <div style="text-align:center;border-style:solid>
        <span style="border-style:solid"></span>
    </div>

```
效果图：

![image.png](https://upload-images.jianshu.io/upload_images/11649292-0760045d46c1ef26.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


对于块级元素：margin:0 auto可以实现容器居中，加上text-align:center可以让文本居中。

```
<p>我在努力学习前端</p>

p{
  border-style:solid;
  text-align:center;
  margin:0 auto;
  width:500px;
}
```
效果图：

![image.png](https://upload-images.jianshu.io/upload_images/11649292-979aa28bd2db3fdf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


多个块级元素：将元素的display属性设置为inline-block，并且把父元素的text-align属性设置为center。

```
 <div class="container">
    <ul>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
    </ul>
    
    
 .container{
    text-align:center;
    border-style:solid;
}
.container ul{
    list-style:none;
    padding:0;
    display:inline;
}
.container li{
    margin-right:8px;
    border-style: solid;
    display:inline;
}
    
```
效果图：

![image.png](https://upload-images.jianshu.io/upload_images/11649292-546011c1c5b81075.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


4、垂直居中
内边距：给父元素设置相等的上下内边距，则子元素自然是垂直居中的，父元素不能设置高度的，要让它自动被填充。

```
<div class="box">
    <div class="child">你好，我现在正在学习CSS布局技巧</div>
</div>

css:
.box {
    width: 300px;
    background: #ddd;
    padding: 100px 0;
}
.child {
    width: 200px;
    height: 100px;
    background: #F7A750;
    line-height: 50px;
}
```
效果图：

![image.png](https://upload-images.jianshu.io/upload_images/11649292-ca98ff01e67ca651.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


用flex进行居中

```
<div class="box">
    <div class="child">
        你好，我现在正在学习CSS布局
    </div>
</div>

.box {
    width: 300px;
    height: 300px;
    background: #ddd;
    display: flex;
    align-items: center;
}
.child {
    width: 300px;
    height: 100px;
    background: #8194AA;
    line-height: 100px;
}
```
效果图:
![image.png](https://upload-images.jianshu.io/upload_images/11649292-3d9b7d0c1a5be5b5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


绝对定位和margin: auto进行居中

```
<div class="box">
    <div class="child">你好，我现在正在学习CSS布局)</div>
</div>
```

```
.box {
    width: 300px;
    height: 300px;
    background: #ddd;
    position: relative;
}
.child {
    width: 200px;
    height: 100px;
    background: #A1CCFE;
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
    line-height: 100px;
}
```
图片效果
![image.png](https://upload-images.jianshu.io/upload_images/11649292-9a6eaad4728559d3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5、其他技巧
CSS实现简单的瀑布流
```
<div class="class1">
    <ul>
        <li><img src="logo1.jpg"></li>
        <li><img src="logo1.jpg"></li>
        <li><img src="logo1.jpg"></li>
    </ul>
    <ul>
        <li><img src="logo1.jpg"></li>
        <li><img src="logo1.jpg"></li>
        <li><img src="logo1.jpg"></li>
    </ul>
    <ul>
        <li><img src="logo1.jpg"></li>
        <li><img src="logo1.jpg"></li>
        <li><img src="logo1.jpg"></li>
    </ul>
</div>
```
```
   *{
            margin: 0px;
            padding:0px;
        }

        li{
            list-style: none;
        }

        .class1{
            width: 1000px;
            height: auto;
            margin: 20px auto;
        }
        ul{
            width: 300px;
            float:left;
        }
        img{
            width: 150px;
        }

```
效果图:
![image.png](https://upload-images.jianshu.io/upload_images/11649292-00ddda310513829e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)