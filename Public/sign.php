<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-26
 * Time: 下午2:18
 */
date_default_timezone_set('Asia/Shanghai');
$service = @$_REQUEST['service'];
$api_secret = 'aibdai_clock_2016';
$version = @$_REQUEST['v'];
$clientType = @$_REQUEST['ct'];

if(!$service){
    exit('<p>请使用或GET/POST请求传递<span style="color: red">service</span>参数</p>');
}
if(!$version){
    exit('<p>请使用或GET/POST请求传递<span style="color: red">v</span>参数</p>');
}
if(!$clientType){
    exit('<p>请使用或GET/POST请求传递<span style="color: red">ct</span>参数</p>');
}
echo "<p></p>";
echo "<p>原参数为：</p>";
echo "<p>service = <span style='color: red'>$service</span>，v = <span style='color: red'>$version</span>，ct = <span style='color: red'>$clientType</span></p>";
echo "<p>先将参数的值全部转化为小写：</p>";

$service = strtolower($service);
$version = strtolower($version);
$clientType = strtolower($clientType);
echo "<p>service = <span style='color: red'>$service</span>，v = <span style='color: red'>$version</span>，ct = <span style='color: red'>$clientType</span></p>";

$tmpArr = array($service,$api_secret,$version,$clientType);
echo '<p>将service,ct,v,盐值四个参数的值组装成数组:</p>';
echo '<p>原数组顺序:</p>';
echo '<pre>';
print_r($tmpArr);
echo '</pre>';
asort($tmpArr , SORT_STRING);
echo '<p>将数组按字母正序排序，排序后的数组顺序:</p>';
echo '<pre>';
print_r($tmpArr);
echo '</pre>';
$string = implode($tmpArr);
echo '<p>将数组拆分成字符串:</p>';
echo '<p style="color:red">'.$string.'</p>';
echo '<p>md5后生成的签名:</p>';
echo '<p style="color:red">'.md5($string).'</p>';
