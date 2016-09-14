<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-31
 * Time: 下午1:43
 */
 
 class Api_Energy extends Api_Base{
     public function getRules() {
         return array(
             '*' => array(
                 'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                 'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
             ),
             'test' => array(
                 'value' => array('name' => 'value', 'type' => 'float', 'require' => true,'desc'=>'用户能量'),
             ),
             'lookFriendEnergy' => array(
                 'mobile' => array('name' => 'mobile', 'type' => 'string', 'min' => 11,'max'=>11,'require' => true,'desc'=>'好友手机号'),
             ),
             'lookFriendsEnergy' => array(
                 'mobile' => array('name' => 'mobiles', 'type' => 'array', 'require' => true,'desc'=>'多个好友手机号'),
             ),
             'share' => array(
                 'info' => array('name'=>'energy_value','type'=>'int','require'=>true,'desc'=>'能量值')
             ),
         );
     }

     /**
      * 用户测试能量
      * @desc 用户测试后写入数据库的能量
      * @return int code 操作码，0表示成功，其他表示失败
      * @return int data.user_id 用户id
      * @return string data.value 能量值
      * @return int data.test_time 测试时间（UNIX时间戳）
      * @return string data.test_date 测试日期（yyyymmdd格式）
      * @return string msg 提示信息
      * @return int time 请求时间
      */
     public function test(){
         $domain = new Domain_Energy();
         $params = array('user_id'=>$this->user_id,'value'=>$this->value);
         $rs = $domain->test($params);
         return $rs;
     }

     /**
      * 查看好友能量
      * @desc 根据好友手机号查看好友能量
      * @return string data.mobile 好友手机号，无记录为空
      * @return string data.last_value 好友最后测试能量，无记录为空
      * @return string data.all_value 好友总能量，无记录为空
      * @return string data.test_time 最后测试时间，无记录为空
      */
     public function lookFriendEnergy(){
         $domain = new Domain_Energy();
         $params = array('user_id'=>$this->user_id,'mobile'=>$this->mobile);
         $rs = $domain->lookFriendEnergy($params);
         return $rs;
     }

     /**
      * 查看多个好友的能量
      * @desc 根据好友手机号查看好友能量（支持多个手机号）
      * @return array data.list 好友能量值数组
      * @return string data.list.mobile 好友手机号，无记录为空
      * @return string data.list.last_value 好友最后测试能量，无记录为空
      */
     public function lookFriendsEnergy(){
         $domain = new Domain_Energy();
         $params = array('user_id'=>$this->user_id,'mobile'=>$this->mobile);
         $rs = $domain->lookFriendsEnergy($params);
         return $rs;
     }

     /**
      * 能量值分享
      * @desc 能量值分享
      * @return int data.share_id 分享id
      * @return int data.title 分享标题
      * @return int data.info 分享内容
      * @return int data.picture 分享图片链接地址
      * @return int data.url 分享页面链接地址
      */
     public function share(){
         $domain = new Domain_Energy();
         //组合参数
         $params = array(
             "user_id" => $this->user_id,
             "info" => $this->info,
         );

         $rs = $domain->share($params);
         return $rs;
     }
 }