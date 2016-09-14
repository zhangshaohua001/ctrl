<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-3
 * Time: 上午11:58
 */
 
class Api_Msg extends Api_Base{
    public function getRules(){
        return array(
            '*' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),
            'encourage' => array(
                'mobile' => array('name' => 'mobile', 'type' => 'string', 'min' => 11,'max'=>11,'require' => true,'desc'=>'好友手机号'),
                'msg' => array('name'=>'msg','type'=>'string','require'=>true,'desc'=>'激励好友的信息')
            ),
            'send' => array(
                'mobile' => array('name' => 'mobile', 'type' => 'string', 'min' => 11,'max'=>11,'require' => true,'desc'=>'好友手机号'),
                'msg' => array('name'=>'msg','type'=>'string','require'=>true,'desc'=>'激励好友的信息'),
                'msg_type' => array('name'=>'msg_type','type'=>'int','require'=>false,'default' => 1,'min'=>1,'desc'=>'信息类型,必须大于0,1普通消息，2激励消息，其他类型再议')
            ),
            'getSendInfo' => array(
                'id' => array('name'=>'msg_id','type'=>'int','require'=>true,'desc'=>'消息id')
            ),
            'getSendList' => array(
                'count' => array('name'=>'count','type'=>'int','default'=>10,'min'=>3,'max'=>20,'desc'=>'每页数量'),
                'page' => array('name'=>'page','type'=>'int','default'=>1,'min'=>1,'desc'=>'当前页数')
            ),
            'getRecInfo' => array(
                'id' => array('name'=>'msg_id','type'=>'int','require'=>true,'desc'=>'消息id')
            ),
            'getSysRecInfo' => array(
                'id' => array('name'=>'msg_id','type'=>'int','require'=>true,'desc'=>'消息id')
            ),
            'getRecList' => array(
                'count' => array('name'=>'count','type'=>'int','default'=>10,'min'=>3,'max'=>20,'desc'=>'每页数量'),
                'page' => array('name'=>'page','type'=>'int','default'=>1,'min'=>1,'desc'=>'当前页数')
            ),
            'getSysRecList' => array(
                'count' => array('name'=>'count','type'=>'int','default'=>10,'min'=>3,'max'=>20,'desc'=>'每页数量'),
                'page' => array('name'=>'page','type'=>'int','default'=>1,'min'=>1,'desc'=>'当前页数')
            ),
            'reply' => array(
                'id' => array('name'=>'msg_id','type'=>'int','require'=>true,'desc'=>'消息id'),
                'reply' => array('name'=>'reply_msg','type'=>'string','require'=>true,'desc'=>'回复的信息')
            ),
            'delete' => array(
                'id' => array('name'=>'msg_id','type'=>'int','require'=>true,'desc'=>'消息id'),
            ),
            'getEncourageMsg' => array(
                'count' => array('name'=>'count','type'=>'int','default'=>10,'min'=>3,'max'=>20,'desc'=>'每页数量'),
                'page' => array('name'=>'page','type'=>'int','default'=>1,'min'=>1,'desc'=>'当前页数')
            ),
        );
    }

    /**
     * 给好友发送激励消息
     * @desc 给好友发送激励消息
     * @return int data.msg_id 插入消息的id
     */
    public function encourage(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"mobile"=>$this->mobile,"msg"=>Common_Func::banWordsForbid($this->msg,"msg"));
        $rs = $domain->encourage($params);
        return $rs;
    }

    /**
     * 给好友发送消息
     * @desc 给好友发送消息，注意消息类型
     * @return int data.msg_id 插入消息的id
     */
    public function send(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"mobile"=>$this->mobile,"msg"=>Common_Func::banWordsForbid($this->msg,"msg"),'msg_type'=>$this->msg_type);
        $rs = $domain->send($params);
        return $rs;
    }

    /**
     * 获取已发送消息信息
     * @desc 根据消息id获取已发送消息信息
     * @return string data.msg_id 消息id
     * @return string data.user_id 发送消息用户id(即当前用户id)
     * @return string data.user_id 接收消息用户id
     * @return string data.msg_type 信息类型,0系统消息,1普通消息，2激励消息，其他类型再议
     * @return string data.msg 消息内容
     * @return string data.reply 回复内容（可能为空null，注意判断）
     * @return string data.create_time 消息发送时间
     * @return string data.reply_time 消息回复时间（可能为空null，注意判断）
     * @return string data.target_nickname 目标用户昵称
     */
    public function getSendInfo(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"id"=>$this->id);
        $rs = $domain->getSendInfo($params);
        return $rs;
    }

    /**
     * 获取已发送消息列表
     * @desc 根据用户id获取已发送消息列表
     * @return array data.list 消息列表
     * @return string data.list.msg_id 消息id
     * @return string data.list.msg_type 消息类型,0系统消息,1普通消息，2激励消息，其他类型再议
     * @return string data.list.msg 消息内容
     * @return string data.list.create_time 消息发送时间
     */
    public function getSendList(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"count"=>$this->count,"page"=>$this->page);
        $rs = $domain->getSendList($params);
        return $rs;
    }

    /**
     * 获取已收到消息信息
     * @desc 根据消息id获取已收到消息信息
     * @return string data.msg_id 消息id
     * @return string data.user_id 发送消息用户id
     * @return string data.user_id 接收消息用户id(即当前用户id)
     * @return string data.msg_type 消息类型,0系统消息,1普通消息，2激励消息，其他类型再议
     * @return string data.msg 消息内容
     * @return string data.reply 回复内容（可能为空null，注意判断）
     * @return string data.create_time 消息发送时间
     * @return string data.reply_time 消息回复时间（可能为空null，注意判断）
     * @return string data.user_nickname 发送消息用户昵称
     */
    public function getRecInfo(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"id"=>$this->id);
        $rs = $domain->getRecInfo($params);
        return $rs;
    }

    /**
     * 获取已收到系统消息信息
     * @desc 根据消息id获取已收到系统消息信息
     * @return string data.msg 消息内容
     * @return string data.create_time 消息发送时间
     */
    public function getSysRecInfo(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"id"=>$this->id);
        $rs = $domain->getSysRecInfo($params);
        return $rs;
    }

    /**
     * 获取已接收消息列表
     * @desc 根据用户id获取已接收消息列表
     * @return array data.list 消息列表
     * @return string data.list.msg_id 消息id
     * @return string data.list.msg_type 消息类型,0系统消息,1普通消息，2激励消息，其他类型再议
     * @return string data.list.msg 消息内容
     * @return string data.list.create_time 消息发送时间
     * @return string data.list.is_read 消息查看状态，0未读1已读
     */
    public function getRecList(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"count"=>$this->count,"page"=>$this->page);
        $rs = $domain->getRecList($params);
        return $rs;
    }

    /**
     * 获取已接收系统消息列表
     * @desc 根据用户id获取已接收消息列表
     * @return array data.list 消息列表
     * @return string data.list.msg_id 消息id
     * @return string data.list.msg 消息内容
     * @return string data.list.create_time 消息发送时间
     */
    public function getSysRecList(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"count"=>$this->count,"page"=>$this->page);
        $rs = $domain->getSysRecList($params);
        return $rs;
    }

    /**
     * 回复消息
     * @desc 已经回复过的消息不能再回复
     * @return int data.msg_id 消息id，可以忽略，直接判断code
     */
    public function reply(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"id"=>$this->id,"reply"=>Common_Func::banWordsForbid($this->reply,"msg"));
        $rs = $domain->reply($params);
        return $rs;
    }

    /**
     * 删除消息
     * @desc 根据消息id删除消息，消息发送者才可以删除
     * @return string data.msg 固定值success，判断code即可
     */
    public function delete(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"id"=>$this->id);
        $rs = $domain->delete($params);
        return $rs;
    }

    /**
     * 获取用户未读激励消息
     * @desc 获取用户未读激励消息
     * @return string data.id 消息id
     * @return string data.msg_type 消息类型
     * @return string data.msg 消息内容
     * @return string data.create_time 消息发送时间
     */
   /* public function getEncourageMsg(){
        $domain = new Domain_Msg();
        $params = array("user_id"=>$this->user_id,"count"=>$this->count,"page"=>$this->page);
        $rs = $domain->getEncourageMsg($params);
        return $rs;
    }*/
}