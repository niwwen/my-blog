---
title: JS原型
date: 2018-06-05 15:16:02
tags:
---

私有 chorm firefox alert(弹框提示)prompt(用户填写)comfirm(确认)console(私有)
ECMAScript 规定全局对象叫做 global，但是浏览器把 window 作为全局对象（浏览器先存在的）
window 就是一个哈希表，有很多属性。
window 的属性就是全局变量。
这些全局变量分为两种：
一种是 ECMAScript 规定的
global.parseInt
global.parseFloat
global.Number
global.String
global.Boolean
global.Object
一种是浏览器自己加的属性

window.alert
window.prompt
window.comfirm
window.console.log
window.console.dir
window.document私有 DOM
window.document.createElement
window.document.getElementById
window.history 浏览器对象 BDM

![image.png](https://upload-images.jianshu.io/upload_images/11649292-cf60a7cfcadab0d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-c0af6b1faf32c497.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-5a439151768d6ea7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-2c78958bdfb8ccd3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-63dabb016393ae36.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-babcc8b5c7920f74.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-4f4f847292aac892.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-614528a5e3d09804.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-856b8f6f8a2fc5cd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-53dd140470ff3b8e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-4a34989d96635931.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-0d305cd697882d9b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
temp之前赋值xxx被抹杀了，之后是新的临时变量
![image.png](https://upload-images.jianshu.io/upload_images/11649292-0aa7bc318545529a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
s[0]是临时对象的0，s本身不含s[0]，他就是一串字符串
![image.png](https://upload-images.jianshu.io/upload_images/11649292-7526172090ddf1dd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Charat：获取某个索引对应的字符 
CharCodeAt：获取某个索引对应的字符对应的编码
![image.png](https://upload-images.jianshu.io/upload_images/11649292-962da48358987022.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
去掉空格符
![image.png](https://upload-images.jianshu.io/upload_images/11649292-bf9eab3d3adcde28.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
连接
![image.png](https://upload-images.jianshu.io/upload_images/11649292-ef7fa5b6e999075c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Slice:切片，下图就是切两个
![image.png](https://upload-images.jianshu.io/upload_images/11649292-e2beb32e3e5b8c29.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Replace：替换
![image.png](https://upload-images.jianshu.io/upload_images/11649292-416d1976329baa5f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
New是用来生成对象
下图中f2会被打印，因为f2是对象，一切对象的Boolean都是true
![image.png](https://upload-images.jianshu.io/upload_images/11649292-010f1a701f725121.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
创建对象，o1o2没区别但不相等，二者的stack地址不同
![image.png](https://upload-images.jianshu.io/upload_images/11649292-bba0005b20770ab2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Window属性可以省略不写window

每一个都用tostring和valueof会很占内容，所以可以共用属性
![image.png](https://upload-images.jianshu.io/upload_images/11649292-68e62b312b76c4fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-a5a43bb0caa54155.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
繁琐的做法
![image.png](https://upload-images.jianshu.io/upload_images/11649292-3239ce3ca8dbcd52.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Js做法：隐藏key ，proto
![image.png](https://upload-images.jianshu.io/upload_images/11649292-b5b12e94f34971af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-5dba7407a92e16e4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-223cd4a89296602b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-dcc3aaf007012c4d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-2354915fbee3a74c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-80810d2a5ae92ab2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
toFixed，toExp，tostring，valueof是number公用的，数字有自己的共有属性，单独写一起，object共有属性是所有类型共有属性(原型)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-1a10aaddf0692bb3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-52c741e94c18a9e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-b212480effb81348.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-3e54284f2563b68f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-21e9f5468ffcb045.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
String.prototype 是 String 的共用属性的引用（防止共用属性被垃圾回收）
s.__proto__ 是 String 的共用属性的引用（这是你在用共用属性）
![image.png](https://upload-images.jianshu.io/upload_images/11649292-7120e8e915778511.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
__proto__是对象属性，prototype是函数属性
![image.png](https://upload-images.jianshu.io/upload_images/11649292-b59cba00ede6aad8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
实际上应该是 Object.__proto__ === Function.prototype，因为 Function 是 Object 的构造函数。函数.prototype可以作为对象
![image.png](https://upload-images.jianshu.io/upload_images/11649292-23d6b0e8bb310663.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-092e85ee1e5144db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-f271828d486ac2f7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Object__proto__===null
![image.png](https://upload-images.jianshu.io/upload_images/11649292-520d805b3c9a3a0b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Number
var n = new Number(1) 创建一个 Number 对象
1 与 new Number(1) 的区别是什么？看内存图
String
var s = new String('hello') 创建一个 String 对象
'hello' 与 new String('hello') 的区别是什么？看内存图
Boolean
var b = new Boolean(true) 创建一个 Boolean 对象
true 与 new Boolean(true) 的区别是什么？看内存图
Object
var o1 = {}
var o2 = new Object()
o1 和 o2 没区别

公用的属性藏在哪
所有对象都有 toString 和 valueOf 属性，那么我们是否有必要给每个对象一个 toString 和 valueOf 呢？

明显不需要。

JS 的做法是把 toString 和 valueOf 放在一个对象里（暂且叫做公用属性组成的对象）

然后让每一个对象的 __proto__ 存储这个「公用属性组成的对象」的地址。