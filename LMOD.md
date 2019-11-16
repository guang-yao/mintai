### [LMOD: ENVIRONMENTAL MODULES SYSTEM](https://www.tacc.utexas.edu/research-development/tacc-projects/lmod)
----------
- prupose
Lmod 是一个基于Lua的模块系统, 他可以轻松的解决MODULEPATH的分层问题. Environment Modules为通过modulefiles来动态改变用户的环境提供了一个便捷的方法. 这包括在PATH environment variable里简单的添加或移除文件. 库的包里的Modulefiles提供了环境变量, 指定了库和头文件的位置.
- overview
一个Modulefiles包含了必要的信息来让用户运行各自的应用或者提供各自库的入口. 所有的这些可以在不需要登出再重新登录的方式, 而是动态实现. 应用的Modulefiles改变了用户的路径使得访问变得容易. 库里的Modulefiles提供了指定库和头文件位置的环境变量. 在包的不同版本之间切换或删除包也非常容易.
可以通过模块系统干净的加载或卸载包. 所有流行的shell都受支持: bash, ksh, csh, tcsh, zsh. LMOD也可用于perl和python.
- IMPACT
lmod每天都在TACC的所有集群上使用. 它也在美国和世界各地的数千个高级计算站点上使用.


[Documentation](https://lmod.readthedocs.io/en/latest/#advanced-topics)
-----------
- Introduction to Lmod
如果你是新手, 请阅读User Guide和Frequently Asked Questions Guide. 希望了解如何拥有自己的个人模块的用户应该阅读Advanced User Guide
	- [User Guide for Lmod]()
	- [An Introduction to Writing Modulesfiles]()
	- [Frequently Asked Questions]()
	- [Advanced User Guide for Personal Modulefiles]()
- Installing Lmod
希望在个人电脑或者系统上安装Lmod的用户应该阅读Installation Guide以及Transitioning to Lmod Guide. 其余的指南可以根据需要阅读．
	- [Installing Lua and Lmod]()
	- [How to Transition to Lmod (or how to test Lmod without installing it for all)]()
	- [Lmod Modulefile Functions]()
	- [Module names and module naming conventions]()
	- [How Lmod Picks which Modulefiles to Load]()
	- [Providing A Standard Set of Modules for all Users]()
	- [Converting from TCL/C Environment Modules to Lmod]()
- Advanced Topics
	- [How to report a bug in Lmod]()
	- [Rules for PATH-like variables]()
	- [How to use a Software Module hierarchy]()
	- [Configuring Lmod for your site]()
	- [Site and user control of defaults, aliases and hidden modules]()
	- [How does Lmod convert TCL modulefile into Lua]()
	- [Dependent Modules]()
	- [Modulefile Examples from simple to complex]()
	- [The Interaction between Modules, MPI and Parallel Filesystems]()
	- [Lmod on Shared Home File Systems]()
	- [User Spider Cache]()
	- [System Spider Cache]()
	- [Using the module spider command]()
	- [The spider tool]()
	- [Deprecating Modules]()
	- [Module Properties]()
	- [Debugging Modulefiles]()
	- [SitePackage.lua and hooks]()
	- [Lmod Localization]()
	- [Integration of EasyBuild and Lmod]()
	- [Providing Custom Labels for Avail]()
	- [Load Storms: Long load times or Fails to Load]()
	- [Tracing Lmod]()
	- [Sticky Modules]()
	- [Modify Lmod behavior with SitePackage.lua]()
	- [Converting shell scripts to modulefiles]()
	- [Tracking Module Usage]()
	- [Combining modules and build systems with settarg]
	- [Improving performance of Lmod]()
	- [Module Extensions]()
	
	