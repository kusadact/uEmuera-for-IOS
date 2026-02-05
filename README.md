根据uEmuera的0.29g版本编译并适配了一下ios端

ios端要求严格大小写所以需要使用转换大小写批处理

把游戏文件放到uEmuera文件夹应该就能正常读取

本体v0.2.9g
https://github.com/Noa3/uEmuera

大小写转换
https://github.com/Cowmelie/applEmueraConverter/

我对这个批处理做了一点改写，修复了路径中有空格和特殊字符就会报错的bug

大小写转换使用方法：将游戏文件夹拖到applEmueraConverter.bat文件里

在批处理根目录使用cmd示例：applEmueraConverter.bat "X:\era\"
