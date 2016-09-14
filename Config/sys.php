<?php 
/**
 * 以下配置为系统级的配置，通常放置不同环境下的不同配置
 */

return array(
	/**
	 * 默认环境配置
	 */
	'debug' => true,
	'api_secret' => 'aibdai_clock_2016',
	'password_secret' => '*&.da540d.1#2$',
	'sms_check' => 'https://webapi.sms.mob.com/sms/verify',
	'sms_appkey_clock_ios' => 'f41cb8fcdf16',
	'sms_appkey_clock_android' => 'f54a5f80653e',
	'preg_mobile' => "/^1[3|4|5|7|8][0-9]\d{8}$/",
	'preg_email' => "/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/",
	'max_same_clock_count' => 5

//	/**
//	 * MC缓存服务器参考配置
//	 */
//	 'mc' => array(
//        'host' => '127.0.0.1',
//        'port' => 11211,
//	 ),
//
//    /**
//     * 加密
//     */
//    'crypt' => array(
//        'mcrypt_iv' => '12345678',      //8位
//    ),
);
