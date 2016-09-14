<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-1
 * Time: 上午11:52
 */
 
class Api_Main extends Api_Base{
    public function getRules()
    {
        return array(
            '*' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),
            'initialize' => array(
                'count' => array('name'=>'count','type'=>'int','default'=>3,'min'=>1,'max'=>10,'desc'=>'请求获取的闹钟数量'),
            ),
        );
    }

    /**
     * 首页初始化
     * @desc 用户登录之后才能初始化
     * @return string data.energy.user_id 用户id
     * @return string data.energy.last_value 上次测试能量值
     * @return string data.energy.all_value 总能量值
     * @return string data.energy.test_time 最后测试时间
     * @return string data.energy.test_count 测试总次数
     * @return string data.energy.advice 能量值建议
     * @return array data.clock 闹钟信息
     * @return string data.clock.id 闹钟id
     * @return string data.clock.info 闹钟信息（标题）
     * @return string data.clock.remark 闹钟备注
     * @return string data.clock.pre_complete_time 目标完成时间
     * @return string data.clock.remind_time 每日提醒时间
     * @return string data.clock.is_complete 是否完成，1完成，0未完成
     * @return string data.clock.complete_time 完成时间，完成未时间戳，未完成未0
     * @return string data.clock.status 开启状态，1开启，0关闭
     * @return string data.clock.create_time 闹钟创建时间
     * @return string data.encourage.id 消息id
     * @return string data.encourage.msg_type 消息类型
     * @return string data.encourage.nickname 发送消息用户昵称
     * @return string data.encourage.msg 消息内容
     * @return string data.encourage.create_time 消息发送时间
     */
    public function initialize(){
        $domain = new Domain_Main();
        //组合参数
        $params = array(
            'user_id' => $this->user_id,
            'count' => $this->count
        );

        $rs = $domain->initialize($params);
        return $rs;
    }
}