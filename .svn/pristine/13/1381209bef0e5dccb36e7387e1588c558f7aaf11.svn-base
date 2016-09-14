<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-1
 * Time: 上午11:58
 */
 
class Api_Clock extends Api_Base{
    public function getRules()
    {
        return array(
            '*' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),
            'set' => array(
                'info' => array('name' => 'info','type' => 'string','require' => true,'desc'=>'闹钟信息（标题）'),
                'remark' => array('name'=>'remark','type'=>'string','desc'=>'备注'),
                'pre_complete_time' => array('name'=>'pre_complete_time','type'=>'date','format'=>'timestamp','require'=>true,'desc'=>'目标开始时间'),
                'remind_time' => array('name'=>'remind_time','type'=>'string','require'=>true,'desc'=>'每日提醒时间(hh:mm格式，24小时制)'),
                'status' => array('name'=>'status','type'=>'enum','range'=> array(0,1),'default' => 1 ,'desc'=>'闹钟状态(1开启)')
            ),
            'get' => array(
                'id' => array('name'=>'clock_id','type'=>'int','require'=>true,'desc'=>'闹钟id')
            ),
            'getAll' => array(
                'count' => array('name'=>'count','type'=>'int','default'=>10,'min'=>3,'max'=>20,'desc'=>'每页数量'),
                'page' => array('name'=>'page','type'=>'int','default'=>1,'min'=>1,'desc'=>'当前页数')
            ),
            'delete' => array(
                'id' => array('name'=>'clock_id','type'=>'string','require'=>true,'desc'=>'闹钟id，多个id可以用,(英文逗号)隔开')
            ),
            'update' => array(
                'id' => array('name'=>'clock_id','type'=>'int','require'=>true,'desc'=>'闹钟id'),
                'info' => array('name' => 'info','type' => 'string','require' => true,'desc'=>'闹钟信息（标题）'),
                'remark' => array('name'=>'remark','type'=>'string','desc'=>'备注'),
                'pre_complete_time' => array('name'=>'pre_complete_time','type'=>'date','format'=>'timestamp','require'=>true,'desc'=>'目标开始时间'),
                'remind_time' => array('name'=>'remind_time','type'=>'string','require'=>true,'desc'=>'每日提醒时间(hh:mm格式)'),
                'status' => array('name'=>'status','type'=>'enum','range'=> array(0,1),'default' => 1 ,'desc'=>'闹钟状态(1开启)'),
            ),
            'complete' => array(
                'id' => array('name'=>'clock_id','type'=>'string','require'=>true,'desc'=>'闹钟id，多个id可以用,(英文逗号)隔开'),
            ),
            'share' => array(
                'clock_id' => array('name'=>'clock_id','type'=>'int','require'=>true,'desc'=>'闹钟id')
            ),
        );
    }

    /**
     * 闹钟设置
     * @desc 用户填入信息设置新闹钟
     * @return int data.clock_id 闹钟id
     */
    public function set(){
        $domain = new Domain_Clock();
        //组合参数
        $params = array(
            "user_id" => $this->user_id,
            "info" => Common_Func::banWordsForbid($this->info,"clock"),
            "remark" => Common_Func::banWordsForbid($this->remark,"clock"),
            "pre_complete_time" => $this->pre_complete_time,
            "remind_time" => $this->remind_time,
            "status" => $this->status,
        );

        $rs = $domain->set($params);
        return $rs;
    }

    /**
     * 获取闹钟信息
     * @desc 根据闹钟id获取
     * @return string data.id 闹钟id
     * @return string data.info 闹钟信息（标题）
     * @return string data.remark 闹钟备注
     * @return string data.pre_complete_time 目标开始时间
     * @return string data.remind_time 每日提醒时间
     * @return string data.is_complete 是否完成，1完成，0未完成
     * @return string data.complete_time 完成时间，完成未时间戳，未完成未0
     * @return string data.status 开启状态，1开启，0关闭
     * @return string data.create_time 闹钟创建时间
     */
    public function get(){
        $domain = new Domain_Clock();
        //组合参数
        $params = array(
            'user_id' => $this->user_id,
            'id' => $this->id
        );

        $rs = $domain->get($params);
        return $rs;
    }

    /**
     * 根据用户id获取闹钟信息
     * @desc 根据用户id获取闹钟信息
     * @return array data.list 闹钟信息列表
     * @return string data.list.id 闹钟id
     * @return string data.list.info 闹钟信息（标题）
     * @return string data.list.remark 闹钟备注
     * @return string data.list.pre_complete_time 目标开始时间
     * @return string data.list.remind_time 每日提醒时间
     * @return string data.list.is_complete 是否完成，1完成，0未完成
     * @return string data.list.complete_time 完成时间，完成未时间戳，未完成未0
     * @return string data.list.status 开启状态，1开启，0关闭
     * @return string data.list.create_time 闹钟创建时间
     */
    public function getAll(){
        $domain = new Domain_Clock();
        //组合参数
        $params = array(
            'user_id' => $this->user_id,
            'count' => intval($this->count),
            'page' => intval($this->page),
        );

        $rs = $domain->getAll($params);
        return $rs;
    }

    /**
     * 根据闹钟id删除闹钟
     * @desc 根据闹钟id删除闹钟
     * @return int data.count 删除的条数
     */
    public function delete(){
        $domain = new Domain_Clock();
        //组合参数
        $params = array(
            'user_id' => $this->user_id,
            'id' => $this->id
        );

        $rs = $domain->delete($params);
        return $rs;
    }

    /**
     * 根据闹钟id更新闹钟信息
     * @desc 根据闹钟id更新闹钟信息
     * @return string data.msg 成功未固定值success，只需判断code是否为0
     */
    public function update(){
        $domain = new Domain_Clock();
        //组合参数
        $params = array(
            'user_id' => $this->user_id,
            'id' => $this->id,
            'info' => Common_Func::banWordsForbid($this->info,"clock"),
            'remark' => Common_Func::banWordsForbid($this->remark,"clock"),
            'pre_complete_time' => $this->pre_complete_time,
            'remind_time' => $this->remind_time,
            'status' => $this->status,
        );

        $rs = $domain->update($params);
        return $rs;
    }

    /**
     * 设置闹钟为完成
     * @desc 根据闹钟id设置闹钟为完成
     * @return string data.msg 成功未固定值success，只需判断code是否为0
     */
    public function complete(){
        $domain = new Domain_Clock();
        //组合参数
        $params = array(
            'user_id' => $this->user_id,
            'id' => $this->id
        );

        $rs = $domain->complete($params);
        return $rs;
    }

    /**
     * 分享激励闹钟
     * @desc 激励闹钟分享
     * @return int data.share_id 分享id
     * @return int data.title 分享标题
     * @return int data.info 分享内容
     * @return int data.picture 分享图片链接地址
     * @return int data.url 分享页面链接地址
     */
    public function share(){
        $domain = new Domain_Clock();
        //组合参数
        $params = array(
            "user_id" => $this->user_id,
            "clock_id" => $this->clock_id,
        );

        $rs = $domain->share($params);
        return $rs;
    }
}
