---
title: canvas画板
date: 2018-05-12 10:11:28
tags:
---

## 一.canvas标签

**1.**canvas标签与img标签相似，但是canvas标签是一个闭合标签，并且没有src alt属性
**2.**canvas标签有两个属性，width，height。我们在页面上用canvas绘制一个画布时，应用width，height属性设置大小，如果用css设置，绘制图像时可能会出现扭曲。
**3.**渲染上下文 context
canvas起初是空白的。为了展示，首先脚本需要找到渲染上下文，然后在它的上面绘制。
getContext()方法可以获取到上下文context.

## 二.制作画板

画板功能：可以绘制不同颜色和粗细的线条，画板上有橡皮擦功能，一键清除功能，下载功能。

### 1.首先我们需要绘制一个自适应屏幕宽度的画布。

```
 function wResize() {
        var pageWidth = document.documentElement.clientWidth
        var pageHeight = document.documentElement.clientHeight

        canvas.width = pageWidth
        canvas.height = pageHeight
    }
```

### 2.当用户在画板上绘画时有三种状态，鼠标点击态，鼠标移动态，鼠标离开态。

我们可以用mousedown,mousemove ,mouseup来监听三种状态。

**当用户点击鼠标时：**

```
  canvas.onmousedown = function (a) {
                var x = a.clientX;
                var y = a.clientY;
                using = true;//设置变量，标志开始使用画布
                if (eraserEnabled) {//如果标志使用橡皮擦，则清除画布内容
                    context.clearRect(x, y, 20, 20);
                }
                else {否则记录当前鼠标坐标
                    lastPoint = {x: x, y: y}
                }
            }
```

**当用户鼠标移动时：**

```
  canvas.onmousemove = function (a) {
                var x = a.clientX;
                var y = a.clientY;
                if (!using) {return}//判断是否使用画板
                if (eraserEnabled) {//如果标志使用橡皮擦，则清除画布内容
                    context.clearRect(x, y, 20, 20);
                }
                else{//如果没有使用橡皮擦
                    var newPoint = {"x": x, "y": y};//记录鼠标移动到的新坐标
                    drawLine(lastPoint.x, lastPoint.y, newPoint.x, newPoint.y) //绘制线条
                    lastPoint = newPoint;//将当前坐标作为下次移动的首坐标
                }
            }
```

**当鼠标离开时：**

```
  canvas.onmouseup = function (a) {
                using = false;//设置变量，标志不使用画板
            }
```

### 3.绘制直线

```
function drawLine(x1, y1, x2, y2) {
    context.beginPath();//开始移动笔触，路径开始
    context.moveTo(x1, y1);//其实坐标
    context.lineWidth = lineWidth ;//默认线条粗细
    context.lineTo(x2, y2);//结束坐标
    context.stroke();
    context.closePath();//结束笔触，路径结束
}
```

stroke()：通过线条来绘制图形轮廓。
fill()：通过填充路径的内容区域生成实心的图形

### 4.画笔功能

```
pen.onclick = function(){
    eraserEnabled = false;//设置变量，标志不使用橡皮擦
    pen.classList.add('active');//设置画板上画笔按钮的样式变化
    eraser.classList.remove('active');//设置画板上橡皮擦按钮的样式变化

}
```

### 5.橡皮擦功能

```
eraser.onclick = function(){
    eraserEnabled = true;//标志使用橡皮擦
    eraser.classList.add('active');//设置画板上橡皮擦按钮的样式变化
    pen.classList.remove('active');//设置画板上画笔按钮的样式变化
}
```

### 6.一键清除功能

```
clear.onclick = function(){
    context.clearRect(0,0,canvas.width,canvas.height);
}
```

这里使用了clearRect(x, y, width, height)方法，清除指定矩形区域，让清除部分完全透明。x,y坐标为其实坐标，width, height为清除矩形区域的大小。

### 7.一键下载功能

```
download.onclick = function(){
    var url = canvas.toDataURL('image/png');
    var a = document.createElement('a');
    document.body.appendChild(a);
    a.href = url;
    a.download = 'context';
    a.click();
}
```

canvas.toDataURL('image/png');该方法返回一个png格式的图片展示的url，当用户点击画板上的下载按钮，在html中插入一个a标签，a.download指向画布的上下文,download 属性规定被下载的超链接目标。

## 三.手机适配的画板

### 1.添加meta标签:

因为浏览器初始会将页面现在手机端显示时进行缩放，因此我们可以在meta标签中设置meta viewport属性，告诉浏览器不将页面进行缩放，页面宽度=用户设备屏幕宽度

```
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
```

### 2.移动端监听鼠标事件的方法与pc端不同

**当鼠标点击时用ontouchstart方法监听：**

```
canvas.ontouchstart = function(a){

            var x = a.touches[0].clientX;
            var y =a.touches[0].clientY;
            using = true;
            if (eraserEnabled) {
                context.clearRect(x, y, 20, 20);
            }
            else {
                lastPoint = {x: x, y: y}
            }
        }
```

**当鼠标移动是用ontouchmove方法监听：**

```
 canvas.ontouchmove = function(a){

            var x = a.touches[0].clientX;
            var y = a.touches[0].clientY;
            if (!using) {return}
            if (eraserEnabled) {
                context.clearRect(x, y, 20, 20);
            }
            else{

                var newPoint = {"x": x, "y": y};
                drawLine(lastPoint.x, lastPoint.y, newPoint.x, newPoint.y)
                lastPoint = newPoint;

            }
        }
```

**当鼠标离开时用ontouchend方法监听：**

```
 canvas.ontouchhend = function(a){

            using = false;
        }
```

