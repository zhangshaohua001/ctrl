<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-27
 * Time: 上午10:06
 */
 
 class Common_Conf{
     const LOGIN_TYPE_WEB = 1; //登录类型：Web
     const LOGIN_TYPE_ANDROID = 2; //登录状态：Android
     const LOGIN_TYPE_IOS = 3; //登录类型：IOS
     const LOGIN_TYPE_OTHER = 0; //登录类型：其他

     const APP_LOGIN_TYPE_MOBILE = 0; //app登录类型：手机号
     const APP_LOGIN_TYPE_QQ = 1; //app登录类型：QQ
     const APP_LOGIN_TYPE_Wechat = 2; //app登录类型：微信
     const APP_LOGIN_TYPE_Weibo = 3; //app登录类型：微博

     const STATUS_NORMAL = 1; //正常登录
     const STATUS_FORBID = 0; //禁止登录

     const MSG_TYPE_SYSTEM = 0; //消息类型：系统消息
     const MSG_TYPE_NORMAL = 1; //消息类型：普通消息
     const MSG_TYPE_ENCOURAGE = 2; //消息类型：激励消息

     const SHARE_TYPE_CLOCK = 1; //分享类型：激励闹钟
     const SHARE_TYPE_ENERGY = 2; //分享类型：能量值
 }