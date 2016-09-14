<?php

/**
 * 用户相关接口
 */
class Api_User extends Api_Base {

    public function getRules() {
        return array(
            'login' => array(
                'mobile' => array('name' => 'mobile', 'type' => 'string', 'min' => 11,'max'=>11,'require' => true,'desc'=>'手机号'),
                'zone'=> array('name'=> 'zone','type'=>'string','min'=>1,'max'=>5,'default'=>'86','desc'=>'区号'),
                'code'=> array('name'=> 'code','type'=>'string','min'=>4,'max'=>4,'require'=>true,'desc'=>'验证码'),
            ),

            'loginOrg' => array(
                'login_type' => array('name' => 'login_type', 'type' => 'int', 'min' => 1,'max'=>9,'require' => true,'desc'=>'登录类型：1QQ、2微信、3微博'),
                'access_token' => array('name' => 'access_token', 'type' => 'string','require' => true,'desc'=>'登录成功返回认证标识，第三方登录必有'),
                'nickname'=> array('name'=> 'nickname','type'=>'string','desc'=>'用户昵称，第三方登录必有'),
            ),

            'info' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),

            'logout' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),


            'setPassword' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'password' => array('name' => 'password','type'=>'string','min'=>6,'max'=>30,'require'=>true,'desc'=>'密码'),
            ),

            'updatePassword' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'old_password' => array('name' => 'old_password','type'=>'string','min'=>6,'max'=>30,'require'=>true,'desc'=>'旧密码'),
                'password' => array('name' => 'password','type'=>'string','min'=>6,'max'=>30,'require'=>true,'desc'=>'新密码'),
            ),

            'resetPassword' => array(
                'account' => array('name' => 'account', 'type' => 'string', 'min' => 11,'max'=>11,'require' => true,'desc'=>'手机号'),
                'zone'=> array('name'=> 'zone','type'=>'string','min'=>1,'max'=>5,'default'=>'86','desc'=>'区号'),
                'code'=> array('name'=> 'code','type'=>'string','min'=>4,'max'=>4,'require'=>true,'desc'=>'验证码'),
                'password' => array('name' => 'password','type'=>'string','min'=>6,'max'=>30,'require'=>true,'desc'=>'密码'),
            )
        );
    }

    /**
     * 手机号登录接口
     * @desc 免密码使用验证码直接登录
     * @return int code 操作码，0表示成功，其他表示失败
     * @return int data.user_id 用户id
     * @return string data.nickname 用户昵称
     * @return int data.last_login_time 上次登录时间
     * @return string data.last_login_ip 上次登录ip
     * @return int data.login_count 登录次数
     * @return int data.login_type 上次登录类型,0其他,1Web,2Android,3IOS
     * @return string data.login_token 登录唯一验证标识
     * @return string msg 提示信息
     * @return int time 请求时间
     */
    public function login(){
        //短信验证码错误
     /*   if(($status = Common_Func::checkSMSCode($this->mobile,$this->code,$this->zone)) != 200){
            return $this->showData(array('status'=>$status),Common_Code::CODE_WRONG,T('code_wrong'));
        }*/

        $user = new Domain_User();
        //组合数据
        $params=array('mobile'=>$this->mobile);
        $rs = $user->login($params);
        return $rs;
    }
/*
    public function setPassword(){
        $user = new Domain_User();
        //组合数据
        $param = array('user_id' => $this->user_id,'password'=>$this->password,'session_id'=>$this->session_id);
        $rs = $user->setPassword($param);
        return $rs;
    }*/

    /**
     * 第三方登录接口
     * @desc 第三方登录接口
     * @return int code 操作码，0表示成功，其他表示失败
     * @return int data.user_id 用户id
     * @return string data.nickname 用户昵称
     * @return int data.last_login_time 上次登录时间
     * @return string data.last_login_ip 上次登录ip
     * @return int data.login_count 登录次数
     * @return int data.login_type 上次登录类型,0其他,1Web,2Android,3IOS
     * @return string data.login_token 登录唯一验证标识
     * @return string msg 提示信息
     * @return int time 请求时间
     */
    public function loginOrg(){
        $user = new Domain_User();
        //组合数据
        $params=array('login_type'=>$this->login_type,'access_token'=>$this->access_token,'nickname'=>$this->nickname);
        $rs = $user->loginOrg($params);
        return $rs;
    }

    /**
     * 获取用户信息
     * @desc 点击个人信息页时请求此接口
     * @return int code 操作码，0表示成功，其他表示失败
     * @return int data.user_id 用户id
     * @return string data.nickname 用户昵称
     * @return string data.test_time_list.time1 每日测试提醒时间2(hh:mm格式，24小时制)
     * @return string data.test_time_list.time2 每日测试提醒时间2(hh:mm格式，24小时制)
     * @return array data.energy 用户能量信息
     * @return string data.energy.last_value 上次测试能量值
     * @return string data.energy.all_value 总能量值
     * @return string data.energy.test_time 上次测试时间
     * @return string data.energy.test_count 总测试次数
     * @return array data.rank 能量排名
     * @return int data.rank.test 上次测试排名
     * @return int data.rank.all 总能量排名
     * @return string msg 提示信息
     * @return int time 请求时间
     */
    public function info(){
        $user = new Domain_User();
        //组合数据
        $params = array('user_id'=>$this->user_id);
        $rs = $user->info($params);
        return $rs;
    }

    /**
     * 用户注销登录
     * @desc 用户注销登录，已经登出会提示错误
     * @return string data.msg 固定值success，判断code是否为０即可
     */
    public function logout(){
        $user = new Domain_User();
        //组合数据
        $params = array('user_id'=>$this->user_id,'login_session'=>$this->login_token);
        $rs = $user->logout($params);
        return $rs;
    }
}
