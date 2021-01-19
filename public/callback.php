<?php



//回调通知发货
//http://192.168.1.103:7878/paycallback/ykpaybankwx.html?opstate=0&orderid=10104787105850005&ovalue=25&sign=8c99a8fcdc0527823d09612983bf02ae&msg=2123        
$orderParams = json_decode(base64_decode($param),true);        
$content = "orderid=".$orderParams['orderid']."&opstate=0&ovalue=".$orderParams['value']."17cdbbfc9ba653f34a5ef9e8f86d7634";
$sign = md5($content);
$url = $orderParams['callbackurl']."?opstate=0&orderid=".$orderParams['orderid']."&ovalue=".$orderParams['value']."&sign=".$sign;   
$re = getCurl($url);

 //发送Http请求
 function getCurl($url, $post = 0, $cookie = 0, $header = 0, $nobaody = 0)
 {
     $ch = curl_init();
     curl_setopt($ch, CURLOPT_URL, $url);
     curl_setopt($ch, CURLOPT_TIMEOUT, 15);
     curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
     $klsf[] = 'Accept:*/*';
     $klsf[] = 'Accept-Language:zh-cn';
     //$klsf[] = 'Content-Type:application/json';
     $klsf[] = 'User-Agent:Mozilla/5.0 (iPhone; CPU iPhone OS 11_2_1 like Mac OS X) AppleWebKit/604.4.7 (KHTML, like Gecko) Mobile/15C153 MicroMessenger/6.6.1 NetType/WIFI Language/zh_CN';
     $klsf[] = 'Referer:'.$url;
     curl_setopt($ch, CURLOPT_HTTPHEADER, $klsf);
     if ($post) {
         curl_setopt($ch, CURLOPT_POST, 1);
         curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
     }
     if ($header) {
         curl_setopt($ch, CURLOPT_HEADER, true);
     }
     if ($cookie) {
         curl_setopt($ch, CURLOPT_COOKIE, $cookie);
     }
     if ($nobaody) {
         curl_setopt($ch, CURLOPT_NOBODY, 1);
     }
     curl_setopt($ch, CURLOPT_TIMEOUT,60);
     curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
     curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
     $ret = curl_exec($ch);
     curl_close($ch);
     return $ret;
 }
