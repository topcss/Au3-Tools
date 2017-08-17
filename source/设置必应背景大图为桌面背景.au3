; API： http://www.autoitx.com/Doc/
; 设置 必应首页背景图片 为桌面背景

Func GetImageUrl()
   Local $sBaseUrl = "https://cn.bing.com";
   Local $sData = InetRead($sBaseUrl & "/HPImageArchive.aspx?format=js&idx=0&n=1&nc=&pid=hp")
   Local $sText = BinaryToString($sData);
   Local $iStart = StringInStr($sText, '"url"') + 7;
   Local $iEnd = StringInStr($sText, '"urlbase"') - 2;
   Local $sUrl = $sBaseUrl & StringMid($sText, $iStart,  ($iEnd-$iStart))

   Return $sUrl;
EndFunc


Func DownloadFile($fileUrl, $fileName)
   Local $hDownload = InetGet($fileUrl, $fileName, 1, 1)
   Do
	   Sleep(1)
   Until InetGetInfo($hDownload, 2);检查下载是否完成.
   InetClose($hDownload);关闭句柄, 释放资源.
EndFunc


Local $sDir = @TempDir & "\bg0.jpg";
Local $sUrl = GetImageUrl();

; 下载Bing首页的图片
DownloadFile($sUrl, $sDir);

; 调用系统 dll 设置桌面背景
DllCall("user32.dll", "int", "SystemParametersInfo", "int", 20, "int", 0, "str", $sDir, "int", 0x2);
