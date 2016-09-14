<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-3
 * Time: 下午12:03
 */

class Domain_Msg extends Domain_CheckLogin{
    public $model_msg; //用户模型
    public function __construct()
    {
        parent::__construct();
        $this->model_msg = new Model_Msg();
    }

    public function encourage($params){
        $params['msg_type'] = Common_Conf::MSG_TYPE_ENCOURAGE;
        return self::send($params);
    }

    public function send($params){
        //获取用户id
        $model_user = new Model_User();
        $target_id = $model_user->getUserIdByMobile($params['mobile']);

        if(!$target_id){ //该帐号不存在
            $this->result['code'] = Common_Code::DATA_NOT_EXIST;
            $this->result['msg'] = T('data_not_exist');
            return $this->result;
        }

        //不能给自己发消息
        /*if($params['user_id'] == $target_id){
            $this->result['code'] = Common_Code::CAN_NOT_SEND_MSG_TO_SELF;
            $this->result['msg'] = T("can_not_send_msg_to_self");
            return $this->result;
        }*/

        //写入信息
        $id = $this->model_msg->insertMsg($params['user_id'],$target_id,$params['msg'],$params['msg_type']);
        $this->result['data']['msg_id'] = $id;
        return $this->result;
    }

    /**
     * 获取发送消息的信息
     */
    public function getSendInfo($params){
        $rs = self::_getInfo($params,"user_id");
        if($rs['data']){
            $model_user = new Model_User();
            $rs['data']['target_nickname'] = $model_user->getNicknameById($rs['data']['target_id']);

            unset($rs['data']['is_read']);
        }
        return $rs;
    }

    /**
     * 获取收到消息的信息
     */
    public function getRecInfo($params){
        $rs = self::_getInfo($params,"target_id");
        if($rs['data']){
            //将未读状态置已读
            if($rs['data']['is_read'] != 1 && $rs['data']['msg_type'] != 0){
                $this->model_msg->setRead($params['id']);
            }
            $model_user = new Model_User();
            $rs['data']['user_nickname'] = $model_user->getNicknameById($rs['data']['user_id']);

            unset($rs['data']['is_read']);
        }
        return $rs;
    }

    /**
     * 获取收到系统消息的信息
     */
    public function getSysRecInfo($params){
        $msg = $this->model_msg->getSysMsgById($params['id']);
        if(!$msg){ //消息不存在
            $this->result['code'] = Common_Code::DATA_NOT_EXIST;
            $this->result['msg'] = T('data_not_exist');
            return $this->result;
        }

        //写入消息阅读记录
        $this->model_msg->insertSysMsgRead($params);

        $this->result['data'] = $msg;
        return $this->result;
    }

    /**
     * 获取消息信息
     */
    private function _getInfo($params,$column){
        $msg = $this->model_msg->_getMsgById($params['id'],array($column=>$params['user_id']));

        if(!$msg){ //消息不存在
            $this->result['code'] = Common_Code::DATA_NOT_EXIST;
            $this->result['msg'] = T('data_not_exist');
            return $this->result;
        }

        $this->result['data'] = $msg;
        return $this->result;
    }

    /**
     * 获取用户发送消息列表
     */
    public function getSendList($params){
        return $this->_getList("user_id",$params);
    }

    /**
     * 获取用户收到消息列表
     */
    public function getRecList($params){
        return $this->_getList("target_id",$params);
    }

    /**
     * 获取用户收到系统消息列表
     */
    public function getSysRecList($params){
        $msg = $this->model_msg->getSysMsgList(array(),$params);

        $this->result['data']['list'] = $msg ? $msg : array();
        return $this->result;
    }

    /**
     * 获取用户消息列表
     */
    private function _getList($column,$params){
        $msg = $this->model_msg->getMsgByUserId(array($column=>$params['user_id']),$params);

        $this->result['data']['list'] = $msg ? $msg : array();
        return $this->result;
    }

    /**
     * 回复消息
     */
    public function reply($params){
        //检查消息是否已经回复过
        if($this->model_msg->getReplyById($params['id'])){
            $this->result['code'] = Common_Code::MSG_HAVE_REPLY;
            $this->result['msg'] = T('msg_have_reply');
            return $this->result;
        }

        //执行更新
        $rs = $this->model_msg->replyMsg($params['id'],$params['user_id'],$params['reply']);

        if($rs === false){
            $this->result['code'] = Common_Code::DATA_UPDATE_FAILED;
            $this->result['msg'] = T('data_update_failed');
            return $this->result;
        }

        $this->result['data']['msg_id'] = $params['id'];
        return $this->result;
    }

    /**
     * 删除消息
     */
    public function delete($params){
        if($this->model_msg->deleteMsg($params['id'],array("user_id"=>$params['user_id']))){
            $this->result['data']['msg'] = 'success';
            return $this->result;
        } else {
            $this->result['code'] = Common_Code::DATA_DELETE_FAILED;
            $this->result['msg'] = T('data_delete_failed');
            return $this->result;
        }
    }

    /**
     * 获取激励消息
     */
    public function _getEncourageMsg($params){
        //查找出用户已读系统消息id
        $sys_read_id = $this->model_msg->getSysMsgRead($params['user_id']);
        //查找出所有系统消息id
        $sys_id = $this->model_msg->getSysMsgId();
        //计算出用户未读系统消息id
        $sys_unread_id = array_diff(Common_Func::getId($sys_id,'id'),Common_Func::getId($sys_read_id,'msg_id'));

        $msg = $this->model_msg->getEncourageMsgList(implode(",",$sys_unread_id),$params);

        return $msg;
    }

    /**
     * 获取激励消息
     */
    public function getEncourageMsg($params){
        $msg = self::_getEncourageMsg($params);

        $this->result['data']['list'] = $msg ? $msg : array();
        return $this->result;
    }
}