<?php
/**
 * 以下配置为系统级的配置，通常放置不同环境下的不同配置
 */
//根据文件是否存在决定是否引用
if (file_exists('create_cfg.php')) {
    $config = require_once 'create_cfg.php';
} else {
    $config = array(

        'banners_config' => array (

            '0' => array (
                'url' => 'f/uline.png',
                'href' => 'f/index.html',
                'title' => '上线了！',
            ),

            '1' => array (
                'url' => 'f/anzheng.png',
                'href' => 'f/anzhen.html',
                'title' => '安贞医院停车攻略',
            ),

            '2' => array (
                'url' => 'f/beiyisanyuan.png',
                'href' => 'f/beiyi.html',
                'title' => '北医三院停车攻略',
            ),
        ),

        'version' => array (
            'android_client' => '1.0.2',
            'android_charge' => '1.0.3',
            'ios_client' => '1.0.3',
            'ios_charge' => '1.0.3',
            'android_client_force' => '0',
            'android_charge_force' => '0',
            'ios_client_force' => '0',
            'ios_charge_force' => '0',
        ),

        /**
        * 支付方式,1现金，2支付宝，3微信，4百度,默认0 使用钱包
        */
        'payment_type' => array (
            '0' => '1',
            '1' => '1',
        ),

    );
}

