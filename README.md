# NMCocoa

[![Github pod](https://img.shields.io/badge/pod-v1.0.1-blue.svg)](https://cocoapods.org/pods/NMCocoa)
[![Github license](https://img.shields.io/github/license/fps144/NMCocoa.svg)](https://github.com/fps144/NMCocoa/blob/master/LICENSE)  

**一个轻量级的功能型扩展库☕️**  

> 目前为止，NMCocoa主要以Category和.h file的形式包含了iOS开发中常用的**宏**及**功能型方法**，分类范围涉及UIKit和Foundation框架。  

## Installation with CocoaPods  
	
	
没有安装CocoaPods的话，可以用以下命令:  

`$ gem install cocoapods`  

#### Podfile  

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'NMCocoa', '~> The version you want'
end
```  

然后在当前项目中install就完事了:  

`$ pod install`

#### Category of Fundation↓  

![Foundation UML](https://user-gold-cdn.xitu.io/2018/10/27/166b3b3bbeaef291?w=1099&h=905&f=png&s=161724)  

#### Category of UIKit↓  

![UIKit UML](https://user-gold-cdn.xitu.io/2018/10/27/166b3b4681c6a830)   

  
> 此库计划不断完善，欢迎 issue | suggestion

