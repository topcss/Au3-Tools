; This script locks the screen. Compile to .exe using AutoIT tools and place in Startup folder to immediately lock screen after logon.
; 参数说明：
; rundll32.exe -> 在内存中运行dll文件。
; user32.dll -> windows系统用户界面相关应用程序接口。
; LockWorkStation函数 -> 锁定操作系统屏幕。
Run("rundll32.exe user32.dll LockWorkStation");
