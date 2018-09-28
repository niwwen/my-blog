---
title: 实现jquery
date: 2018-06-21 18:13:52
tags:
---

用if语句判断传入的参数是否是字符串：如果是字符串用document.querySelector()，如果是节点，则return node。
```
window.jQuery = function(nodeOrSelector){
     let node;
     if (typeof nodeOrSelector === 'string'){
         node = document.querySelector(nodeOrSelector)
     } else {
         node = nodeOrSelector;
     }
     return node
 }
```
用到document.querySelectorAll()方法来获取dom对象,返回一个伪数组,然后遍历这个数组把每个value放到nodes里。
```
window.jQuery = function(nodeOrSelector){
    let nodes = {};
    if (typeof nodeOrSelector === 'string'){
        var temp = document.querySelectorAll(nodeOrSelector);
        for(let i=0;i<temp.length;i++){
            nodes[i] = temp[i]
        }
        nodes.length = temp.length
    } else if(nodeOrSelector instanceof Node){
        nodes = {
            0:nodeOrSelector,
            length:1
        }
    }
    return nodes
}
```
通过节点的addClass()方法，进行遍历，对每个节点进行class的添加。
```
nodes.addClass = function(classes){
     classes.forEach((value) => {
         for(let i=0;i<nodes.length;i++){
             nodes[i].classList.add(value);
         }
     })
 }
```
setText 函数编写，实现查找节点并设置内容,先找到需要改变的节点，对它依次遍历后再设置其内容。
```
function setText(text){
  for(let i=0;i<nodes.length;i++){
     nodes[i].textContext = text
    }
}
```
最终
```window.jQuery = function(nodeOrSelector){
    let nodes={}
    if(typeof nodeOrSelector ==='string' ){
        var temp = document.querySelectorAll(nodeOrSelector)  
        for(let i=0;i<temp.length;i++){
            nodes[i] = temp[i]
        }
        nodes.length = temp.length
    } else if(nodeOrSelector instanceof Node){ 
        nodes = {
            0:nodeOrSelector,
            length:1
        }
    }
return nodes
}

    nodes.addClass = function (classes){
        classes.forEach((value)=>{
            for(let i=0;i < nodes.length;i++){              
                nodes[i].classList.add(value)
            }
        })
    }

    nodes.setText = function(text){
        for(let i =0;i<nodes.length;i++){
            nodes[i].textContent = text
        }
    }

    return nodes
}

window.$ = jQuery

var $div = $('div')
$div.addClass('red') // 可将所有 div 的 class 添加一个 red
$div.setText('hi') // 可将所有 div 的 textContent 变为 hi
```