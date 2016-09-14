<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-3
 * Time: 下午12:05
 */
 
class Model_Msg extends PhalApi_Model_NotORM{
    protected function getTableName($id)
    {
        return 'msg';
    }

    /**
     * 插入消息
     */
    public function insertMsg($user_id,$target_id,$msg,$type){
        $params = array("user_id"=>$user_id,"target_id"=>$target_id,"msg"=>$msg,'msg_type' => $type,'create_time'=>time());
        $insert = DI()->notorm->msg;
        $insert->insert($params);
        $id = $insert->insert_id();
        return $id;
    }

    /**
     * 根据id获取消息
     */
    public function _getMsgById($id,$params = array()){
        $params['id'] = $id;
        $params['isdelete'] = 0;
        return DI()->notorm->msg->where($params)->select("id msg_id,user_id,target_id,msg_type,msg,reply,create_time,update_time reply_time,isread is_read")->fetch();
    }

    /**
     * 根据用户id获取消息
     */
    public function getMsgByUserId($condition,$params){
        $condition['isdelete'] = 0;
        $select = "id msg_id,msg_type,msg,create_time";
        if(isset($condition['target_id'])){
            $select .= ",isread is_read";
        }
        return DI()->notorm->msg->where($condition)->select($select)->order("id desc")->limit(($params['page']-1)*$params['count'],$params['count'])->fetchAll();
    }

    /**
     * 根据id获取未被删除的消息
     */
    public function getMsgById($id,$params = array()){
        $params["isdelete"] = 0;
        return self::_getMsgById($id,$params);
    }

    /**
     * 根据id获取系统消息
     */
    public function getSysMsgById($id){
        return DI()->notorm->msg->where("id = ? AND msg_type = 0",$id)->select("msg,create_time")->fetch();
    }

    /**
     * 获取系统消息列表
     */
    public function getSysMsgList($condition,$params){
        $condition['isdelete'] = 0;
        $condition['msg_type'] = 0;
        return DI()->notorm->msg->where($condition)->select("id msg_id,msg,create_time")->order("id desc")->limit(($params['page']-1)*$params['count'],$params['count'])->fetchAll();
    }

    /**
     * 回复消息
     */
    public function replyMsg($msg_id,$target_id,$reply){
        return DI()->notorm->msg->where("id = ? AND target_id = ? AND isdelete = 0 AND msg_type <> 0",$msg_id,$target_id)->update(array("reply"=>$reply,"update_time"=>time()));
    }

    public function getReplyById($msg_id){
        return DI()->notorm->msg->where("id = ? AND isdelete = 0",$msg_id)->fetch("reply");
    }

    /**
     * 删除消息
     */
    public function deleteMsg($id,$params){
        $params["id"] = $id;
        return DI()->notorm->msg->where($params)->update(array("isdelete" => 1));
    }

    /**
     * 将消息设为已读
     */
    public function setRead($id){
        DI()->notorm->msg->where("id = ? AND isdelete = 0",$id)->update(array('isread'=>1));
    }

    /**
     * 获取已读系统消息id
     */
    public function getSysMsgRead($user_id){
        return DI()->notorm->msg_read->where("user_id",$user_id)->select("msg_id")->fetchAll();
    }

    /**
     * 获取系统消息id
     */
    public function getSysMsgId(){
        return DI()->notorm->msg->where("msg_type = 0")->select("id")->fetchAll();
    }

    /**
     * 获取激励消息列表
     */
    public function getEncourageMsgList($unread_id,$params){
        $condition = "(isdelete = 0 AND target_id = {$params['user_id']} AND isread = 0)";
        if($unread_id){
            $condition = "(msg.id IN ({$unread_id})) OR ".$condition;
        }
        $prefix = DI()->config->get('dbs.tables.__default__.prefix'); //表前缀
        $page_start = ($params['page']-1)*$params['count'];
        $page_count = $params['count'];

        $sql = "SELECT msg.id,msg_type,nickname,msg,create_time FROM {$prefix}msg AS msg JOIN {$prefix}user_info AS user_info ON msg.user_id = user_info.user_id WHERE {$condition} ORDER BY msg.id desc LIMIT {$page_start},{$page_count}";
        $rows = $this->getORM()->queryAll($sql, array());
        return $rows;
    }

    /**
     * 写入消息阅读记录
     */
    public function insertSysMsgRead($params){
        $msg_read =  DI()->notorm->msg_read;

        $param = array('msg_id'=>$params['id'],'user_id'=>$params['user_id']);
        //查找是否有记录
        $read_flag = $msg_read->where($param)->count();
        if(!$read_flag){ //无记录插入
            $param['create_time'] = time();
            $msg_read->insert($param);
        }
    }
}