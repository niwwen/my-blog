---
title: JS的数据类型
date: 2018-04-18 16:42:02
tags:
---

JavaScript有七种数据类型：number string boolean symbol undefined null object
1、数值：JavaScript 中只有一种数字类型：基于 IEEE 754 标准的双精度 64 位二进制格式的值（-(263 -1) 到 263 -1）。它并没有为整数给出一种特定的类型。除了能够表示浮点数外，还有一些带符号的值：+Infinity，-Infinity 和 NaN。
表示法：整数和小数：1 1.1 .1
科学记数法：1.23e2
二进制：0b11
八进制：011
十六进制：0x11
特殊的数值：JavaScript 内部实际上存在2个0：一个是+0，一个是-0，区别就是64位浮点数表示法的符号位不同。唯一有区别的场合是，+0或-0当作分母，返回的值是不相等的。
```
(1 / +0) === (1 / -0) // false
```
上面的代码之所以出现这样结果，是因为除以正零得到+Infinity，除以负零得到-Infinity，这两者是不相等的。
NaN是 JavaScript 的特殊值，表示“非数字”（Not a Number），主要出现在将字符串解析成数字出错的场合。NaN不等于任何值，包括它本身。NaN在布尔运算时被当作false。
```
5 - 'x' // NaN

Math.acos(2) // NaN
Math.log(-1) // NaN
Math.sqrt(-1) // NaN

0 / 0 // NaN
```
Infinity表示“无穷”，用来表示两种场景。一种是一个正的数值太大，或一个负的数值太小，无法表示；另一种是非0数值除以0，得到Infinity。
2、字符串：JavaScript的字符串类型用于表示文本数据。它是一组16位的无符号整数值的“元素”。在字符串中的每个元素占据了字符串的位置。第一个元素的索引为0，下一个是索引1，依此类推。字符串的长度是它的元素的数量。字符串就是零个或多个排在一起的字符，放在单引号或双引号之中。
空字符串表示：''
多行字符串表示：
```
  var s = '12345' +
              '67890' // 无回车符号
 
  var s = `12345
  67890` // 含回车符号,反引号`
```
如果要在单引号字符串的内部，使用单引号，就必须在内部的单引号前面加上反斜杠，用来转义。双引号字符串内部使用双引号，也是如此。
```
' \'Hello\''
```
反斜杠（\）在字符串内有特殊含义，用来表示一些特殊字符，所以又称为转义符。
例如：
\n ：换行符
\r ：回车键
\t ：制表符
"\t\n1" 的 length 是3。
3、布尔：布尔表示一个逻辑实体，可以有两个值：true 和 false。
a && b 在 a 和 b 都为 true 时，取值为 true；否则为 false。
a || b 在 a 和 b 都为 false 时，取值为 false；否则为 true。
4、null：null是一个表示“空”的对象，转为数值时为0。如果有个对象object现在没有赋值就为null。null表示空值，即该处的值现在为空。
5、undefined：一个没有被赋值的变量会有个默认值 `undefined`。表示未定义。undefined是一个表示”此处无定义”的原始值，转为数值时为NaN。
如果有个非对象现在没有赋值就为undefined。
null和undefined区别：undefined和null在if语句中，都会被自动转为false，相等运算符甚至直接报告两者相等。
null表示"没有对象"，即该处不应该有值。
作为函数的参数，表示该函数的参数不是对象。 
作为对象原型链的终点。
```
Object.getPrototypeOf(Object.prototype) // null
```
undefined表示"缺少值"，就是此处应该有一个值，但是还没有定义。
变量被声明了，但没有赋值时，就等于undefined。
调用函数时，应该提供的参数没有提供，该参数等于undefined。
对象没有赋值的属性，该属性的值为undefined。
函数没有返回值时，默认返回undefined。
```
var i;
i // undefined

function f(x){console.log(x)}
f() // undefined

var  o = new Object();
o.p // undefined

var x = f();
x // undefined
```
6、符号：是ES6 引入的一种新的原始数据类型Symbol，表示独一无二的值。Symbol 值通过Symbol函数生成。这就是说，对象的属性名现在可以有两种类型，一种是原来就有的字符串，另一种就是新增的 Symbol 类型。凡是属性名属于 Symbol 类型，就都是独一无二的，可以保证不会与其他属性名产生冲突。
```
let s = Symbol();

typeof s
// "symbol"
```
上面代码中，变量s就是一个独一无二的值。typeof运算符的结果，表明变量s是 Symbol 数据类型，而不是字符串之类的其他类型。
Symbol函数可以接受一个字符串作为参数，表示对 Symbol 实例的描述，主要是为了在控制台显示，或者转为字符串时，比较容易区分。
```
let s1 = Symbol('aaa');
let s2 = Symbol('bbb');

s1 // Symbol(aaa)
s2 // Symbol(bbb)

s1.toString() // "Symbol(aaa)"
s2.toString() // "Symbol(bbb)"
```
上面代码中，s1和s2是两个 Symbol 值。如果不加参数，它们在控制台的输出都是Symbol()，不利于区分。有了参数以后，就等于为它们加上了描述，输出的时候就能够分清到底是哪一个值。
7、对象：对象就是一组“键值对”（key-value）的集合，是一种无序的复合数据集合。
```
var obj = {
  a: 'Hello',
  b: 'World'
};
```
上面代码中，大括号就定义了一个对象，它被赋值给变量obj，所以变量obj就指向一个对象。该对象内部包含两个键值对，第一个键值对是a: 'Hello'，其中a是“键名”a，字符串Hello是“键值”。键名与键值之间用冒号分隔。第二个键值对是b: 'World'，b是键名，World是键值。两个键值对之间用逗号分隔。
对象的所有键名都是字符串。如果键名不符合标识名的条件（比如第一个字符为数字，或者含有空格或运算符），且也不是数字，则必须加上引号，否则会报错。
读取对象的属性，有两种方法，一种是使用点运算符，还有一种是使用方括号运算符。
```
var obj = {
  p: 'Hello World'
};

obj.p // "Hello World"
obj['p'] // "Hello World"
```
如果使用方括号运算符，键名必须放在引号里面，否则会被当作变量处理。
```
var a = 'b';

var obj = {
  a: 1,
  b: 2
};

obj.a  // 1
obj[a]  // 2
```
数字键可以不加引号，因为会自动转成字符串。但不能使用点运算符。
delete命令：
```
var p={
     name:'abc',
      age:'18'
}
delete p['name']
p.name//undefined(无value)
'name' in person//false(无key)
p['name]=undefined//有value无key
```
Object.keys方法:
```
var p= {
    name:'abc',
    age:'18'
};

Object.keys(p);
// ['name', 'age']
```

typeof 运算符:数值、字符串、布尔值，符号，undefined，object分别返回number、string、boolean、symbol，undefined、object。null返回object、function返回function（function 并不是一个类型）。