$base_sys =  array(

    /**
     * 调试调试,true不使用缓存，false使用缓存
     */
    'debug' => false,
    /**
     * 是否打开审核模式,0默认入库的状态都是未审核状态，1为审核通过状态
     */
    'ischeck'=> 1,

    /**
     * 扫描是否通知,true通知
     */
    'is_send_scan_code'=>true,

    'api_secret'=>'UcheUxing123',
    'pwd_secret'=>'sdw*e#w24',//密码盐值
    'send_secret'=>'ucheu13@xing',//发送消息盐值
    'session_time'=>2592000,
    'stream_socket_client_uri'=>'tcp://192.168.1.8:7273',
    /**
     * 加密
     */
    'crypt' => array(
        'mcrypt_iv' => '12345678',      //8位
    ),
    'memcache_config' => array(
        'host' => '127.0.0.1',
        'port' => 11211,
        'prefix' =>'u_'
    ),
    'cache_time'=>array(
        'low'=>600, //十分钟
        'middle'=>3600,//1小时
        'high'=>86400,//24小时
    ),

    /**
     * pm25获取相关
     */
    'pm25'=>array(
        'host'=>'http://www.pm25.in',
        'uri'=>'/api/querys/pm2_5.json',
        'token'=>'5j1znBVAsnSf5xQyNQyq',
        'cache_time'=>3600,
    ),

    /**
     * 上传图片
     */
    'upload_pic' =>array(
        'maxSize'=>5242880,//上传大小5M
        'replace'=>true,//存在同名文件是否是覆盖
        'exts'=>array('jpg', 'png', 'jpeg'),//允许上传的文件后缀（留空为不限制)
        'mimes'=>array('image/jpeg','image/png','image/gif','image/bmp'),//允许上传的文件类型（留空为不限制)
    ),

    /**
     * 天气相关
     */
    'weather'=>array(
        'AppId'=>'1ccea3cce7cefd80',
        'Private_Key'=>'c5957e_SmartWeatherAPI_d047a2d',
        'url'=>'http://open.weather.com.cn/data/',
    ),

    /**
     * 百度地图模块,
     * search为区域检索POI服务
     * suggestion 为提示内容服务
     * ak为百度地图 webApi 的key
     * min_level 为地图有效显示的最小缩放等级
     * df_level 为地图有效显示的默认缩放等级
    */
    'bdmap' => array(
        'host' => 'http://api.map.baidu.com',
        'url_search' => '/place/v2/search',
        'url_suggestion' => '/place/v2/suggestion/',
        'ak' => 'oPNrG34DA5WpWYapCyvEiWSP',
        'min_level'=> 11,
        'df_level' => 18,
    ),

    /**
     * 提现银行，以银行全称的首字母来表示
     */
    'withdraw_banks' => array(
        'zgyh'      => 10001,       //中国银行
        'zggsyh'    => 10002,       //中国工商银行
        'bjyh'      => 10003,       //北京银行
        'zsyh'      => 10004,       //招商银行
        'bjncyh'    => 10005,       //北京农村银行
        'pfyh'      => 10006,       //浦发银行
        'zgnyyh'    => 10007,       //中国农业银行
        'zgjsyh'    => 10008,       //中国建设银行
        'gfyh'      => 10009,       //广发银行
        'payh'      => 10010,       //平安银行
    ),

    /**
     * 发送短信相关
     */
    'message_ary' => array(
        'host'=>'http://111.13.19.27/smsbill/mt',
        'userId'=>'220000050',
        'port'=>'00050',
        'pwd'=>'zxxt@1234',
        'againTime'=>'60', //再次请求时间间隔
        'effectiveTime' =>'300',//验证码有效期
        'requestNum' =>'10',//每人请求验证码次数
    ),

    /**
     * 接口服务Api配置文件
     */
    'api_config' => array(
        'toll_socket_url'=>'192.168.1.31',
        'toll_socket_port'=>'8888',
        'api_url'=>'http://192.168.1.31/App/?service=',
    ),

    /**
     * 预订相关配置
     */
    'booking_config'=>array(
        'booking_price_times'=>2,//预订停车价格倍数
        'booking_status_true'=>'111111111111111111111111', //可以预订状态
        'booking_status_false'=>'000000000000000000000000',//不可预订状态
    ),


    /**
     * baseUrl数组
     */
    'base_url' => array(
        'html_url'=>'http://192.168.1.31:9090/', //h5页面地址base
        'download_url'=>'http://192.168.1.31:8088/',//下载地址base
        'img_url'=>'http://192.168.1.31:8989/',//图片地址base
    ),

    /**
     * 客户端下载地址
     */
    'download_url' => array(
        'android_charge' => 'ucheuxingcharge.apk',
        'android_client' => 'ucheuxingclient.apk',
        'ios_charge' => 'ucheuxingcharge.apk',
        'ios_client' => 'ucheuxingclient.apk',
        'client'=>'dclient.php?from=app',
        'charge'=>'dcharge.php?from=app',
    ),

    /**
     * 分页加载时，默认页数
     */
    'default_page_num'=> 15,

    /**
     * 配置优惠券对应使用
     */
    'coupon_level' => array(
        'three' => 3,//满12
        'five'  => 5,//满20
        'eight' => 8,//满25
        'ten'   => 10,//满30
    ),

    //支付宝回调链接
    'ali_callback' => 'http://api.ucheuxing.com/App/?service=AlipayCallback.callback&callback=alipay',

    /**
     * 预定订单支付过期时间
     */
    'book_unpay_overdue_time' => 30,

    /**
     * 预定订单单日取消次数
     */
    'book_overdue_times' => 3,

    /**
     * 预定订单单日支付过期次数
     */
    'book_cancel_times' => 3,

    /**
     * 极光推送key
     */
    'jpush' => array(
        'app_key_android_client' => '3b468dc99445747e94af1757',
        'master_secret_android_client' => '203a5e5d59eb81f9fed81653',

        'app_key_android_charge' => 'f2bd8644048c0e2341a7f4a9',
        'master_secret_android_charge' => 'd38fe385a25cd17a14bdda5f',

        'app_key_ios_client' => '3b468dc99445747e94af1757',
        'master_secret_ios_client' => '203a5e5d59eb81f9fed81653',

        'app_key_ios_charge' => 'f2bd8644048c0e2341a7f4a9',
        'master_secret_ios_charge' => 'd38fe385a25cd17a14bdda5f',
    ),

    /**
     * 是否是测试模式
     */
    'is_debug_mode' => true,

);

return array_merge($base_sys, $config);
//return $base_sys;