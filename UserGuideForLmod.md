### User Guide for Lmod
这个指南解释了如何使用模块. 用户对模块命令的浏览包括模块的基本用法. 其他部分可以在以后遇到问题时阅读. 高级用户指南适用于需要创建自己的Modulefile的用户.

- User's Tour for the Module Command
模块命令设置了一定程度上独立于用户shell的环境变量. 通常系统会加载一组默认的模块设置. 常用的命令如下:
列出加载的模块:
`module list`
列出哪一个模块是可以被当前用户加载的:
`module avail`
加载包:
`module load package1 package2 ...`
卸载包:
`module unload package1 package2 ...`
用户希望切换编译器的时候:
`module swap gcc intel`
上面命令是这个命令的缩写:
`module unload gcc`
`module loader intel`
初始化模块设置:
`module reset`
这个命令将卸载所有当前加载的模块, 包括粘性模块(sticky ones), 然后加载LMOD_SYSTEM_DEFAULT_MODULES, 
