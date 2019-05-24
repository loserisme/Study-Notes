
MATLAB学习笔记
===
>居中

<center>MATLAB学习笔记</center>
====

>左对齐
<p align="left">诶嘿</p>

>右对齐
<p align="right">诶嘿</p>

>插入图片测试

![图片测试](C:\Users\Tang\Desktop\省创\1.png)

![Alt text](/Users/Tang/Desktop/省创/1.png)

![美女漂亮不](https://tse2-mm.cn.bing.net/th?id=OIP.rF3VYN1CRvtyWBPU0I7kyQDMEy&p=0&pid=1.1)

>定义尺寸

<img width = '150' height ='150' src ="https://tse2-mm.cn.bing.net/th?id=OIP.rF3VYN1CRvtyWBPU0I7kyQDMEy&p=0&pid=1.1"/>

>定义大小并居中显示

<div align=center><img width = '150' height ='150' src ="https://tse2-mm.cn.bing.net/th?id=OIP.rF3VYN1CRvtyWBPU0I7kyQDMEy&p=0&pid=1.1"/></div>


一、常用函数
----
>这是一个测试

没错，这是一个测试

>代码测试

    void Turn_around()
         {
	straight ();
	delay_ms(80);
    TIM2_pwm1(1000);
    TIM2_pwm2(0);
    TIM4_pwm1(0);
    TIM4_pwm2(1000);	
    delay_ms(900);
    while(sensor_5==0)
    {
    TIM2_pwm1(650);
    TIM2_pwm2(0);
    TIM4_pwm1(0);
    TIM4_pwm2(650);	
    }
    stop();
    }
>区块测试


>表格测试

  这是一个普通段落

<table>
    <tr>
        <td>Foo</td><td>F001</td>
    </tr>
    <tr>
        <td>2565</td>
        <td>28596</td>
    </tr>
</table>
这是另一个普通段落。


>网页链接测试
>>嵌套测试
>>>测试

https://www.baidu.com

https://1184219586@qq.com

 # 这是h1 #

## 这是h2 ##

> ## 这是一个标题。
> 
> 1.   这是第一行列表项。
> 2.   这是第二行列表项。
> 
> 给出一些例子代码：
> 
>     return shell_exec("echo $input | $markdown_script");

+   Red
+   Green
+   Blue
  
* 111
* 222
* 333
  
- 111
- 222
- 333

1. 测试1
2. 测试2
3. 测试3
4. 测试四

*   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,
viverra nec, fringilla in, laoreet vitae, risus.
*   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.
Suspendisse id sem consectetuer libero luctus adipiscing.

1.  This is a list item with two paragraphs. Lorem ipsum dolor
    sit amet, consectetuer adipiscing elit. Aliquam hendrerit
    mi posuere lectus.

    Vestibulum enim wisi, viverra nec, fringilla in, laoreet
    vitae, risus. Donec sit amet nisl. Aliquam semper ipsum
    sit amet velit.

2.  Suspendisse id sem consectetuer libero luctus adipiscing.

*   A list item with a blockquote:

    > This is a blockquote
    > inside a list item.

   1985\. What a great season.

   1986. What a great season.

Here is an example of AppleScript:

    tell application "Foo"
        beep
    end tell
---
* * *
  >以上为分割线测试

  This is [an example](http://example.com/ "Title") inline link.

[This link](http://example.net/) has no title attribute.

这是[百度](https://www.baidu.com)的网址

这是[百度](https://www.baidu.com/ "Title")的网址

See my [About](/about/) page for details. 

是的
&copy

This is [an example][id] reference-style link.

[id]: http://example.com/  "Optional Title Here"


>强调测试

*single asterisks*

_single underscores_

**double asterisks**

__double underscores__


un*frigging*believable

\*this text is surrounded by literal asterisks\*

Use the `printf()` function.

``There is a literal backtick (`) here.``

A single backtick in a code span: `` ` ``

A backtick-delimited string in a code span: `` `foo` ``