---
title: DOM-API
date: 2018-06-12 20:47:33
tags:
---

总结 + 我认为的重点
搜索归纳,以掌握 DOM 基本思想

DOM 的作用 === 表示 HTML 文档

DOM提供的 API === 查询,修改 HTML 文档内容

输入document.documentElement来获得 html 节点

只有Node.querySelectorAll()返回的数组不是动态的

scrollHeight返回的是高度

scrollTop返回的是滚动高度



对 DOM 的一些理解
DOM === 想象的树型结构模型.

DOM提供的API的作用就是修改或者查看 HTML 代码

DOM中的O指的是Object,他是在内存中,按照树型结构,通过构造函数(如Node,Element(翻译为标签比较好),Document三个构造函数),构造出对象,将 DOM 展现到内存中

DOM的D指的是Document,可以认为是 HTML 文档

DOM的M指的是Model,因为在 HTML结构 在内存中不好用笔表示,所以用一个模型来表示,这个模型就是树型结构

DOM 树型结构

未命名文件 (4).png

上图就是DOM,其中的每个节点(包括矩形节点和椭圆形节点)都是Node类型

document节点是Document构造函数的一个实例对象,document节点代表了整个文档(整个树型结构

,我们可以通过直接输入document来获取document节点

html节点是Element构造函数的一个实例对象,html节点又叫根节点

我们可以通过输入document.documentElement来获得html节点

椭圆形的文本节点:"你好,我叫饶家俊" 是Text构造函数的一个实例对象(文本节点是Text构造函数的一个实例对象)

Node,Element,Text的关系

未命名文件 (5).png

DOM的归纳和总结
JavaScript将 HTML 文档渲染成 DOM 的树型结构.

有了树形结构, 第一件事情是什么?当然是获取DOM的节点啦!

获得节点的方法:

直接在DOM寻找: document.querySelector(AAAA)和document.querySelectorAll(AAAA)
通过节点关系获得节点
兄弟关系
儿子关系
父关系
获得节点后,首先你要了解获得的节点是什么吧(比如你要知道节点是什么类型)?

了解节点:

Node.nodeName
Node.nodeType
Node.textContent
既然节点可以对应 HTML 文档的标签,那么我可不可以通过 DOM 来处理标签的属性?搜索处理标签属性知道所有属性的处理方法.

我可以通过 DOM 的 API 修改 DOM 的结构吗?

创建节点

document.createElement("div")生成Element节点

document.createTextNode("你好,我叫饶家俊")生成Text节点

通过Node方法将创建的节点拼接到 DOM 中,搜索Node方法

Node类型的一些属性和方法
Node属性
节点本身某些特征的属性:
Node.nodeName:
看着DOM,如果你不确定某个Node节点是什么类型(不确定某个Node节点是矩形还是椭圆形)
返回节点类型,重要的返回的值有大写的HTML元素名, #text ,#document
Node.nodeType:
根据Node类型返回某些数字
Element类型,返回的数字是1
Text类型,返回的数字是3
Document类型,返回的数字的9
Node.textContent
返回的当前节点及其所有后代的文本内容
值得注意的是,因为Node.textContent是Node属性,所以文本节点也是有textContent的
innerHTML和innerText是Element的属性,所以TextNode.innerHTML返回的是undefined,注意,并不是返回null
节点结构关系属性
兄弟关系
Node.nextSibling
Node.previousSibling
儿子关系
Node.childNodes
Node.firstChild
Node.lastChild
父关系
Node.parentNode
上面的所有关系属性都可以获取到Text节点(除了父关系)
Node.childNodes是最特殊的,它返回的是一个伪数组,里面是Node节点,并且伪数组内的值是动态变化的
Node方法
Node.appendChild()

Node.hasChildNodes()

Node.cloneNode()

Node.insertBefore()

Node.removeChild()

Node.replaceChild()

Node.contains()

Node.isEqualNode()

Node.isSameNode()

Node.normalize()



document节点的一些属性和方法
document属性
用于指向其他节点(快捷获取某些特殊节点)的属性

document.documentElement指向 DOM 的 html节点
document.activeElement指向获得焦点的那个节点
返回文档特定元素的伪数组集合的属性

document.links
document.forms
document.images
document.embeds
等等
返回文档信息的属性

document.location
document.readyState返回的是当前文档的状态,
等等


document获取节点方法
方法:document.querySelector(AAAA)和document.querySelectorAll(AAAA)

注意点:

如果获取标签,那么直接AAAA === "div" 即可
第一个返回的是第一个符合CSS选择器AAAA条件的节点
第二个返回的是伪数组,里面包含了所有符合选择器的节点
第二个返回的结果不是动态的,不会实时反映元素节点的变化
这两个方法除了是 document ,还可以是某个 Node 节点
其他查找方法不学,没有必要




document生成节点的方法
document.createElement("div")生成Element节点
document.createTextNode("你好,我叫饶家俊")生成Text节点
document事件相关的方法
待续

document写入方法
待续

Element节点的一些属性和方法
属性
Element节点的属性处理

搜索处理标签属性

盒模型相关属性

获得整个页面高度:document.documentElement.scrollHeight

获得整个浏览器视口的高度document.documentElement.clientHeight // 不包括滚动条

某个Element距离浏览器视口左上角的坐标

Element.getBoundingClientRect().left
Element.getBoundingClientRect().top
某个Element距离整个网页左上角的坐标(,注意和上一个区别)

Element.getBoundingClientRect().left + document.documentElement.scrollLeft
Element.getBoundingClientRect().top + document.documentElement.scrollTop
下面的可以不看了,等到遇到问题的时候再看

容器 === 浏览器的可视区域

Node.clientHeight,Node.clientWidth

某个 Element节点: 经过浏览器视口变化,返回节点所占据整个页面的高度和宽度(只有padding,margin和border不是)
html节点: 返回浏览器视口宽度和高度
Node.clientTop,Node.clientLeft

返回节点的左边框(border)和上边框(border)的边框宽度
Noe.scrollHeight, Node.scrollWidth

某个Element节点: 经过浏览器视口变化,返回节点所占据整个页面的高度和宽度(只有padding,margin和border不是)
html节点: 经过浏览器视口变化,返回整个页面的高度和宽度
Node.scrollLeft, Node.scrollTop

返回向下的滚动条和向右的滚动条滚动的像素
Node.offsetHeight, Node.offsetWidth
某个 Element节点: 经过浏览器视口变化,返回节点所占据整个页面左上角距离右下角的宽度和高度,并且左上角是包括padding和border
html节点: 经过浏览器视口变化,返回整个页面的高度和宽度
Node.offsetLeft,Node.offsetTop
与父节点之间的宽度和高度???



处理标签属性
最正常,也最麻烦的写法

增:Node.setAttribute("属性名", "属性值")
删: Node.removeAttribute("属性名")
改: Node.setAttribute("已经存在属性名", "新属性值")
查:Node.getAttribute("属性名")
但是,对于标准属性来说,可以写的简单一点

增:Node.style = "border: 10xp solid black"
删: 无法简写
改: Node.style = "border: 10px solid red"
查:Node.style
对于标准属性的 class 属性来说,因为它实在是太重要了,所以对于class属性也有一套方法:

首先获得包含所有属性的伪数组Node.classList

伪数组有以下方法:

add()：追加一个class。
remove()：移除一个class。
contains()：检查当前元素是否包含某个class。
toggle()：将某个class移入或移出当前元素。
item()：返回指定索引位置的class。其实用divTag.classList[1]这样更好
toString()：将class的列表转为字符串。




题目
HTML 代码
```
<div id=parent></div>
```
问: parent的值是多少?

HTMLCollection与NodeList的区别有 答案: AC

A. HTMLCollection实例对象的成员只能是Element节点，NodeList实例对象的成员可以包含其他节点。

B. HTMLCollection实例对象都是动态集合，节点的变化会实时反映在集合中。NodeList实例对象都是静态集合。

C. HTMLCollection实例对象可以用id属性或name属性引用节点元素，NodeList只能使用数字索引引用。

代码

var parent1 = document.getElementById('parent1');
parent1.childNodes.length // 2
parent1.appendChild(document.createElement('div'));
parent1.childNodes.length // 请问现在 length 是多少  答案是3

var allDiv = document.querySelectorAll('div')
allDiv.length // 假设是 2
document.body.appendChild(  document.createElement('div')  )
allDiv.length // 请问现在 length 的值是多少？？？    答案是2
答案的原因不是什么动态集合与静态集合,而是第一次的代码重新进行一次查询,而第二次的代码并没有重新进行查询,如果想让第二次的答案是3,那么把第二次的最后一句代码删去,并加上allDiv = document.querySelectorAll('div');allDiv.length就行了。


Node 的接口
属性

childNodes,firstChild,innerText,lastChild,nextSibling,nodeName,nodeType,nodeValue,outerText,ownerDocument,parentElement,parentNode,previousSibling,textContent

如果记不住就背下以下单词：

child / children / parent
node
first / last
next / previous
sibling / siblings
type
value / text / content
inner / outer
element
然后互相组合
方法（如果一个属性是函数，那么这个属性就也叫做方法；换言之，方法是函数属性）

appendChild()
cloneNode()
contains()
hasChildNodes()
insertBefore()
isEqualNode()
isSameNode()
removeChild()
replaceChild()
normalize() // 常规化
搞清楚英文单词的意思就知道用法
如果发现知道英文后依然不明白用法，看 MDN 的例子即可，如 normalize
DOM APi 无外乎「增删改查」

Document 接口
属性

anchors
body
characterSet
childElementCount
children
doctype
documentElement
domain
fullscreen
head
hidden
images
links
location
onxxxxxxxxx
origin
plugins
readyState
referrer
scripts
scrollingElement
styleSheets
title
visibilityState
方法：

close()
createDocumentFragment()
createElement()
createTextNode()
execCommand()
exitFullscreen()
getElementById()
getElementsByClassName()
getElementsByName()
getElementsByTagName()
getSelection()
hasFocus()
open()
querySelector()
querySelectorAll()
registerElement()
write()
writeln()
Element 的接口
DOM API 反人类
获取元素
以前之后 document.getElementById, document.getElementsByTagName, document.getElementsByClassName
太反人类，于是有了 jQuery
后来 DOM API 终于抄袭 jQuery 提供了 document.querySelector 和 document.querySelectorAll
但是依然没有 jQuery 好用，因为「不一致」

获取下一个元素

获取兄弟们