---
title: JS的类型
date: 2018-04-28 14:44:12
tags:
---

1、转数值类型

```
Number('111') //111
Number('111a') //NaN
Number(undefined) //NaN
Number(null) //0
Number('') // 0
Number(true) // 1
Number(false) // 0
parseInt(111, 10)  //111
parseInt('111a, 10')  //111
parseFloat('1.23') //1.23 
x - 0
+x
```
2、转字符串类型
number→string 变字符串只需要加空字符串。n+’’得到’n’，null和undefined也可以这样做。
x.toString()，x可以为number，boolean。null和undefined无法读取toString，会报错。object.toString()会得出不是我们想要的结果。
也可以使用String()。字符串和任意类型都会自动转为字符串。
```
(123).toString() //'123'
(100 + 23).toString()
false.toString()   //  'false'
true.toString()    //  'true'
String({a: 1}) // "[object Object]"
String([1, 2, 3]) // "1,2,3"
1+‘1’=(1).tostring()+'1' //'11' 
window.string(1) //1'
```
3、转布尔类型
boolean()
undefined,null,0,NaN''（空字符串）的转换结果为false，其余都为true。
```
boolean(0) //false
boolean('')  //false
boolean(' ') //true
boolean(null/undefined)  //false
boolean({})   //true 对象
boolean(NAN) //false
boolean(object)  //true
```
4、内存图
买一个 8G 的内存条
操作系统开机即占用 512MB
Chrome 打开即占用 1G 内存
Chrome 各每个网页分配一定数量的内存
这些内存要分给页面渲染器、网络模块、浏览器外壳和 JS 引擎
JS 引擎将内存分为代码区和数据区,100M
我们只研究数据区
数据区分为 Stack（栈内存） 和 Heap（堆内存）
简单类型的数据直接存在 Stack 里
复杂类型的数据是把 Heap 地址存在 Stack 里

数字：64位 字符：16位
简单的值(number/string/null/undefined/symbol/boolean)存stack里。复杂的值(object)存heap地址，存入stack里。
引用：object存入地址100，object是对象的引用。
![image.png](https://upload-images.jianshu.io/upload_images/11649292-7b134a53f7b65d86.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![image.png](https://upload-images.jianshu.io/upload_images/11649292-2db960f608ba0d1d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/11649292-c1470de5e808a7f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/11649292-cbecacbdefa97dac.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

第四幅图中，a.x=a={n:2}一句实际上写成“a={n:2};a.x=a”。第一句var a={n:1}操作在heap里存放“n:1”，stack里存放“a:ADDR31”指向heap这里；2句“var b=a”则在stack里放入“b:ADDR31”；3句把“a(a为32)={n:2}”赋给“a.x(a为31)”,根据=运算符从右至左的规定先执行“a={n:2}”——新造n:2放入ADDR32并把ADDR32传给a，则stack里a:ADDR32；再执行“a.x(门牌号78)='ADDR32'”，即在78号仓房里新放入了“x:ADDR32”;至此，alert(a.x)去找栈里a映射的32号房里并没有x这么个名的东东，所以输出“undefined”。而alert(b.x)时，Stack里b一直映射Heap的31号地址，里面的x值为ADDR32，alert调用toString()方法将对象ADDR32输出[object Object]。

垃圾回收：
如果一个对象没有被引用就是垃圾，将被回收。
举例：
![image.png](https://upload-images.jianshu.io/upload_images/11649292-9ba17dc703f1fa44.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
内存泄漏：解决方法：页面关闭之前，将所有事件置为null。
5、深拷贝，浅拷贝
深拷贝
```
var a = 1
var b = a
b = 2 //这个时候改变 b
```
a 完全不受 b 的影响
那么我们就说这是一个深复制

对于简单类型的数据来说，赋值就是深拷贝。
对于复杂类型的数据（对象）来说，才要区分浅拷贝和深拷贝。
基本类型的简单的赋值就是深拷贝。
这是一个浅拷贝的例子
```
var a = {name: 'frank'}
var b = a
b.name = 'b'
a.name === 'b' // true
```
因为我们对 b 操作后，a 也变了
什么是深拷贝，就是对 Heap 内存进行完全的拷贝。