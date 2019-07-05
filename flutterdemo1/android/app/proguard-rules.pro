#如果使用了第三方JAva或者Android库，也许你想减小apk文件的大小或者防止代码被逆向破解。
#Flutter Wrapper
#配置混淆flutter引擎库，任何其他库需要添加与之对应的规则。

-dontwarn io.flutter.**
-keep class io.flutter.app.** {*;}
-keep class io.flutter.plugin.** {*;}
-keep class io.flutter.util.** {*;}
-keep class io.flutter.view.** {*;}
-keep class io.flutter.** {*;}
-keep class io.flutter.plugins.** {*;}
