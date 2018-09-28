---
title: JS对象
date: 2018-05-29 21:13:35
tags:
---

全局对象 window
ECMAScript 规定全局对象叫做 global，但是浏览器把 window 作为全局对象（浏览器先存在的）
window 就是一个哈希表，有很多属性。
window 的属性就是全局变量。
使用window的属性可以不加window.,
比如window.alert('警告')可以写成alert('警告')
这些全局变量分为两种：

一种是 ECMAScript 规定的：
global.parseInt
global.parseFloat
global.Number
global.String
global.Boolean
global.Object
一种是浏览器自己加的属性：
window.alert
window.prompt
window.comfirm
window.console.log
window.console.dir
window.document
window.document.createElement
window.document.getElementById

全局函数
1、Number
Number对象是数值对应的包装对象，可以作为构造函数使用，也可以作为工具函数使用。
作为构造函数时，它用于生成值为数值的对象。
```
var n = new Number(1);
typeof n // "object"
```
Number对象作为构造函数使用，返回一个值为1的对象。
var n1 = 1
var n2 = new Number(1)
内存图：![image.png](https://upload-images.jianshu.io/upload_images/11649292-0115ee3aba50fe70.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
可以通过valueOf()来获得n2的原始值1。
但是var n = new Number(1)过于繁琐不被大家使用。
而var n1=1理论上是不能oString(的，然而可以设置临时转换的对象temp完成赋值。
```
var n = 1 
var temp = new Number(n)  
temp.toString()
//将temp.toString()的值作为n.toString()的值
// 去除temp
```
```
var n = 1
n.xxx = 2
n.xxx  // undefined
```
![image.png](https://upload-images.jianshu.io/upload_images/11649292-e37cba851e766e92.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-ae406fca571b9742.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-7c8e98118498e670.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
实际上两次的temp不一样，第一次赋值2的temp被抹杀了，第二次执行是新的变量temp没有任何赋值，所以我们可以看到n.xxx//undefined
2、string
charAt方法返回指定位置的字符，参数是从0开始编号的位置。
```
var s = new String('abc');
s.charAt(1) // "b"
s.charAt(s.length - 1) // "c"
```
charCodeAt方法返回字符串指定位置的 Unicode 码点。
```
'abc'.charCodeAt(1) // 98
```
concat方法用于连接两个字符串，返回一个新字符串，不改变原字符串。
```
var s1 = 'abc';
var s2 = 'def';

s1.concat(s2) // "abcdef"
s1 // "abc"
```
slice方法用于从原字符串取出子字符串并返回，不改变原字符串。
```
'JavaScript'.slice(0, 4) // "Java"
```
trim方法用于去除字符串两端的空格，返回一个新字符串，不改变原字符串。
```
'  hello world  '.trim()
// "hello world"
```
3、Boolean
```
var b = new Boolean(true)
b.toString()  // 'true'
b.valueOf()  // true

var f = false
var f2 = new Boolean(false)
if(f) { console.log(1) }
if(f2) { console.log(2) }
// 问：会打印出什么？
2  // 只打印 2， f2 并不是 false，因为它是一个对象，而对象的boolean是 true     
```
4、object
```
var o = {}
var o2 = new Object()
// 这两种写法的结果没有任何区别，因为 对象 本身是复杂类型，但是
o === o2  // false
// 这是因为它们虽然都创建一个空对象，但是地址并不一样。
```
原型和原型链
实际上就是共有属性。所有对象都有 toString 和 valueOf 属性，那么我们是否有必要给每个对象一个 toString 和 valueOf 呢？JS 的做法是把 toString 和 valueOf 放在一个对象里（暂且叫做公用属性组成的对象）
然后让每一个对象的 __proto__ 存储这个「公用属性组成的对象」的地址。
![image.png](https://upload-images.jianshu.io/upload_images/11649292-a60f1e680d7c462c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
图中每一个都用tostring()和valueof()会很占内容，所以可以用共用属性。
js通过隐藏属性__proto__属性来访问公共属性，它指向了那些所有对象共有的属性。首先查看自身是否是对象，如果不是就包装对象
如果是对象就查看自身的 key 有没有 toString，有的话就直接调用
如果没有的话就通过__proto__查看你的共用属性看有没有，有的话就将你自身对应的值打印出来。
![image.png](https://upload-images.jianshu.io/upload_images/11649292-9f50cbecc4b3993c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
var o1 = {name: 'frank'}
o1.toString()  // [object Object]
// 依照步骤来，o1是对象，o1没有toString，查看共有属性，有toString,打印o1对应的值
// 不仅仅是o1,创建更多的对象也是一样，所有的对象都有隐藏属性`__proto__`，指向对应的共有属性
var o2 = {}
o1 === o2  // false
o1.toString() === o2.toString()  // true
```
number，string，boolean对象共有属性怎么表示呢
![image.png](https://upload-images.jianshu.io/upload_images/11649292-8a5ee324aa58e357.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
number，string，boolean分别指向自己的共有属性，三者的共有属性在指向object共有属性，object共有属性指向null
![image.png](https://upload-images.jianshu.io/upload_images/11649292-2cf3657538452c61.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-8ccae7d2f5d6b2a3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
n1.__proto__=Number.prototype
n1.__proto__.__proto__=Object.prototype
```
boolean，string也是如此。
String.prototype 是 String 的共用属性的引用（防止共用属性被垃圾回收）
s.__proto__ 是 String 的共用属性的引用（这是你在用共用属性）
proto 是对象的属性，prototype 是函数的属性
![image.png](https://upload-images.jianshu.io/upload_images/11649292-8baa9f0874025a0c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/11649292-5c0796e028dad623.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


记住公式：
对象.__proto__ === 函数.prototype
函数.__proto__ === Function.prototype
```
var o1 = 函数.prototype
o1.__proto__  === Object.prototype  // 等于下面
函数.prototype.__proto__ === Object.prototype

var o2 = 函数
o2.__proto__ === Function.prototype  // 也就是
函数.__proto__ === Function.prototype
Function.__proto__ === Function.prototype
Function.prototype.__proto__ === Obeject.prototype

String.__proto__ === Function.prototype
Number.__proto__ === Function.prototype
Boolean.__proto__ === Function.prototype
Object.__proto__ === Function.prototype
```