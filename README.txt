1.TexturePacker安装到/usr/local/bin/下
2.terminal 使用：‘which TexturePacker’查看是否路径正确
3.建立符号连接.在terminal中执行以下命令：
sudo ln -s “/Applications/TexturePacker.app/Content/MacOS/TexturePacker” “/usr/local/bin/TexturePacker”
4.将需要包的资源放在pack_res.sh同路径的文件夹中, 每一个文件夹将打成一个plist和对应的png，输出到与pack_res.sh同路径的plist文件夹中
5.terminal执行：./(YOUR LOCATION PATH)/pack_res.sh
