## 不同gem包的同文件名加载问题
### 报错场景
这个项目包含两个gem包foo、bar，它们的lib目录都有一个hello.rb文件。
1. 运行`bundle exec irb`进入irb环境
2. 运行`require 'hello'` 加载hello.rb文件
3. 运行`Foo::Hello.new.say_hello`。输出`hello from foo`，这是我们想要的结果。
4. 运行`Bar::Hello.new.say_hello`。报错了，这不是我们想要的结果，为什么？

### 报错原因
在irb运行`$LOAD_PATH`可以看到自动加载目录列表包含了`require_problem/gems/bar/lib`和`require_problem/gems/foo/lib`。从加载顺序可以看到`foo/lib`覆盖了`bar/lib`，所以`require 'hello'`加载的是`foo/lib/hello.rb`文件
### 解决方法
将两个gem包的hello.rb分别移到`foo/lib/foo/hello.rb`及`bar/lib/bar/hello.rb`，然后使用`require 'foo/hello'`和`require 'bar/hello'`加载对应的hello.rb文件。再次在irb里运行`Foo::Hello.new.say_hello`及`Bar::Hello.new.say_hello`输出了正确的结果。
