### 自定义主题
在`Flutter`中使用`ThemeData`来在应用中共享颜色和字体样式。
详细参数配置[入口](https://docs.flutter.io/flutter/material/ThemeData-class.html)
### 创建一个全局主题
在`MaterialApp`中定义一个`ThemeData`就可以了, 如果没有提供的话, `Flutter`会提供一个默认主题。
```dart
MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        primarySwatch: Colors.blue,
    )
);
```
### 创建一个局部主题
直接创建一个`ThemeData`, 使用`ThemeData`来包裹需要自定义主题的局部组件。
```dart
Theme(
    data: ThemeData(
        accentColorBrightness: Colors.yellow,
    ),
    child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}
    )
)
```
### 扩展主题
如果你不想覆盖所有的样式，可以继承全局主题，只覆盖部分样式，使用copyWith方法。
```dart
Theme(
    data: Theme.of(context).copyWith(accentColorBrightness: Colors.yellow),
    child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}
    )
)
```
### 使用主题
`Theme.of(context)`会查找`Widget`树, 然后返回树中最近的父主题`Theme`, 如果有则返回, 若没有, 则返回全局主题。
```dart
Container(
    color: Theme.of(context).accentColor,
    child: Text("Theme")
)
```