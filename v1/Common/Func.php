<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-26
 * Time: 下午4:02
 */

class Common_Func{
    /**
     * 生成密码方法
     * @param $pwd string 密码原文
     * @return string
     */
    static function createPassword($pwd){
        return  strtolower(md5($pwd.DI()->config->get('sys.pwd_secret')));
    }

    /**
     * 校验验证码
     * @param $mobile
     * @param $code
     * @param int $zone
     * @return mixed
     */
    static function checkSMSCode($mobile,$code,$zone = 86){
        //判断客户端类型获取相应的appkey
        $ct = self::getLoginType();
        if($ct == Common_Conf::LOGIN_TYPE_IOS){
            $appkey = DI()->config->get('sys.sms_appkey_clock_ios');
        } elseif ($ct == Common_Conf::LOGIN_TYPE_ANDROID){
            $appkey = DI()->config->get('sys.sms_appkey_clock_android');
        } else {
            $time = empty($_SERVER['REQUEST_TIME'])?time():$_SERVER['REQUEST_TIME'];
            $ret = array('code' => Common_Code::ILLEGAL_REQUEST,
                'data' => array() ,
                'msg' => T("illegal_request"),
                'time'=>$time
            );
            DI()->response->setData($ret);
            DI()->response->output();
            exit;
        }

        //组装参数
        $param = array(
            'appkey' => $appkey,
            'phone' => $mobile,
            'zone' => $zone,
            'code' => $code,
        );
        $url = DI()->config->get('sys.sms_check');
        $ret = self::http($url,true,$param); //发送请求
        DI()->logger->debug('User.login;phone:'.$param['phone'].' --code:'.$param['code'].' --zone:'.$param['zone'].' --appkey:'.$param['appkey'].'--ret:'.$ret);
        $ret = json_decode($ret,true); //取出返回的参数
        return $ret['status'];
    }

    /**
     * CURL请求 get(默认)/post
     * @param $url string 请求地址
     * @param bool|false $post 是否post请求(默认不是post请求)
     * @param array $data 请求的数据,get请求也兼容
     * @param bool|false $https 是否https请求,默认不是
     * @param int $timeout 请求超时时间,默认5s,0为不限时
     * @return mixed 返回结果
     */
    static function http($url,$post = false , $data = array(), $https = false , $timeout = 5){
        if(!$post && $data){ //生成请求的URL
            $url = $url.'?'.http_build_query($data);
        }
        $ch = curl_init($url); //实例化CURL
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1); //设置返回结果不直接输出以文件流输出
        curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout); //设置请求超时时间,默认5s
        if($post){ //如果请求是post请求,发送post请求参数
            curl_setopt($ch,CURLOPT_POST,1);
            curl_setopt($ch,CURLOPT_POSTFIELDS,http_build_query($data));
        }

        if($https){ //如果是https请求,设置不认证证书
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        }
        $ret = curl_exec($ch);
        curl_close($ch);
        return $ret; //返回请求结果
    }

    /**
     * 获取客户端ip
     */
    static function getIP(){
        if (getenv("HTTP_CLIENT_IP"))
            $ip = getenv("HTTP_CLIENT_IP");
        else if(getenv("HTTP_X_FORWARDED_FOR"))
            $ip = getenv("HTTP_X_FORWARDED_FOR");
        else if(getenv("REMOTE_ADDR"))
            $ip = getenv("REMOTE_ADDR");
        else $ip = "Unknow";
        return $ip;
    }

    /**
     * 登录状态检查
     * @param $user_id
     * @param $session_id
     * @return int
     */
    static function checkUserLoginStatus($user_id,$session_id){
        $model_user = new Model_User();
        $session = $model_user->getUserLoginSession($user_id);
        if($session['login_session'] && $session['login_session'] == $session_id){
            return true; //已登录
        }

        return false; //未登录
    }

    /**
     * 用户未登录返回错误
     */
    static function checkUserLogin(){
        if(!self::checkUserLoginStatus(DI()->request->get('user_id'),DI()->request->get('login_token'))){
            $time = empty($_SERVER['REQUEST_TIME'])?time():$_SERVER['REQUEST_TIME'];
            $ret = array('code' => Common_Code::LOGIN_NOT,
                'data' => array() ,
                'msg' => T("user_not_login"),
                'time'=>$time
            );
            DI()->response->setData($ret);
            DI()->response->output();
            exit;
        }
    }

    /**
     * 获取登录类型
     */
    static function getLoginType($client_type = ''){
        $client_type = $client_type ? $client_type : DI()->request->get('ct');
        switch(strtolower($client_type)){
            case 'web':
                return Common_Conf::LOGIN_TYPE_WEB;
            case 'android':
            case 'andr':
                return Common_Conf::LOGIN_TYPE_ANDROID;
            case 'ios':
            case 'apple':
            case 'iphone':
                return Common_Conf::LOGIN_TYPE_IOS;
            default:
                return Common_Conf::LOGIN_TYPE_OTHER;
        }
    }

    /**
     * 时间或时间戳转时间 //TODO 废弃
     * @param $string
     * @return bool|int
     */
    static function strToUnixTime($string){
        //如果是时间
        $time = strtotime($string);
        if($time > 0 && $time < 2147454848){
            return $time;
        }

        //如果是Unix时间戳
        $int = intval($string);
        if($int && $int < 2147454848){
            return $int;
        }

        //都不是返回错误
        return false;
    }

    /**
     * 替换敏感词汇
     * @param $string
     * @param $filename
     * @return mixed
     */
    static function banWordsReplace($string,$filename){
        $file = API_ROOT.'/Data/ban/'.$filename;
        if(file_exists($file)){
            if($data = file_get_contents($file)){
                $words_array = explode("|",$data);
                $string = str_replace($words_array,"***",$string);
            }
        }

        return $string;
    }

    /**
     * 屏蔽敏感词汇
     * @param $string
     * @param $filename
     * @return mixed
     */
    static function banWordsForbid($string,$filename){
        $file = API_ROOT.'/Data/ban/tree/'.$filename.'.tree';
        if($string){ //$string不为空时验证
            if(file_exists($file)){
                $resTrie = trie_filter_load($file);
                $res = trie_filter_search($resTrie, $string);
                if($res){
                    $ret = array('code' => Common_Code::BAN_WORDS,
                        'data' => array() ,
                        'msg' => T("ban_words"),
                        'time'=>time()
                    );
                    DI()->response->setData($ret);
                    DI()->response->output();
                    exit;
                }
            }
            return $string;
        }
        return '';
    }

    /**
     * 将关联二维数组转化成mysql可以用的索引数组
     * @param array $arr 需要转换的关联数组
     * @param string $key 关联数组中键值
     * @return array 返回的索引数组
     * example
     *
     * $data = array(
    array('id' => 1) ,
    array('id' => 2) ,
    array('id' => 3) ,
     * )
     * 转换结果 $res = array( 1 , 2 , 3)
     */
    static function getId($arr,$key = 'id'){
        if($arr){
            foreach($arr as $v){
                $id[] = $v[$key];
            }
        } else  {
            $id = array();
        }
        return $id;
    }
}
