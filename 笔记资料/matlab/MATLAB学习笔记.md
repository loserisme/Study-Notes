<center>MATLAB学习笔记</center>
<font size=4 face="黑体">作者：唐鹏
===
一、常用的一些基本数学函数
---
* 绘制曲线函数
> <p align='left'>   用直线画出y=f(x)的函数图像</p> 
    plot(x,y) 
    占坑补图

>  <p align='left'>   用符号“--”画出y=f(x)的函数图像</p> 
    plot(x,y,'--')
    占坑补图
> <p align='left'>   用符号“--”画出y=f(x)的函数图像</p> 
    plot(x,y,'*')
    占坑补图
* 定义变量范围
> <p align='left'>  定义域为0到2*pi，步距为0.01</p> 
    x=0，0.01，2*pi
* 打开图像中网格
> <p align='left'>  画完图打开图像中的网格</p> 
    grid on
* 在一幅图中画多个曲线
> <p align='left'> 在一幅图中画出多个个曲线，在画完一幅图后输入以下命令</p> 
    hold on
* 定义符号式
> <p align='left'> 我的理解为定义一个未赋值的变量，可能理解有偏差，先占坑，以后明白了再来改</p> 
    syms x,y
    定义了两个符号变量x，y
* 合并同类项
> <p align='left'> 合并同类项命令，了解不多，先占坑，以后来补充</p> 
    collect(f,x)
* 因式分解
> <p align='left'>因式分解命令，了解不多，先占坑，以后来补</p>
    factor(f)
<font color=red size=3 face="黑体">注:合并同类项和因式分解都是对符号表达式（占坑，明白这个定义后再来补充）进行操作。</font>
* 求极限函数
><p align='left'>求函数极限，依旧是针对符号表达式</p>
    limit(f,x,left or right)
    f为函数，x为符号变量，left为左极限，right为右极限
    如果函数为 limit(f,x)
    说明无双边极限
    如果函数为 limit(f,x,left,right)
    说明函数有左右极限  //这种情况还需要了解，占坑
* 求导求差分函数
><p align='left'>此函数用来求导和求差分，依旧是针对符号表达式</p>
    diff(y)
    占坑
* 求积分函数
><p align='left'>此函数用来求积分，依旧是针对符号表达式</p>
    int(y,x,m,n)
    m,n分别为左右极限

