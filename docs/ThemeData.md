### 自定义主题
在`Flutter`中使用`ThemeData`来在应用中共享颜色和字体样式。
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
一般我们通过复制父主题来进行扩展。
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