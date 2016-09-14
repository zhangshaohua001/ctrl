<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-4
 * Time: 上午9:39
 */
 
class Api_Config extends Api_Base{
    public function getRules()
    {
        return array(
            '*' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),
            'setTestTime' => array(
                'test_time1' => array('name' => 'time1','type' => 'string','require' => true,'desc'=>'每日测试提醒时间1(mm:hh格式，24小时制)'),
                'test_time2' => array('name' => 'time2','type' => 'string','require' => true,'desc'=>'每日测试提醒时间2(mm:hh格式，24小时制)'),
            ),
        );
    }

    /**
     * 设置用户每日测试提醒时间
     * @desc 设置用户每日测试提醒时间
     * @return string data.msg 固定值success，判断code即可
     */
    public function setTestTime(){
        $domain = new Domain_Config();
        $params = array('user_id'=>$this->user_id,'test_time1'=>$this->test_time1,'test_time2'=>$this->test_time2);
        $rs = $domain->setTestTime($params);
        return $rs;
    }
}