---
title: JS数组
date: 2018-06-02 21:02:34
tags:
---

JS内存 stack：global/windows heap：哈希表：标准库/非标准库。
标准库：object():keys,create();string();number();array();function()等。
String(1)返回字符串 new string

![image.png](https://upload-images.jianshu.io/upload_images/11649292-6e7f7f62483b16cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
var a = Array(3)  // {length: 3}
a.length // 3
0 in a // false, 数组 a 里面并没有 0 这个 key
a[0] // undefined
a.push('three')
3 in a // true
a[3] // 'three'
```
0.1.2.没有存下来
```
var a2 = Array(3,3) // [3,3]
a2.length // 2
0 in a2 // true
a2[0] // 3 
// 当括号里只有一个数字参数的时候，它是长度，当参数不止一个的时它是参数
// 这叫做不一致性，这不是一件好事
```
![image.png](https://upload-images.jianshu.io/upload_images/11649292-47ec0d2334c5f6bd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
new Array(3) 跟不加 new 一样的效果
new Array(3,3,) 跟不加 new 一样的效果

var a = [1,2,3] // 常用简写方式
加不加new对不同类型的区别：
String、Number、Boolean
String()返回基本类型
new String()返回对象，加不加new是不一样的
Object、Array、Function
Object()返回对象
new Object()返回依然是对象，加不加new是一样的
```
var a=new Array(1,2,3)
var a=[1,2,3]//undefined
var f=function(a,b){
return a+b
}//undefined
var f=new Function('a','b','return a+b')//undefined
f(1,2)//3
//把所有的东西变成字符串一字排开，这是new function用法
```
```
//声明函数：
function f(){
  return undefined
}  
//匿名函数
function(){
}
var f=new Function(‘x’,’y’,’x+y’)
var a=function(){
}
```
![image.png](https://upload-images.jianshu.io/upload_images/11649292-6f97de4fd6c3366b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
var a = [1,2,3]
a.x = 'x'
a.y = 'y'
for(let i=0; i < a.length; i++){ // 这种方法遍历排除了 x、y
  console.log(a[i]) // 1, 2, 3
}
for(let key in a){
  console.log(key) // 0, 1, 2, x, y
}
var obj = {
  0: 1, 1: 2, 2: 3, length: 3
}
for(let i=0; i < obj.length; i++){
  console.log(obj[i]) // 1, 2, 3
}

for(let key in a){
  console.log(key) // 0,1,2,xxx,yyy
}
```
数组是拥有特殊原型链的对象，它不关心你有没有数组的那些方法，只需要012345……这些下标去遍历，数组只是我们认为它是数组。

只要你的原型链中没有Array.prototype就是伪数组
目前JS中只有一种伪数组，就是arguments

forEach()会遍历这个数组，对数组中的每一项调用这个函数,可以通过this获取。a.forEach接受一个函数，这个函数必须接受2,3个参数，第一个参数是a的value，第二个是a的key，第三个是a本身。没有返回值。
```
A.forEach(function(){})//undefined
a =[5,6,3,4,1,2] 
a.sort//1,2,3,4,5,6
a.sort(function(x,y){return x-y})//123456
a.sort(function(x,y){return y-x})//654321

a =[1,2,3]
a .join(‘方方’)/1ff2ff3ff，不传参默认以逗号相隔
a +’’//‘1,2,3’
a .concat//连接，合并多个数组
var a=[1,2,3]
var b=[4,5,6]
a+b//1,2,34,5,6
a .concat(b)//1,2,3,4,5,6
concat会返回新的数组
var a=[1,2,3] 
var b=a.concat([])
a//1,2,3
b//1,2,3
a===b //false

a.map(function(value,key){
   return value*2
})
//2,4,6 有返回值
a.map(value=>value*2)//2,4,6
 
a =[1,2,3,4,5,6,7,8,9,10]
a .filter(function(value,key){
   Return value>=5
})//5,6,7,8,9,10 filter过滤

a =[1,2,3]
var sum =0
for(let i=0;i<a.length;i++)
sum+=a[i]
}//6
a =[1,2,3]
a .reduce(function(sum,n){
   return sum+n //作为下一次遍历的结果
},0)//6 reduce遍历这个数组，每一次取一个结果，把这个结果放在下一个项的身上 n是下一次要加的数字


Map可以用reduce表示
a =[1,2,3]
a .reduce(function(){
  Arr.push(n*2)
Return arr
},[])
filter可以用reduce表示
a=[1,2,3,4,5,6,7,8,9,10]
a .reduce(function(arr,n){
    If(n%2===0){
Arr.push(n)
}
 Return arr
},[])
```